import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academia/Features/profile/models/student_model.dart';
import 'package:academia/Features/profile/services/student_service.dart';

class ProfileController extends GetxController {
  final StudentService _service = StudentService();

  // Observable state
  final Rxn<StudentModel> student = Rxn<StudentModel>();
  final RxBool isLoading = false.obs;
  final RxBool isSaving = false.obs;
  final RxString error = ''.obs;

  // Controller for editable fields (Phone Number)
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    loadProfile();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    error.value = '';

    try {
      final data = await _service.fetchStudentProfile();
      student.value = data;
      // Initialize the text field with the current phone if available
      // Note: If StudentModel doesn't have phone, you may need to update the model.
      // phoneController.text = data.phone ?? ''; 
    } catch (e) {
      error.value = 'Failed to load profile. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  // Method triggered by the "Save" button in image_493b35.png
  Future<void> updateProfile() async {
    if (student.value == null) return;

    isSaving.value = true;
    try {
      // Assuming a service method exists to handle updates
      bool success = await _service.updateStudentPhone(phoneController.text);
      
      if (success) {
        Get.snackbar(
          "Success", 
          "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to save changes");
    } finally {
      isSaving.value = false;
    }
  }

  // Method for the "Tap to change photo" action
  Future<void> pickProfileImage() async {
    // Logic for ImagePicker would go here
    print("Opening gallery/camera...");
  }
}