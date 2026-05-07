import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  Widget row({
    required String left,
    required String right,
    TextStyle? leftStyle,
    TextStyle? rightStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(left, style: leftStyle),
          const Spacer(),
          Text(right, style: rightStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ORDER SUMMARY",
          style: TextStyle(
            color: AppColors.textgrey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              row(
                left: "Fee",
                right: "Graduation Project Fee",
                leftStyle: const TextStyle(color: Color(0xFF848282), fontSize: 15, fontWeight: FontWeight.w500,fontFamily: 'Inter'),
                rightStyle: const TextStyle(color: AppColors.accentProgramming1,fontSize: 15, fontWeight: FontWeight.w500,fontFamily: 'Inter'),
              ),
              row(
                left: "Semester",
                right: "Semester 8",
                leftStyle: const TextStyle(color: Color(0xFF848282), fontSize: 15, fontWeight: FontWeight.w500,fontFamily: 'Inter'),
                rightStyle: const TextStyle(color: AppColors.accentProgramming1,fontSize: 15, fontWeight: FontWeight.w500,fontFamily: 'Inter'),
              ),
              const Divider(),
              row(
                left: "Total",
                right: "5,000EGP",
                leftStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
                rightStyle: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}