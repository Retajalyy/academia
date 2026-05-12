import 'package:academia/Features/Dashboard_admin/widgets/pending_task.dart';
import 'package:flutter/material.dart';
import 'package:academia/Features/Dashboard_admin/widgets/Dashboard_headr.dart';
import 'package:academia/Features/Dashboard_admin/widgets/Quick_actions.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/widgets/side_menu.dart'; // 👈 add this import

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      drawer: const SideMenu(activeItem: "Dashboard"), // 👈 add this line
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const DashboardHeader(),

            /// 🔵 BODY
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.babyblue,
                ),
                child: const SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QuickActionsSection(),
                      SizedBox(height: 18),
                      PendingTasksSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}