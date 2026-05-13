import 'package:get/get.dart';
import 'package:academia/Features/Schedule/model/class_model.dart';
import '../service/schedule_service.dart';

class ScheduleController extends GetxController {
  final ScheduleService _service = ScheduleService();

  // Observable state
  final Rx<DateTime> selectedDate = DateTime(2025, 9, 9).obs;
  final RxList<ClassModel> classes = <ClassModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    ever(selectedDate, (_) => _loadClasses());
    _loadClasses();
  }

  void selectDate(DateTime date) => selectedDate.value = date;

  Future<void> refresh() => _loadClasses();

  Future<void> _loadClasses() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final result = await _service.fetchClasses(selectedDate.value);
      classes.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Failed to load schedule. Please try again.';
      classes.clear();
    } finally {
      isLoading.value = false;
    }
  }
}