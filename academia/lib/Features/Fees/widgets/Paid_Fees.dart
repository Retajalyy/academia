import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Core/utilities/text_style.dart';

class PaidFeeCard extends StatelessWidget {
  const PaidFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 TITLE
        Row(
          children: [
            Container(
              width: 4,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "PAID FEES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: AppColors.mainGreen,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// 🔹 CARD
        Container(
          padding: const EdgeInsets.all(14),
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: Column(
            children: [
              /// 🔸 TOP ROW
              Row(
                children: [
                  /// ICON BOX
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1F5EF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      color:  AppColors.darkGreen,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// TEXTS
                   Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tuition Fee",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Instrument Sans',
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Amount paid",
                          style: TextStyles.percenatge.copyWith(
                             fontWeight: FontWeight.w500,

                        ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "17,000 EGP",
                          style: TextStyle(
                            color: AppColors.darkGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// STATUS
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Paid",
                      style: TextStyle(
                        color:AppColors.darkGreen,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Divider(
             color: Color(0xFFE5E7EB),
              height: 20,
             thickness: 1,
              ),

              
              /// 🔸 BOTTOM ROW
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Color(0xFFB3B3B3),
                  ),
                  const SizedBox(width: 6),

                  const Expanded(
                    child: Text(
                      "Paid on March 1, 2026",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF848282),
                      ),
                    ),
                  ),

                  Row(
                    children: const [
                      Icon(
                        Icons.download,
                        size: 15,
                        color: AppColors.primaryBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Download invoice",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}