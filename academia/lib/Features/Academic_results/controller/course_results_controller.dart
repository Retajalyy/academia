import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/subject_result_model.dart';
import 'package:academia/Features/Academic_results/service/academic_result_service.dart';
class CourseResultsController extends GetxController {
  final AcademicResultsService _service;

  CourseResultsController({
    AcademicResultsService? service,
  }) : _service = service ?? AcademicResultsService();

  final RxList<SemesterResultModel> allSemesters =
      <SemesterResultModel>[].obs;

  final Rxn<SemesterResultModel> selectedSemester =
      Rxn<SemesterResultModel>();

  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadAllSemesters();
  }

  Future<void> loadAllSemesters() async {
    _setLoading(true);

    hasError.value = false;

    try {
      final results = await _service.fetchAllSemesters();

      allSemesters.assignAll(results);

      if (results.isNotEmpty) {
        selectedSemester.value = results.first;
      }

      hasError.value = false;
    } catch (e, stack) {
      debugPrint(
        '❌ loadAllSemesters error: $e\n$stack',
      );

      _setError('Failed to load semesters: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadSemester(int semesterNumber) async {
    _setLoading(true);

    hasError.value = false;

    try {
      final result =
          await _service.fetchSemesterResult(
        semesterNumber,
      );

      if (result != null) {
        selectedSemester.value = result;
        hasError.value = false;
      } else {
        _setError(
          'Semester $semesterNumber not found.',
        );
      }
    } catch (e, stack) {
      debugPrint(
        '❌ loadSemester error: $e\n$stack',
      );

      _setError(
        'Failed to load semester $semesterNumber: $e',
      );
    } finally {
      _setLoading(false);
    }
  }

  void selectSemester(
    SemesterResultModel semester,
  ) {
    selectedSemester.value = semester;
  }

  Future<void> retry() async {
    await loadAllSemesters();
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void _setError(String message) {
    hasError.value = true;
    errorMessage.value = message;
  }
}