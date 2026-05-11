import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// MENU + TITLE IN SAME ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// MENU BUTTON
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// TITLE + SUBTITLE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Registration",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 2),

                  Text(
                    "Manage semester enrollment plans",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0XFFDEDEDE),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}