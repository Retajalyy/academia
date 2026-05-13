import 'package:academia/Features/Fees/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:academia/Features/Fees/widgets/Fees_headr.dart';
import 'package:academia/Features/Fees/widgets/DueFee_card.dart';
import 'package:academia/Features/Fees/widgets/Paid_Fees.dart';

import '../../../Core/utilities/colors.dart';

class Feesscreen extends StatelessWidget {
  const Feesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap with PopScope to handle system back button
    return PopScope(
      canPop: false, // Prevents default pop behavior
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // Forces navigation to the services route
        Navigator.pushReplacementNamed(context, '/services'); 
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBlue,
        body: SafeArea(
          child: Column(
            children: [
              const FeesHeader(),

              /// 🔵 BODY
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.babyblue,
                  ),
                  child: const SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DueFeeCard(),
                        SizedBox(height: 20),
                        PaidFeeCard(),
                        SizedBox(height: 20),
                        PayButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

     
      ),
    );
  }
}