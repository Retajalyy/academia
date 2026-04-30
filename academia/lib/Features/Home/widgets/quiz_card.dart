import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String course;
  final String dueDate;

  const QuizCard({
    super.key,
    required this.title,
    required this.course,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.quiz, color: Colors.orange),
      title: Text(title),
      subtitle: Text(course),
      trailing: Text(dueDate),
    );
  }
}