// lib/features/assessment/presentation/controllers/assessment_controller.dart

import 'package:get/get.dart';
import '../model/assessment_model.dart';
import '../service/assessment_service.dart';

class AssessmentController extends GetxController {
  final AssessmentServiceBase _service;

  AssessmentController({AssessmentServiceBase? service})
      : _service = service ?? AssessmentService();

  // ─── Observable state ───────────────────────────────────────────────────────

  final RxList<AssessmentModel> assessments = <AssessmentModel>[].obs;
  final RxList<AssessmentModel> filteredAssessments = <AssessmentModel>[].obs;
  final Rx<AssessmentStatsModel?> stats = Rx<AssessmentStatsModel?>(null);

  final RxBool isLoading = false.obs;
  final RxBool isSearching = false.obs;
  final RxString errorMessage = ''.obs;
  final RxString searchQuery = ''.obs;

  // ─── Lifecycle ───────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    loadData();

    // React to search query changes with a small debounce
    debounce(
      searchQuery,
      (_) => _applySearch(),
      time: const Duration(milliseconds: 300),
    );
  }

  // ─── Public methods ──────────────────────────────────────────────────────────

  /// Initial / refresh load: fetches both assessments and stats in parallel.
  Future<void> loadData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final results = await Future.wait([
        _service.fetchAssessments(),
        _service.fetchStats(),
      ]);

      assessments.assignAll(results[0] as List<AssessmentModel>);
      filteredAssessments.assignAll(assessments);
      stats.value = results[1] as AssessmentStatsModel;
    } catch (e) {
      errorMessage.value = 'Failed to load assessments. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Called from the SearchBarWidget's onChanged.
  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  /// Clear search and restore the full list.
  void clearSearch() {
    searchQuery.value = '';
    filteredAssessments.assignAll(assessments);
    isSearching.value = false;
  }

  // ─── Private helpers ─────────────────────────────────────────────────────────

  Future<void> _applySearch() async {
    final query = searchQuery.value.trim();

    if (query.isEmpty) {
      filteredAssessments.assignAll(assessments);
      isSearching.value = false;
      return;
    }

    isSearching.value = true;

    try {
      final results = await _service.searchAssessments(query);
      filteredAssessments.assignAll(results);
    } catch (_) {
      // Fallback: client-side filter if service call fails
      final lower = query.toLowerCase();
      filteredAssessments.assignAll(
        assessments.where((a) => a.courseTitle.toLowerCase().contains(lower)),
      );
    } finally {
      isSearching.value = false;
    }
  }
}