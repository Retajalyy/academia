import 'package:flutter/material.dart';
import '../widgets/exam_header.dart';
import '../widgets/exam_card.dart';
import '../../../Core/utilities/colors.dart';

class ExamScheduleScreen2 extends StatelessWidget {
  const ExamScheduleScreen2({super.key});

  /// 🔥 Local Section Title Widget (replacement)
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color:  Color(0xFF908C8C),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,

      body: SafeArea(
        child: Column(
          children: [
            const ExamHeader(),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.screenBackground,
                ),

                child: ListView(
                  children: [
                    // 🔶 Highlighted
                    const ExamCard(
                      isHighlighted: true,
                      title: "Midterms exams period",
                      subtitle: "April 23 - May 1, 2026",
                    ),

                    const SizedBox(height: 16),

                    // ✅ NEXT EXAM
                    sectionTitle("Next Exam"),
                    const SizedBox(height: 12),

                    const ExamCard(
                      date: "24",
                      month: "APR",
                      title: "Cloud Computing",
                      time: "10:00 AM - 11:00 AM",
                      room: "Room 3B",
                      isNext: true,
                    ),

                    const SizedBox(height: 16),

                    // UPCOMING
                    sectionTitle("Upcoming"),
                    const SizedBox(height: 12),

                    const ExamCard(
                      date: "25",
                      month: "APR",
                      title: "Internet of Things",
                      time: "10:00 AM - 11:00 AM",
                      room: "Room 5B",
                    ),

                    const SizedBox(height: 16),

                    // COMPLETED
                    sectionTitle("Completed"),
                    const SizedBox(height: 12),

                    const ExamCard(
                      date: "23",
                      month: "APR",
                      title: "Introduction to AI",
                      time: "10:00 AM - 11:00 AM",
                      room: "Room 5B",
                      isCompleted: true,
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