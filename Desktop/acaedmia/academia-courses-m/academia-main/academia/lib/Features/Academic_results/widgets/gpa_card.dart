import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class GpaCard extends StatelessWidget {
  const GpaCard({super.key});

  Widget semesterBox(String num, String sem) {
    return Container(
      width: 64,
      height: 51,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            sem,
            style: const TextStyle(
              color: Colors.white70,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget progressBar(double value) {
    return Container(
      height: 7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD3D4D4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: value,
            child: Container(
              color: AppColors.secondaryYellow,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER ROW (fixed overflow-safe)
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Cumulative GPA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Text(
                      "Semesters 1-7",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              /// GPA TEXT (no UI change, only safe)
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "3.61",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "/4.0",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Color(0xFFD3D4D4),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              progressBar(0.7),

              const SizedBox(height: 9),

              /// SEMESTERS GRID (keeps same design)
              Wrap(
                spacing: 21,
                runSpacing: 10,
                children: [
                  semesterBox("3.9", "Sem 1"),
                  semesterBox("3.6", "Sem 2"),
                  semesterBox("3.3", "Sem 3"),
                  semesterBox("3.7", "Sem 4"),
                  semesterBox("3.8", "Sem 5"),
                  semesterBox("4.0", "Sem 6"),
                  semesterBox("3.8", "Sem 7"),
                  semesterBox("-", "Sem 8"),
                ],
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),

        const SizedBox(height: 6),

        /// FOOTER (unchanged UI)
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.8,
                  color: Color(0xFFD3D4D4),
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Year 4 • 2025-2026 (current)",
                style: TextStyle(
                  color: Color(0xFF979696),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFD3D4D4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}