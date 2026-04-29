import 'package:flutter/material.dart';
import '../widgets/exam_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/exam_card.dart';
import '../widgets/section_title.dart'; // ✅ ADD THIS
import '../../../Core/utilities/colors.dart';

class ExamScheduleScreen2 extends StatelessWidget {
  const ExamScheduleScreen2({super.key});

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
                  children: const [
                    // 🔶 Highlighted
                    ExamCard(
                      isHighlighted: true,
                      title: "Midterms exams period",
                      subtitle: "April 23 - May 1, 2026",
                    
                    ),

                    SizedBox(height: 16),

                    // ✅ SECTION TITLE ADDED HERE
                    SectionTitle(title: "Next Exam"),

                    SizedBox(height: 12),

                    // 🔵 Next Exam
                    ExamCard(
                      date: "24",
                      month: "APR",
                      title: "Cloud Computing",
                      time: "10:00 AM - 11:00 AM",
                      room: "Room 3B",
                      isNext: true,
                    ),

                    SizedBox(height: 16),

                    // ⚪ Upcoming SECTION
                    SectionTitle(title: "Upcoming "),

                    SizedBox(height: 12),

                    ExamCard(
                      date: "25",
                      month: "APR",
                      title: "Internet of Things",
                      time: "10:00 AM - 11:00 AM",
                      room: "Room 5B",
                    ),

                    SizedBox(height: 16),

                    // ⚫ Completed SECTION
                    SectionTitle(title: "Completed"),

                    SizedBox(height: 12),

                    ExamCard(
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

      bottomNavigationBar: const BottomNav(),
    );
  }
}