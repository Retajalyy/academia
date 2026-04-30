import 'package:flutter/material.dart';
import '../../../Core/utilities/text_style.dart';
import '../../../Core/utilities/colors.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool showOutOfHundred;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.showOutOfHundred = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // fills Expanded in parent row
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // shrink-wrap height
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// 🔹 VALUE
          showOutOfHundred
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: TextStyles.header2.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      TextSpan(
                        text: " /100",
                        style: TextStyles.body.copyWith(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyles.header2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: AppColors.primaryBlue,
                  ),
                ),

          const SizedBox(height: 6),

          /// 🔹 LABEL — no fixed width, wraps naturally inside Expanded
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyles.caption.copyWith(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}