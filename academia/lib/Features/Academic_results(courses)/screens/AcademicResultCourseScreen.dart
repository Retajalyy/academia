import 'package:flutter/material.dart';
import '../widgets/academic_results_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/semster_result.dart';
import '../widgets/semster_header.dart'; // 👈 added

import '../../../Core/utilities/colors.dart';

class AcademicResultsCourseScreen extends StatelessWidget {
  const AcademicResultsCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            const AcademicResultsHeader(),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.screenBackground,
                ),
                child: ListView(
                  children: const [
                    
                    /// 🔹 NEW HEADER ROW
                    SemesterHeaderRow(),

                    SizedBox(height: 12),

                    /// 🔹 SEMESTER CARD
                    SemesterResultsCard(),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}