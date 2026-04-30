import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';

class RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// 🔹 REMEMBER ME
        Row(
          children: [
            SizedBox(
              width: width * 0.06,
              height: width * 0.06,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.2,
                ),
              ),
            ),

            SizedBox(width: width * 0.02),

            Text(
              "Remember me",
              style: TextStyle(
                fontSize: width * 0.038,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        /// 🔹 FORGOT PASSWORD
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: width * 0.038,
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}