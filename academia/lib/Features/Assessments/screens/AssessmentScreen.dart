// lib/features/assessment/presentation/screens/assessment_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/assessment_controller.dart';
import '../widgets/Assessment_headr.dart';
import '../widgets/search_bar.dart';
import '../widgets/stats_card.dart';
import '../widgets/course_card.dart';
import '../../../Core/utilities/colors.dart';

class Assessmentscreen extends StatelessWidget {
  const Assessmentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Put the controller — or find it if already put upstream (e.g. in a binding-free initializer).
    final controller = Get.put(AssessmentController());

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const AssessmentHeader(),

            /// 🔵 BODY
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: AppColors.babyblue,
                ),
                child: Obx(() {
                  // ── Loading state ──────────────────────────────────────────
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // ── Error state ────────────────────────────────────────────
                  if (controller.errorMessage.value.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(controller.errorMessage.value),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: controller.loadData,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  // ── Success state ──────────────────────────────────────────
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🔍 SEARCH
                        SearchBarWidget(
                          onChanged: controller.onSearchChanged,
                        ),

                        const SizedBox(height: 18),

                        /// 📊 STATS
                        if (controller.stats.value != null)
                          Row(
                            children: [
                              Expanded(
                                child: StatCard(
                                  label: 'Avg midterm',
                                  value: controller.stats.value!.avgMidterm
                                      .toStringAsFixed(0),
                                  showOutOfHundred: true,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: StatCard(
                                  label: 'Avg participation',
                                  value: controller
                                      .stats.value!.avgParticipation
                                      .toStringAsFixed(0),
                                  showOutOfHundred: true,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: StatCard(
                                  label: 'Avg attendance',
                                  value:
                                      '${controller.stats.value!.avgAttendance.toStringAsFixed(0)}%',
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 18),

                        /// 📚 COURSE CARDS
                        if (controller.filteredAssessments.isEmpty)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text('No courses found.'),
                            ),
                          )
                        else
                          ...controller.filteredAssessments.map(
                            (a) => CourseCard(
                              title: a.courseTitle,
                              type: a.courseType,
                              midterm: a.midterm,
                              midtermStatus: a.midtermStatus,
                              participation: a.participation,
                              participationStatus: a.participationStatus,
                              attendance: a.attendance,
                              attendanceStatus: a.attendanceStatus,
                              progress: a.progress,
                              progressColor: a.courseType.toLowerCase() == 'core'
                                  ? AppColors.primaryBlue
                                  : AppColors.secondaryYellow,
                            ),
                          ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}