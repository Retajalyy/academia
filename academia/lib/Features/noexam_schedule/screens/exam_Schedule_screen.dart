import 'package:flutter/material.dart';
import '../widgets/exam_header.dart';
import '../widgets/noexam_card.dart';
import '../widgets/while_waitingcard.dart';
import '../../../Core/utilities/colors.dart';

class ExamScheduleScreen extends StatelessWidget {
  const ExamScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,

      body: SafeArea(
        child: Column(
          children: [

            // Top Header
            const ExamHeader(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [

                    SizedBox(height: 15),

                    NoExamCard(),

                    SizedBox(height: 20),

                    WhileWaitingCard(),
                  ],
                ),
              ),
            ),
            

            
          ],
        ),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2D4B94),
        backgroundColor: AppColors.screenBackground,
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