import 'package:academia/Features/Payement/widgets/pay.dart';
import 'package:flutter/material.dart';
import 'package:academia/Features/Payement/widgets/PayementHeader.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Payement/widgets/payment_method.dart';
import 'package:academia/Features/Payement/widgets/card_details.dart';
import 'package:academia/Features/Payement/widgets/order_summary.dart';

class PayementScreen extends StatelessWidget {
  const PayementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const PayementHeader(),

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
                      PaymentMethodCard(),
                      SizedBox(height: 20),
                      CardDetailsForm(),
                      SizedBox(height: 20),
                      OrderSummary(),
                      SizedBox(height: 20),
                      PayButton()

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
