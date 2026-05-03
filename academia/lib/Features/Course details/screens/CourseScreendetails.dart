import 'package:flutter/material.dart';
import '../widgets/course_headr.dart';
import '../widgets/course_stat.dart';
import '../widgets/material_list.dart';
import '../../../Core/utilities/colors.dart';

class CourseScreenDetails extends StatelessWidget {
  const CourseScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const CourseHeaderDetails(),

            /// 🔵 BODY
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.screenBackground,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 📊 COURSE STATS
                      const CourseStats(),

                      const SizedBox(height: 20),

                      /// 📁 COURSE MATERIAL
                      const CourseMaterialList(),

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
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
