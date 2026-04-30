import 'package:flutter/material.dart';

class AssignmentCard extends StatelessWidget {
  final String title;
  final String course;
  final String dueDate;

  const AssignmentCard({
    super.key,
    required this.title,
    required this.course,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.description, color: Colors.red),
      title: Text(title),
      subtitle: Text(course),
      trailing: Text(dueDate),
    );
  }
}