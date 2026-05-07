import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';
import 'package:academia/Features/Payement/screens/PayementScreen.dart';


class DueFeeCard extends StatelessWidget {
  const DueFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ── Section Title ─────────────────────────────
        Row(
          children: [
            Container(
              width: 4,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xFFE40E0E),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "DUE NOW",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: AppColors.fail,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        /// ── Card ───────────────────────────────────────
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ── Top section ───────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ICON BOX (FIXED)
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF0F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.school_outlined,
                        color: AppColors.fail,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// Details
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Graduation Project Fee",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Instrument Sans',
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Amount due",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF848282),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Instrument Sans',
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "5,000 EGP",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.fail,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Badge + Button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAF0F1),
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          child: Text(
                            "Unpaid",
                            style: TextStyle(
                              color: AppColors.fail,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          height: 32,
                          child: OutlinedButton(
                            onPressed: () {
                            Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                           builder: (_) => const PayementScreen(),
                             ),
                            );
                           },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14),
                              side: BorderSide(
                                  color: Colors.grey.shade400, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Pay now",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ── Footer ──────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 9),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF0F1),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        size: 17, color: AppColors.fail),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Due April 20, 2026 — pay before registration opens",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fail,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}