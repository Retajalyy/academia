import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CustomHeader({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393, // Figma width
      height: 166, // Figma height
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF2F3E93), // dark blue color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}