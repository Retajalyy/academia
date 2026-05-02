import 'package:flutter/material.dart';

class Assignment {
  final String title;
  final String course;
  final String dueDate;
  final IconData icon;
  final Color color;

  Assignment({
    required this.title,
    required this.course,
    required this.dueDate,
    required this.icon,
    required this.color,
  });
}