import 'package:academia/Features/Registiration_admin/widgets/RegistirationHeader.dart';
import 'package:academia/Features/Registiration_admin/widgets/NoRegistration_section.dart';
import 'package:academia/Features/Registiration_admin/widgets/Registiration_steps.dart';
import 'package:academia/Features/Registiration_admin/widgets/NoRegistiration_buttons.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/widgets/side_menu.dart';

class NoRegistrationScreen  extends StatelessWidget {
  const NoRegistrationScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
       drawer: const SideMenu(activeItem: "Registration"), 
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const RegistrationHeader(),

            /// 🔵 BODY
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.babyblue,
                ),
                child: const SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 28),

              /// EMPTY STATE
              NoRegistrationSection(),
               SizedBox(height: 28),
               RegistrationSteps(),
               SizedBox(height: 28),
               RegistrationButtons(),
                      
                      

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