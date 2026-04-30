import 'package:get/get.dart';
import 'package:academia/Features/Auth/screens/login_screen.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() => LoginScreen());
  }
}