import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class RegistrationStatusCard extends StatelessWidget {
  const RegistrationStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0XFFE1F5EF),
        borderRadius: BorderRadius.circular(14),

        // BORDER
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),

        // SHADOW
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0XFFCFF2E7),
                width: 4,
              ),

              // SHADOW FOR OUTER CIRCLE
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkGreen.withOpacity(0.15),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),

            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: AppColors.darkGreen,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Registration is currently open",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGreen,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  "Closes May 10, 2026 • 8 days remaining",
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.smalltext,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(20),

              // BUTTON SHADOW
             
            ),

            child: const Text(
              "Live",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}