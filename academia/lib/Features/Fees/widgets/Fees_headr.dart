import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';

class FeesHeader extends StatelessWidget {
  final double outstanding;
  final double totalFees;
  final double totalPaid;
  final double progress;

  const FeesHeader({
    super.key,
    required this.outstanding,
    required this.totalFees,
    required this.totalPaid,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0C4D83),
            Color(0xFF223F7A),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Top Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back, color: Colors.white, size: 28),
              Icon(Icons.notifications, color: Colors.white, size: 28),
            ],
          ),

          const SizedBox(height: 12),

          /// Label
          const Text(
            "Outstanding balance",
            style: TextStyle(
              color: AppColors.greytext,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          /// Amount
          const Text(
            "5,000 EGP",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 10),

          /// Warning badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xCCFE5263).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD78181),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Color(0xFFDEABAB), size: 14),
                SizedBox(width: 6),
                Text(
                  "Pay before April 20 to avoid delays",
                  style: TextStyle(
                    color: Color(0xFFD9D9D9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          /// ── Inner bordered card ──────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                /// Stats Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatItem(title: "0 EGP", subtitle: "Minimum due"),
                    _VerticalDivider(),
                    _StatItem(title: "83% paid", subtitle: "Progress"),
                    _VerticalDivider(),
                    _StatItem(title: "30,000 EGP", subtitle: "Total Fees"),
                  ],
                ),

                const SizedBox(height: 14),

                /// Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const LinearProgressIndicator(
                    value: 0.83,
                    minHeight: 8,
                    backgroundColor: Color(0xFFE5E7EB),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.secondaryYellow),
                  ),
                ),

                const SizedBox(height: 8),

                /// Progress label
                const Text(
                  "25,000 of 30,000 EGP paid",
                  style: TextStyle(
                    color: Color(0xFFE5E7EB),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
           color: Color(0xFFE5E7EB),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white24,
    );
  }
}