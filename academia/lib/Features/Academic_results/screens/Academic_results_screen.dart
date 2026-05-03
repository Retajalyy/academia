import 'package:flutter/material.dart';
import '../widgets/academic_results_header.dart';
import '../widgets/gpa_card.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Academic_results/widgets/result_semseter.dart';

class AcademicResultsScreen extends StatelessWidget {
  const AcademicResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.screenBackground,
                ),
                child: ListView(
                  children: [
                    const GpaCard(),

                    const SizedBox(height: 12),

                    /// Semester 8
                    ResultSemesterCard(
                      status: "Not published yet",
                      semester: "Semester 8",
                      subtitle: "Year 4 . Spring 2026 . Ongoing",
                      gpa: "3.7",
                      statusColor: const Color(0xFF266192),
                    ),

                    const SizedBox(height: 12),

                    /// Semester 7
                    ResultSemesterCard(
                      status: "Latest results",
                      semester: "Semester 7",
                      subtitle: "Year 4 . Fall 2025 . 6 courses",
                      gpa: "3.8",
                      statusColor: const Color(0xFF266192),
                    ),

                    const SizedBox(height: 12),

                    /// 🔥 Divider (Year 3)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 0.8,
                              color: Color(0xFFD3D4D4),
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            "Year 3 • 2024-2025",
                            style: TextStyle(
                              color: Color(0xFF979696),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color(0xFFD3D4D4),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Semester 6
                    ResultSemesterCard(
                      status: "Completed",
                      semester: "Semester 6",
                      subtitle: "Year 3 . Spring 2024 . 6 courses",
                      gpa: "4.0",
                      statusColor: const Color(0xFFB18334),
                    ),

                    const SizedBox(height: 12),

                    /// Semester 5
                    ResultSemesterCard(
                      status: "Completed",
                      semester: "Semester 5",
                      subtitle: "Year 3 . Fall 2024 . 6 courses",
                      gpa: "3.8",
                      statusColor: const Color(0xFFB18334),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.screenBackground,
        selectedItemColor: const Color(0xFF2D4B94),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}