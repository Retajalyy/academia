import 'package:get/get.dart';
import '../model/semster_result_model.dart';
import '../service/academic_results_service.dart';

class AcademicResultsController extends GetxController {
  final AcademicResultsService _service = AcademicResultsService();

  final Rx<AcademicSummaryModel?> summary = Rx<AcademicSummaryModel?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  List<SemesterResultModel> get semesters => summary.value?.semesters ?? [];

  List<SemesterResultModel> get gpaBoxSemesters =>
      [...semesters]..sort((a, b) => a.semesterNumber.compareTo(b.semesterNumber));

  double get cumulativeGpa => summary.value?.cumulativeGpa ?? 0.0;
  double get gpaProgress => summary.value?.gpaProgress ?? 0.0;
  String get currentYearLabel => summary.value?.currentYearLabel ?? '';

  /// Groups semesters by yearLabel for the year dividers
  Map<String, List<SemesterResultModel>> get semestersByYear {
    final map = <String, List<SemesterResultModel>>{};
    for (final s in semesters) {
      map.putIfAbsent(s.yearLabel, () => []).add(s);
    }
    return map;
  }

  @override
  void onInit() {
    super.onInit();
    loadResults();
  }

  Future<void> loadResults() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      // 🔧 swap fetchMock() with fetchAcademicSummary() when API is ready
      final data = await _service.fetchMock();
      summary.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refresh() => loadResults();
}