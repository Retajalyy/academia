import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';

class courseHeader extends StatelessWidget {
  const courseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryBlue,

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // ✅ prevents overflow

            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  Icon(Icons.notifications, color: Colors.white, size: 28),
                ],
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                "Courses",
                style: TextStyles.header2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                ),
              ),

              const SizedBox(height: 6),

              // Subtitle
              Text(
                "View and manage your courses",
                style: TextStyles.caption.copyWith(
                  color: Color(0xFFDEDEDE),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}