import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';

class PaymentSuccessBody extends StatelessWidget {
  const PaymentSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.babyblue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Outer Circle
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: Color(0xFF07704F),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Success Title
          Text(
            "Payment Successful!",
            style: TextStyles.title.copyWith(
              color: Color(0xFF07704F),
              fontWeight: FontWeight.w600,
              fontSize: 25
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            "Your transaction has been processed",
            style: TextStyles.subtitle.copyWith(
              color: Color(0xFF848282),
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}