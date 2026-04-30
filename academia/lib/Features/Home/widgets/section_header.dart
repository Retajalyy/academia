import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTap,
          child: Text(actionText,
              style: const TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}