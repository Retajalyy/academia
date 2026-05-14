import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../controller/academic_results_controller.dart';
import 'package:get/get.dart';

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
          Text(num,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
              )),
          Text(sem,
              style: const TextStyle(
                color: Colors.white70,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 12,
              )),
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
            child: Container(color: AppColors.secondaryYellow),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<AcademicResultsController>();

    return Obx(() {
      final boxes = ctrl.gpaBoxSemesters;

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
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Text(
                        "Semesters 1-${ctrl.semesters.where((s) => s.gpa != null).length}",
                        style: const TextStyle(
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

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ctrl.summary.value?.cumulativeGpaDisplay ?? "-",
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(
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

                progressBar(ctrl.gpaProgress),

                const SizedBox(height: 9),

                Wrap(
                  spacing: 21,
                  runSpacing: 10,
                  children: boxes
                      .map((s) => semesterBox(s.gpaDisplay, s.semesterLabel.replaceFirst("Semester ", "Sem ")))
                      .toList(),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),

          const SizedBox(height: 6),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              children: [
                const Expanded(
                    child: Divider(thickness: 0.8, color: Color(0xFFD3D4D4))),
                const SizedBox(width: 8),
                Text(
                  ctrl.currentYearLabel,
                  style: const TextStyle(
                    color: Color(0xFF979696),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                    child: Divider(thickness: 1, color: Color(0xFFD3D4D4))),
              ],
            ),
          ),
        ],
      );
    });
  }
}