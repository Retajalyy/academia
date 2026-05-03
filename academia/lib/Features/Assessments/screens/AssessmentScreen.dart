import 'package:flutter/material.dart';
import '../widgets/Assessment_headr.dart';
import '../widgets/search_bar.dart';
import '../widgets/stats_card.dart';
import '../widgets/course_card.dart';
import '../../../Core/utilities/colors.dart';

class Assessmentscreen extends StatelessWidget {
  const Assessmentscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: AppColors.screenBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔍 SEARCH
                      const SearchBarWidget(),

                      const SizedBox(height: 18),

                      /// 📊 STATS
                      Row(
                        children: const [
                          Expanded(
                            child: StatCard(
                              label: "Avg midterm",
                              value: "74",
                              showOutOfHundred: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: StatCard(
                              label: "Avg participation",
                              value: "88",
                              showOutOfHundred: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: StatCard(
                              label: "Avg attendance",
                              value: "80%",
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// 📚 COURSE CARDS

                      CourseCard(
                        title: "Cloud Computing",
                        type: "Core",
                        midterm: "10/15",
                        midtermStatus: "Average",
                        participation: "25/25",
                        participationStatus: "Excellent",
                        attendance: "92%",
                        attendanceStatus: "Excellent",
                        progress: 0.9,
                        progressColor: AppColors.primaryBlue,
                      ),

                      CourseCard(
                        title: "Digital Marketing",
                        type: "Elective",
                        midterm: "8/15",
                        midtermStatus: "Below avg",
                        participation: "25/25",
                        participationStatus: "Excellent",
                        attendance: "92%",
                        attendanceStatus: "Excellent",
                        progress: 0.75,
                        progressColor: AppColors.secondaryYellow,
                      ),

                      CourseCard(
                        title: "Introduction to AI",
                        type: "Core",
                        midterm: "5/15",
                        midtermStatus: "Fair",
                        participation: "25/25",
                        participationStatus: "Excellent",
                        attendance: "88%",
                        attendanceStatus: "Very Good",
                        progress: 0.5,
                        progressColor: AppColors.primaryBlue,
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔻 BOTTOM NAV
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