import 'package:academia/Features/Dashboard_admin/screens/profile_menuScreen.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import 'stat_card.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 18,
        left: 16,
        right: 16,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [

          /// TOP BAR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  );
                },
              ),

              const Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// AVATAR WITH STROKE
              /// AVATAR WITH STROKE
GestureDetector(
  onTap: () {
    // Handle avatar tap — e.g. navigate to profile
     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileMenuScreen(),
                    ),
                  );
  },
  child: Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: AppColors.secondaryYellow,
      shape: BoxShape.circle,
      border: Border.all(
        color: const Color(0xFF2468A0),
        width: 4,
      ),
    ),
    child: const Center(
      child: Text(
        'AM',
        style: TextStyle(
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),
  ),
),
            ],
          ),

          const SizedBox(height: 18),

          /// 2x2 STATS GRID
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.6,
            children: [
              StatCard(
                icon: Icons.people_outline,
                title: 'Total\nStudents',
                value: '2,580',
                subtitle: '2nd Semester · Active',
                height: 80,
              ),
              StatCard(
                icon: Icons.account_balance_outlined,
                title: 'Faculties',
                value: '3',
                subtitle: '13 Majors total',
                height: 80,
              ),
              StatCard(
                icon: Icons.person_outline,
                title: 'Instructors',
                value: '270',
                subtitle: '128 Courses total',
                height: 80,
              ),
              StatCard(
                icon: Icons.access_time,
                title: 'Academic\nProgress',
                value: 'Week 11',
                subtitle: '16 Weeks total',
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}