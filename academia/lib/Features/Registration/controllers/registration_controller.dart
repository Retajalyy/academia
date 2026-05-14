import 'package:get/get.dart';
import '../models/registration_model.dart';
import '../services/registration_service.dart';

class RegistrationController extends GetxController {
  final RegistrationService _service;

  RegistrationController({RegistrationService? service})
      : _service = service ?? RegistrationService();

  // ── UI State ────────────────────────────────────────────────────────────────
  final Rx<RegistrationState> registrationState =
      RegistrationState.open.obs;

  final RxBool isLoading = false.obs;
  final RxBool isSubmitting = false.obs;
  final RxString errorMessage = ''.obs;

  // ── Tab / Group Selection ───────────────────────────────────────────────────
  final RxInt selectedTabIndex = 0.obs; // 0 = Semester A, 1 = Semester B
  final RxString selectedGroupId = ''.obs;
  final RxList<CourseGroup> availableGroups = <CourseGroup>[].obs;

  // ── Schedule / Courses ──────────────────────────────────────────────────────
  final RxList<CourseWithWarning> scheduledCourses = <CourseWithWarning>[].obs;
  final RxList<String> selectedCourseIds = <String>[].obs;

  // ── Closed state data ───────────────────────────────────────────────────────
  final Rx<SemesterInfo?> semesterInfo = Rx<SemesterInfo?>(null);

  // ── Not-opened-yet state data ───────────────────────────────────────────────
  final Rx<BalanceInfo?> balanceInfo = Rx<BalanceInfo?>(null);

  // ─────────────────────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    isLoading.value = true;
    try {
      final state = await _service.fetchRegistrationState();
      registrationState.value = state;

      switch (state) {
        case RegistrationState.open:
          await _loadGroups();
          break;
        case RegistrationState.closed:
          await _loadSemesterInfo();
          break;
        case RegistrationState.notOpenedYet:
          await _loadBalanceInfo();
          break;
      }
    } catch (e) {
      errorMessage.value = 'Failed to load registration data. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  // ── Group / Tab helpers ──────────────────────────────────────────────────────

  Future<void> _loadGroups() async {
    final tab = selectedTabIndex.value == 0 ? 'A' : 'B';
    final groups = await _service.fetchGroups(tab);
    availableGroups.assignAll(groups);

    if (groups.isNotEmpty) {
      selectedGroupId.value = groups.first.id;
      _populateSchedule(groups.first);
    }
  }

  void onTabChanged(int index) {
    if (selectedTabIndex.value == index) return;
    selectedTabIndex.value = index;
    _loadGroups();
  }

  void onGroupSelected(CourseGroup group) {
    selectedGroupId.value = group.id;
    _populateSchedule(group);
  }

  void _populateSchedule(CourseGroup group) {
    scheduledCourses.assignAll(
      group.lectures.map((l) => CourseWithWarning(lecture: l)).toList(),
    );
  }

  // ── Closed state helpers ─────────────────────────────────────────────────────

  Future<void> _loadSemesterInfo() async {
    semesterInfo.value = await _service.fetchSemesterInfo();
  }

  // ── Not-opened helpers ───────────────────────────────────────────────────────

  Future<void> _loadBalanceInfo() async {
    balanceInfo.value = await _service.fetchBalanceInfo();
  }

  // ── Actions ──────────────────────────────────────────────────────────────────

  Future<void> confirmRegistration() async {
    errorMessage.value = '';

    // Validate: check for course warnings
    final hasPrereqIssues =
        scheduledCourses.any((c) => c.warningMessage != null);
    if (hasPrereqIssues) {
      errorMessage.value =
          'Prerequisites are not met. Resolve issues before confirming.';
      return;
    }

    isSubmitting.value = true;
    try {
      final success = await _service.submitRegistration(
        groupId: selectedGroupId.value,
        courseIds: selectedCourseIds.toList(),
      );
      if (success) {
        Get.snackbar(
          'Success',
          'Registration confirmed!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = 'Submission failed. Please try again.';
    } finally {
      isSubmitting.value = false;
    }
  }

  Future<void> payNow() async {
    isSubmitting.value = true;
    try {
      final url = await _service.initiatePayment(
        amount: balanceInfo.value?.outstandingAmount ?? 0,
      );
      // TODO: launch URL in browser / WebView
      Get.snackbar('Redirecting', 'Opening payment portal...',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      errorMessage.value = 'Payment initiation failed.';
    } finally {
      isSubmitting.value = false;
    }
  }

  void clearError() => errorMessage.value = '';

  // ── Computed helpers ─────────────────────────────────────────────────────────

  int get totalCreditHours {
    final group = availableGroups
        .firstWhereOrNull((g) => g.id == selectedGroupId.value);
    return group?.creditHours ?? 0;
  }

  bool get hasWarnings =>
      scheduledCourses.any((c) => c.warningMessage != null);

  CourseGroup? get selectedGroup =>
      availableGroups.firstWhereOrNull((g) => g.id == selectedGroupId.value);
}