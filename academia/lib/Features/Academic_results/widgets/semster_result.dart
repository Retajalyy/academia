import 'package:flutter/material.dart';

import '../../../Core/utilities/colors.dart';
import '../model/subject_result_model.dart';
import 'subject_row.dart';

class SemesterResultsCard extends StatelessWidget {
  final SemesterResultModel semester;

  const SemesterResultsCard({
    super.key,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        children: [
          /// HEADER
          Padding(
            padding: const EdgeInsets.all(10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Semester info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        semester.semesterName,
                        style: const TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        '${semester.year} · ${semester.term}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                /// GPA Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4DE),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'GPA ',
                          style: TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                        ),

                        TextSpan(
                          text: semester.semesterGpa.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Inter',
                          ),
                        ),

                        const TextSpan(
                          text: '/4.0',
                          style: TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),

          /// SUBJECTS
          ...semester.subjects.asMap().entries.map((entry) {
            final index = entry.key;
            final subject = entry.value;

            final isLast =
                index == semester.subjects.length - 1;

            return SubjectRow(
              subject: subject.subject,
              grade: '${subject.grade}',
              gpa: subject.gpa.toStringAsFixed(1),
              letter: subject.letter,
              badgeColor: subject.badgeColor,
              letterColor: subject.letterColor,
              isLast: isLast,
            );
          }).toList(),
        ],
      ),
    );
  }
}