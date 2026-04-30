import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: width * 0.13, // 🔥 responsive height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryYellow,
          disabledBackgroundColor: AppColors.secondaryYellow.withOpacity(0.5),

          elevation: 0, // 🔥 flat modern design

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // 🔥 matches inputs
          ),

          padding: EdgeInsets.symmetric(
            vertical: width * 0.02,
          ),
        ),

        child: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}