// lib/Features/Registration/widgets/registration_buttons.dart

import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class AddNewPlan extends StatelessWidget {
  const AddNewPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          SizedBox(
            width:  double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Assign Group",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),

         
        ],
      ),
    );
  }
}