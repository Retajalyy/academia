import 'package:flutter/material.dart';
import '../widgets/exam_header.dart';
import '../widgets/noexam_card.dart';
import '../widgets/while_waitingcard.dart';
import '../widgets/bottom_nav.dart';
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

            const BottomNav(),
          ],
        ),
      ),
    );
  }
}