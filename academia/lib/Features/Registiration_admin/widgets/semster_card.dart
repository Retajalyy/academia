// lib/Features/registration/widgets/semester_card.dart

import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class SemesterCard extends StatelessWidget {
  final String title;
  final String faculty;
  final double progress;
  final String progressText;

  final String courses;
  final String enrolled;
  final String groups;

  final String openDate;
  final String closeDate;

  const SemesterCard({
    super.key,
    required this.title,
    required this.faculty,
    required this.progress,
    required this.progressText,
    required this.courses,
    required this.enrolled,
    required this.groups,
    required this.openDate,
    required this.closeDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),


      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlue,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            faculty,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.smalltext,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Text(
                "Overall enrollment",
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.smalltext,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              Text(
                progressText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

       ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: SizedBox(
    height: 8,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.greytext,
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        FractionallySizedBox(
          widthFactor: progress,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    ),
  ),
),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _InfoBox(
                  value: courses,
                  label: "Courses",
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InfoBox(
                  value: enrolled,
                  label: "Enrolled",
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InfoBox(
                  value: groups,
                  label: "Groups",
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFFF3F5F7),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Opened",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.smalltext,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        openDate,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFFF3F5F7),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Closes",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.smalltext,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        closeDate,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fail,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String value;
  final String label;

  const _InfoBox({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Color(0XFFEBF4FC),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlue,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.smalltext,
            ),
          ),
        ],
      ),
    );
  }
}