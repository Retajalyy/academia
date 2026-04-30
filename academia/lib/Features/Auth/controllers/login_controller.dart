import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _auth = AuthService();

  var isLoading = false.obs;
  var obscurePassword = true.obs;

  /// 🔥 ADD THIS
  var rememberMe = false.obs;

  Future<void> login(String id, String password) async {
    isLoading.value = true;

    final success = await _auth.login(id, password);

    isLoading.value = false;

    if (success) {
      debugPrint("LOGIN SUCCESS: credentials verified for user ID $id");

      /// 🔥 OPTIONAL: you can use this later
      if (rememberMe.value) {
        debugPrint("User chose to be remembered");
      }

      Get.offAllNamed('/HomePage');
    } else {
      debugPrint("LOGIN FAILED: invalid credentials for user ID $id");

      Get.snackbar("Error", "Invalid credentials");
    }
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// 🔥 ADD THIS
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}