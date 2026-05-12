import 'package:academia/Features/Registiration_admin/widgets/RegistirationHeader.dart';
import 'package:academia/Features/Registiration_admin/widgets/RegistirationStatusCard.dart';
import 'package:academia/Features/Registiration_admin/widgets/Active_Section.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/widgets/side_menu.dart';
import 'package:academia/Features/Registiration_admin/widgets/AddPlanButton.dart';

class RegistrationScreen  extends StatelessWidget {
  const RegistrationScreen ({super.key});

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
                      
                       RegistrationStatusCard(),
                       SizedBox(height: 18),
                       ActivePlansSection(),
                       SizedBox(height: 18),
                       AddNewPlan()



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