// lib/Features/Registration/widgets/no_registration_section.dart

import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class NoRegistrationSection extends StatelessWidget {
  const NoRegistrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
               
                color: Color(0XFFE5F1FA),
              ),
              child: const Icon(
                Icons.edit_square,
                color: AppColors.primaryBlue,
                size: 40,
              ),
            ),

            Positioned(
              right: -6,
              top: -6,
              child: Container(
                width: 23,
                height: 23,
                decoration: const BoxDecoration(
                  color: AppColors.accentAI,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 19,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        const Text(
          "No active registration",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "There is no open semester plan right now. Create a new plan to allow students to register for their upcoming semester courses.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              color: AppColors.smalltext,
            ),
          ),
        ),
      ],
    );
  }
}