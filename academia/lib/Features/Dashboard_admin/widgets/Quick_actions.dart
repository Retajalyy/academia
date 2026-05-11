import 'package:academia/Core/utilities/colors.dart';
import 'package:flutter/material.dart';
import '../../../Core/utilities/text_style.dart';
import 'quick_action_item.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyles.title.copyWith(
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: const [

              Expanded(
                child: QuickActionItem(
                  icon: Icons.file_upload_outlined,
                  title: 'Upload Schedule',
                  borderColor: Color(0xFFDDEDFA),
                  iconColor:AppColors.accentProgramming1,
                  backgroundColor: Color(0xFFDDEDFA),
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: QuickActionItem(
                  icon: Icons.trending_up_rounded,
                  title: 'Upload Results',
                  borderColor: Color(0xFFDDEDFA),
                  iconColor:AppColors.accentProgramming1,
                  backgroundColor: Color(0xFFDDEDFA),
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: QuickActionItem(
                  icon: Icons.credit_card_outlined,
                  title: 'Manage Fees',
                  borderColor: Color(0xFFFFF3DF),
                  iconColor: Color(0xFFB18334),
                  backgroundColor: Color(0xFFFFF3DF),
                ),
              ),

              SizedBox(width: 8),

              Expanded(
                child: QuickActionItem(
                  icon: Icons.notifications,
                  title: 'Send Notification',
                  borderColor: Color(0xFFFFF3DF),
                  iconColor: Color(0xFFB18334),
                  backgroundColor: Color(0xFFFFF3DF),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}