import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _auth = AuthService();

  var isLoading = false.obs;
  var obscurePassword = true.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    final success = await _auth.login(email, password);

    isLoading.value = false;

    if (success) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }
}