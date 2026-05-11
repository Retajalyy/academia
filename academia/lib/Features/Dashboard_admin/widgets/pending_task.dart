import 'package:academia/Core/utilities/colors.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/text_style.dart';
import 'pending_task_card.dart';

class PendingTasksSection extends StatelessWidget {
  const PendingTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Pending Tasks',
            style: TextStyles.title.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 14),

          /// NOTIFY — blue
          const PendingTaskCard(
            icon: Icons.credit_card_outlined,
            title: '34 students have\noutstanding fees',
            subtitle: 'Deadline Apr 30 · 8 days left',
            buttonText: 'Notify',
            leftBarColor: AppColors.accentAI,
            iconBgColor: Color(0xFFFFF3DF),
            iconColor: Color(0xFFB18334),
            buttonColor: AppColors.accentAI,
            buttonTextColor: AppColors.accentProgramming1,
          ),

          const SizedBox(height: 10),

          /// WARN — amber
          const PendingTaskCard(
            icon: Icons.warning_amber_rounded,
            title: '18 students reached\nabsence limit',
            subtitle: '4 absences · Issue formal warning',
            buttonText: 'Warn',
            leftBarColor: AppColors.accentAI,
            iconBgColor: Color(0xFFFFF3DF),
            iconColor: Color(0xFFB18334),
            buttonColor: AppColors.accentAI,
            buttonTextColor: AppColors.accentProgramming1,
          ),

          const SizedBox(height: 10),

          /// BLOCK — red
          const PendingTaskCard(
            icon: Icons.block_outlined,
            title: '7 students exceeded\nabsence limit',
            subtitle: 'Blocked from final\nexamination',
            buttonText: 'Block',
            leftBarColor: AppColors.fail,
            iconBgColor: Color(0xFFFFF2F3),
            iconColor: AppColors.fail,
            buttonColor: Color(0xFFFFF2F3),
            buttonTextColor: AppColors.fail,
          ),

        ],
      ),
    );
  }
}