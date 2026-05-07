import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔵 Blue dot
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.accentProgramming1,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 10),

          // 📝 Text
          const Expanded(
            child: Text(
              "Pay via Debit/Credit Cards",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.accentProgramming1,
                fontFamily: 'Inter',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(width: 8),

          // ✅ VISA (aligned perfectly)
          Transform.translate(
            offset: const Offset(0, 1), // move slightly up
            child: Image.asset(
              'lib/assets/Images/visa.png',
              width: 40,
              height: 18, // important for alignment
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 8),

          // 💳 Mastercard (aligned with VISA)
          Transform.translate(
            offset: const Offset(0, 1), // move slightly up
            child: Image.asset(
              'lib/assets/Images/mastercard.png',
              width: 45,
              height: 22, // important for alignment
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}