import 'package:flutter/material.dart';
import '../widgets/course_headr.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Course/widgets/search_bar.dart';
import 'package:academia/Features/Course/widgets/course_card .dart';// ✅ IMPORT YOUR CARD

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const courseHeader(),

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

                      /// 📚 COURSES
                      const CourseCard(
                        title: "Cloud Computing",
                        doctor: "Dr. Youssef Senousy",
                        type: "Core",
                        credits: "3 credits",
                        day: "Sunday",
                        time: "11:00 - 12:00",
                        location: "Room B3",
                        color: AppColors.accentProgramming1,
                      ),

                      const SizedBox(height: 12),

                      const CourseCard(
                        title: "Digital Marketing",
                        doctor: "Dr. Kholoud Farag",
                        type: "Elective",
                        credits: "2 credits",
                        day: "Monday",
                        time: "11:00 - 12:00",
                        location: "Lab 1",
                        color: AppColors.accentAI,
                      ),

                      const SizedBox(height: 12),

                      const CourseCard(
                        title: "Design Patterns",
                        doctor: "Dr. Marwa Ahmed",
                        type: "Core",
                        credits: "3 credits",
                        day: "Tuesday",
                        time: "11:00 - 12:00",
                        location: "Room B3",
                        color: AppColors.accentProgramming1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔻 BOTTOM NAV (you said you already made it — keep or remove as you want)
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