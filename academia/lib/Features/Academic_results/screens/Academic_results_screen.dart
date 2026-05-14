import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/academic_results_header.dart';
import '../widgets/gpa_card.dart';
import '../widgets/result_semseter.dart';
import '../controller/academic_results_controller.dart';
import '../../../Core/utilities/colors.dart';

class AcademicResultsScreen extends StatelessWidget {
  const AcademicResultsScreen({super.key});

  Widget _yearDivider(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: [
          const Expanded(
              child: Divider(thickness: 0.8, color: Color(0xFFD3D4D4))),
          const SizedBox(width: 8),
          Text(
            label,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    // ✅ No binding needed — controller is created here
    final ctrl = Get.put(AcademicResultsController());

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            const AcademicResultsHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.babyblue,
                ),
                child: Obx(() {
                  // Loading state
                  if (ctrl.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Error state
                  if (ctrl.errorMessage.value.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.red, size: 48),
                          const SizedBox(height: 12),
                          Text(ctrl.errorMessage.value,
                              textAlign: TextAlign.center),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: ctrl.refresh,
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  // Build semester list with year dividers
                  final semsByYear = ctrl.semestersByYear;
                  final List<Widget> items = [];

                  items.add(const GpaCard());
                  items.add(const SizedBox(height: 12));

                  for (final entry in semsByYear.entries) {
                    // Year divider (skip for the current/top year)
                    if (entry.key != semsByYear.keys.first) {
                      items.add(_yearDivider(entry.key));
                      items.add(const SizedBox(height: 12));
                    }

                    for (final sem in entry.value) {
                      items.add(ResultSemesterCard(
                        status: sem.statusLabel,
                        semester: sem.semesterLabel,
                        subtitle: sem.subtitle,
                        gpa: sem.gpaDisplay,
                        statusColor: const Color(0xFF266192),
                      ));
                      items.add(const SizedBox(height: 12));
                    }
                  }

                  return RefreshIndicator(
                    onRefresh: ctrl.refresh,
                    child: ListView(children: items),
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