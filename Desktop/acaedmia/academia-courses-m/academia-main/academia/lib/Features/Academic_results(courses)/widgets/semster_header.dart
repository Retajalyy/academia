import 'package:flutter/material.dart';
import 'package:academia/Features/Academic_results/screens/Academic_results_screen.dart';
import '../../../Core/utilities/colors.dart';
class SemesterHeaderRow extends StatelessWidget {
  const SemesterHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AcademicResultsScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 27,
            width: 27,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 21,
              color: AppColors.primaryBlue,
            ),
          ),
        ),

        const SizedBox(width: 8),

        const Text(
          'Semester 7 · Year 4 · Fall 2025',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}