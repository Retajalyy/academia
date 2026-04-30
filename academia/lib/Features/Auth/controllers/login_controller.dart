import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _auth = AuthService();

  var isLoading = false.obs;
  var obscurePassword = true.obs;

  Future<void> login(String id, String password) async {
    isLoading.value = true;

    final success = await _auth.login(id, password);

    isLoading.value = false;

    if (success) {
      debugPrint("LOGIN SUCCESS: credentials verified for user ID $id");
      print("LOGIN SUCCESS: credentials verified for user ID $id");

      Get.offAllNamed('/HomePage');
    } else {
      debugPrint("LOGIN FAILED: invalid credentials for user ID $id");
      print("LOGIN FAILED: invalid credentials for user ID $id");

      Get.snackbar("Error", "Invalid credentials");
    }
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }
}