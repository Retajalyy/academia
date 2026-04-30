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
            /// 🔵 TOP LOGO
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(
                      "lib/assets/Images/logoo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            /// ⚪ BOTTOM SECTION
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// DASH
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      /// WELCOME TEXT
                      const Text(
                        "Welcome back",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// SUBTEXT ✅ NOW WILL APPEAR
                    Text(
  "Sign in with your saved credential",
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey.shade600,
  ),
),
                      const SizedBox(height: 25),

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

                      /// PASSWORD
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

                      /// LOGIN BUTTON
                      Obx(() {
                        return PrimaryButton(
                          text: controller.isLoading.value
                              ? "Loading..."
                              : "Sign in",
                          onPressed: controller.isLoading.value
                              ? null
                              : handleLogin,
                        );
                      }),
                    ],
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