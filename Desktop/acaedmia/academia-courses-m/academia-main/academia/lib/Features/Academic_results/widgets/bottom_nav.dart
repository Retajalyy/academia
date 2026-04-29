import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  Widget navItem(
    IconData icon,
    String text,
    bool active,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(
          icon,
          color: active
              ? AppColors.primaryBlue
              : AppColors.bottomNav,
              fontWeight: FontWeight.bold,
              size: 32,
        ),

        const SizedBox(height:4),

        Text(
          text,
          style: TextStyle(
        fontSize: 15,
        color: active
      ? AppColors.primaryBlue // Services blue
      : Colors.black,         // others black
     fontWeight: FontWeight.bold, // all bold
),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
        children: [

          navItem(Icons.home_outlined,"Home",false),

          navItem(Icons.calendar_month,
              "Schedule",false),

          navItem(Icons.grid_view,
              "Services",true),

          navItem(Icons.person_outline,
              "Profile",false),
        ],
      ),
    );
  }
}