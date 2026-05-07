import 'package:academia/Features/Fees/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:academia/Features/Fees/widgets/Fees_headr.dart';
import 'package:academia/Features/Fees/widgets/DueFee_card.dart';
import 'package:academia/Features/Fees/widgets/Paid_Fees.dart'; // ✅ add this

import '../../../Core/utilities/colors.dart';

class Feesscreen extends StatelessWidget {
  const Feesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
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
                  child: Column( // ✅ wrap in Column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DueFeeCard(),
                      SizedBox(height: 20), // spacing
                      PaidFeeCard(), // ✅ added here
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

      /// 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.babyblue,
        selectedItemColor: const Color(0xFF2D4B94),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}