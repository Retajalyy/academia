import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String iconPath;

  final bool isPassword;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.iconPath,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBlue,
          ),
        ),

        SizedBox(height: width * 0.015),

        /// FIELD
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,

          style: TextStyle(fontSize: width * 0.04),

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: width * 0.038,
            ),

            /// ✅ FIXED SVG ICON
            prefixIcon: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: SvgPicture.asset(
                iconPath,
                width: width * 0.05,
                height: width * 0.05,
                colorFilter: const ColorFilter.mode(
                  AppColors.disabledText,
                  BlendMode.srcIn,
                ),
              ),
            ),

            suffixIcon: suffixIcon,

            filled: true,
            fillColor: Colors.white,

            contentPadding: EdgeInsets.symmetric(
              vertical: width * 0.045,
              horizontal: width * 0.02,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.primaryBlue,
                width: 1.8,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.red),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}