import 'package:academia/Features/AccountSettings_admin/widgets/AccountHeader.dart';
import 'package:academia/Features/AccountSettings_admin/widgets/University_Info.dart';
import 'package:academia/Features/AccountSettings_admin/widgets/Personal_Info.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const AccountHeader(),

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
                      /// 🏫 University Info Section
                      UniversityInfoWidget(),

                      SizedBox(height: 24),
                      PersonalInfoWidget(),
                      SizedBox(height: 24),

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