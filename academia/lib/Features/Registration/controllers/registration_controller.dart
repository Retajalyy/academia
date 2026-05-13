import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/registration_service.dart';
import '../models/registration_model.dart';
import '../bindings/registration_binding.dart';

enum RegistrationViewState { loading, error, closed, notOpened, unpaid, open }

class RegistrationController extends GetxController {
  final IRegistrationService _service;

  RegistrationController(this._service);

  // ── Observables ────────────────────────────────────
  final viewState = RegistrationViewState.loading.obs;
  final registrationData = Rxn<RegistrationData>();
  final errorMessage = RxnString();
  final selectedGroupId = ''.obs;
  final isConfirming = false.obs;
  final confirmSuccess = false.obs;

  // ── Derived getters ────────────────────────────────
  Group? get selectedGroup {
    final data = registrationData.value;
    if (data == null) return null;
    try {
      return data.groups.firstWhere((g) => g.id == selectedGroupId.value);
    } catch (_) {
      return data.groups.isNotEmpty ? data.groups.first : null;
    }
  }

  List<Course> get selectedCourses =>
      selectedGroup?.courses.where((c) => c.isSelected.value).toList() ?? [];

  bool get canConfirm =>
      selectedCourses.isNotEmpty &&
      !selectedCourses.any((c) => c.prerequisiteNote != null);

  // ── Lifecycle ──────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // ── Fetch ──────────────────────────────────────────
  Future<void> fetchData() async {
    viewState.value = RegistrationViewState.loading;
    errorMessage.value = null;

    try {
      final data = await _service.fetchRegistrationData();
      registrationData.value = data;

      if (data.groups.isNotEmpty) {
        selectedGroupId.value = data.groups.first.id;
      }

      _resolveViewState(data);
    } catch (e) {
      errorMessage.value = e.toString();
      viewState.value = RegistrationViewState.error;
    }
  }

  // ── Group selection ────────────────────────────────
  void selectGroup(String groupId) {
    if (selectedGroupId.value == groupId) return;
    selectedGroupId.value = groupId;
  }

  // ── Course toggle ──────────────────────────────────
  void toggleCourse(String courseId) {
    final course = selectedGroup?.courses.cast<Course?>().firstWhere(
      (c) => c?.id == courseId,
      orElse: () => null,
    );
    if (course == null) return;
    course.isSelected.toggle();
  }

  // ── Confirm registration ───────────────────────────
  Future<void> confirmRegistration() async {
    final data = registrationData.value;
    if (data == null || !canConfirm) return;

    isConfirming.value = true;
    confirmSuccess.value = false;

    try {
      await _service.confirmRegistration(
        semesterId: data.semester.id,
        groupId: selectedGroupId.value,
        selectedCourseIds: selectedCourses.map((c) => c.id).toList(),
      );
      confirmSuccess.value = true;

      Get.snackbar(
        'Success',
        'Registration confirmed successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF22C55E),
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(16),
      );
    } catch (e) {
      errorMessage.value = 'Failed to confirm registration: $e';

      Get.snackbar(
        'Error',
        errorMessage.value ?? 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isConfirming.value = false;
    }
  }

  // ── Helpers ────────────────────────────────────────
  void _resolveViewState(RegistrationData data) {
    if (data.hasPendingBalance) {
      viewState.value = RegistrationViewState.unpaid;
      return;
    }

    switch (data.semester.status) {
      case RegistrationStatus.open:
        viewState.value = RegistrationViewState.open;
        break;
      case RegistrationStatus.closed:
        viewState.value = RegistrationViewState.closed;
        break;
      case RegistrationStatus.notOpenedYet:
      case RegistrationStatus.unpaidBalance:
        viewState.value = RegistrationViewState.notOpened;
        break;
    }
  }
}
