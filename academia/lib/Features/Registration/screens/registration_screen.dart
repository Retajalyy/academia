import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../models/registration_model.dart';
import '../widgets/registration_app_bar.dart';
import '../widgets/registration_open.dart';
import '../widgets/registration_closed.dart';
import '../widgets/registration_not_opened.dart';

/// Pushed on top of [BottomBar] via [Get.to()].
///
/// Because [BottomBar] already owns the root [Scaffold], this screen
/// provides its own [Scaffold] with an [AppBar] so the bottom nav bar
/// is hidden while the user is inside registration — which is the
/// correct UX for a full-page flow launched from ServicesScreen.
///
/// Usage (from ServicesScreen or anywhere):
/// ```dart
/// Get.to(() => const RegistrationScreen());
/// ```
///
/// The controller is created on push and automatically deleted by GetX
/// when the route is popped, so no manual cleanup is needed.
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Created here so it is scoped to this route.
    // GetX removes it automatically when the page is popped.
    final ctrl = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      // RegistrationAppBar contains the back arrow (Get.back()) so the
      // user can return to ServicesScreen and restore the bottom nav.
      appBar: const RegistrationAppBar(),
      body: SafeArea(
        child: Obx(() {
          if (ctrl.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1A6EFF)),
            );
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: _buildBody(ctrl.registrationState.value),
          );
        }),
      ),
    );
  }

  Widget _buildBody(RegistrationState state) {
    switch (state) {
      case RegistrationState.open:
        return const RegistrationOpenWidget();
      case RegistrationState.closed:
        return const RegistrationClosedWidget();
      case RegistrationState.notOpenedYet:
        return const RegistrationNotOpenedWidget();
    }
  }
}