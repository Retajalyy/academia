import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      controller.login(
        userIdController.text,
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// TOP
            const Expanded(
              flex: 3,
              child: Center(
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school, size: 50),
                ),
              ),
            ),

            /// BOTTOM
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// USER ID
                        CustomTextField(
                          controller: userIdController,
                          hint: "User ID",
                          label: "User ID",
                          icon: Icons.person,
                          validator: (v) =>
                              v == null || v.isEmpty ? "Required" : null,
                        ),

                        const SizedBox(height: 15),

                        /// PASSWORD (REACTIVE)
                        Obx(() {
                          return CustomTextField(
                            controller: passwordController,
                            hint: "Password",
                            label: "Password",
                            icon: Icons.lock,
                            isPassword: controller.obscurePassword.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscurePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePassword,
                            ),
                            validator: (v) =>
                                v == null || v.length < 6
                                    ? "Min 6 chars"
                                    : null,
                          );
                        }),

                        const SizedBox(height: 25),

                        /// BUTTON (FIXED VOID CALLBACK ERROR)
                        Obx(() {
                          return PrimaryButton(
                            text: controller.isLoading.value
                                ? "Loading..."
                                : "Sign in",

                            // ✅ FIX IS HERE
                            onPressed: controller.isLoading.value
                                ? null
                                : () => handleLogin(),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}