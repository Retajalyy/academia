// ──────────────────────────────────────────────────────
// registration/bindings/registration_binding.dart
// ──────────────────────────────────────────────────────

import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../services/registration_service.dart';

/// Lazily injects all dependencies for the Registration feature.
/// Register this binding in your AppPages / GetMaterialApp routes.
///
/// Example in app_pages.dart:
/// ```dart
/// GetPage(
///   name: Routes.REGISTRATION,
///   page: () => const RegistrationPage(),
///   binding: RegistrationBinding(),
/// )
/// ```
class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    // Service – lazyPut so it's created only when first accessed
    Get.lazyPut<IRegistrationService>(
      () => RegistrationService(),
    );

    // Controller – depends on the service above
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(Get.find<IRegistrationService>()),
    );
  }
}