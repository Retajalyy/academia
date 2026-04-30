import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NextClassCard extends StatelessWidget {
  final String title;
  final String time;
  final String room;
  final int minutesLeft;

  const NextClassCard({
    super.key,
    required this.title,
    required this.time,
    required this.room,
    required this.minutesLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Text("$time • $room",
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text("In $minutesLeft min",
              style: const TextStyle(color: Colors.yellow)),
        ],
      ),
    );
  }
}