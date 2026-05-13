import 'package:get/get.dart';
import '../model/course_model.dart';
import '../services/course_services.dart';

/// CourseController owns all UI state for the Courses feature.
/// Inject it once with Get.put() or a GetX binding, then read it
/// anywhere with Get.find<CourseController>().
class CourseController extends GetxController {
  // ── Dependencies ───────────────────────────────────────────────────────────
  final CourseService _service;

  CourseController({CourseService? service})
      : _service = service ?? CourseService.instance;

  // ── Observable State ───────────────────────────────────────────────────────

  /// Full list fetched from the service
  final _allCourses = <CourseModel>[].obs;

  /// Filtered list shown in the UI
  final filteredCourses = <CourseModel>[].obs;

  /// Loading / error flags
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  /// Current search query
  final searchQuery = ''.obs;

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    loadCourses();

    // Reactively re-filter whenever the query changes
    ever(searchQuery, (_) => _applyFilter());
  }

  // ── Public Methods ─────────────────────────────────────────────────────────

  /// Fetches courses from the service and populates the lists.
  Future<void> loadCourses() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final courses = await _service.fetchCourses();
      _allCourses.assignAll(courses);
      _applyFilter();
    } catch (e) {
      errorMessage.value = 'Failed to load courses. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  /// Called from the SearchBarWidget's onChanged callback.
  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  /// Clear the search field and show all courses.
  void clearSearch() {
    searchQuery.value = '';
  }

  // ── Private Helpers ────────────────────────────────────────────────────────

  void _applyFilter() {
    filteredCourses.assignAll(
      _service.search(_allCourses, searchQuery.value),
    );
  }
}