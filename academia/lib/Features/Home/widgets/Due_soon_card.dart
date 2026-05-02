import 'package:academia/Features/Home/models/assignment_model.dart';
import 'package:flutter/material.dart';

class DueSoonCard extends StatelessWidget {
  final Assignment assignment;

  const DueSoonCard({required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: assignment.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(assignment.icon, color: assignment.color),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(assignment.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D4B94))),
                    Text(assignment.course, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: assignment.color.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  assignment.dueDate,
                  style: TextStyle(color: assignment.color, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, indent: 70),
      ],
    );
  }
}