// lib/Features/registration/widgets/active_plans_section.dart

import 'package:flutter/material.dart';

import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Registiration_admin/widgets/semster_card.dart';

class ActivePlansSection extends StatelessWidget {
  const ActivePlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "ACTIVE PLANS",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.smalltext,
                letterSpacing: 0.5,
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              child: const Text(
                "View all >",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        const SemesterCard(
          title: "Semester 8 · Spring 2026",
          faculty: "FCI · Year 4 · Software Engineering",
          progress: 0.70,
          progressText: "70/90 students",
          courses: "6",
          enrolled: "80%",
          groups: "3",
          openDate: "April 20, 2026",
          closeDate: "May 1, 2026",
        ),

        const SizedBox(height: 14),

        const SemesterCard(
          title: "Semester 8 · Spring 2026",
          faculty: "FCI · Year 4 · Cyber Security",
          progress: 0.48,
          progressText: "50/110 students",
          courses: "6",
          enrolled: "48%",
          groups: "2",
          openDate: "April 20, 2026",
          closeDate: "May 1, 2026",
        ),
      ],
    );
  }
}