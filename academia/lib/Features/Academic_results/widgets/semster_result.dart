import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import 'subject_row.dart';

class SemesterResultsCard extends StatelessWidget {
  const SemesterResultsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Semester 7',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Year 4 · Fall 2025',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    )
                  ],
                ),

                /// 🔥 UPDATED GPA (3.8 styled differently)
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
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'GPA ',
                          style: TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '3.8',
                          style: TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: '/4.0',
                          style: TextStyle(
                            color: Color(0xFFB18334),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          Divider(color: Colors.grey.shade300, height: 1),

          const SubjectRow(
            subject: 'Cloud Computing',
            grade: '98',
            gpa: '4.0',
            letter: 'A+',
            badgeColor: Color(0xFFDDEDFA),
            letterColor: AppColors.primaryBlue,
          ),

          const SubjectRow(
            subject: 'Introduction to AI',
            grade: '73',
            gpa: '3.2',
            letter: 'C',
            badgeColor: Color(0xFFFFF3DF),
            letterColor: Color(0xFFB18334),
          ),

          const SubjectRow(
            subject: 'Data Structures',
            grade: '85',
            gpa: '3.4',
            letter: 'B',
            badgeColor: Color(0xFFDDEDFA),
            letterColor: AppColors.primaryBlue,
          ),

          const SubjectRow(
            subject: 'Programming 1',
            grade: '98',
            gpa: '4.0',
            letter: 'A+',
            badgeColor: Color(0xFFDDEDFA),
            letterColor: AppColors.primaryBlue,
          ),

          const SubjectRow(
            subject: 'Digital Marketing',
            grade: '77',
            gpa: '3.0',
            letter: 'C',
            badgeColor: Color(0xFFFFF3DF),
            letterColor: Color(0xFFB18334),
          ),

          const SubjectRow(
            subject: 'Design Patterns',
            grade: '58',
            gpa: '2.3',
            letter: 'D',
            badgeColor: Color(0xFFFFE8E8),
            letterColor: Colors.red,
            isLast: true,
          ),
        ],
      ),
    );
  }
}