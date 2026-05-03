import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  // Main headers (e.g., app bar titles, big sections)
  static const TextStyle header1 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  // Subtitles or section titles
  static const TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.darkgrey,
  );

  // Body text
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.darkgrey,
  );

  // Small text, hints, placeholders
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.disabledText,
  );

  // Button text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.lightblue,
  );

  // Alerts / Error text
  static const TextStyle error = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.alertError,
  );

    static const TextStyle title = TextStyle(
    fontSize: 20,
   fontWeight: FontWeight.w600,
   fontFamily: 'Inter', 
    color: AppColors.primaryText);
  static const TextStyle mian_title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );
  //course doctors-date-room
  static const TextStyle doctor = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF848282),
    fontFamily: 'Inter',
  );
  //coursedetails
  static const TextStyle doctor2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Color(0xFF848282),
    fontFamily: 'Instrument Sans',
    );
    static const TextStyle percenatge = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xFF848282),
    fontFamily: 'Instrument Sans',
    );


}