import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Payement/screens/PayementScreen.dart';

class PayButton extends StatelessWidget {
  final double outstanding;

  const PayButton({super.key, required this.outstanding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  PayementScreen(),
                    ),
                  );
                },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.babyblue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color(0xFFE5E7EB), // grey border
              width: 1,
            ),
          ),
        ),
        child: const Text(
          "Pay outstanding 5,000 EGP",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}