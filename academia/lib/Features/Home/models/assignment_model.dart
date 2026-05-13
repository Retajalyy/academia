import 'package:flutter/material.dart';

class Assignment {
  final String title;
  final String courseName;
  final String dueDate;
  final Color color; // Add this
  final IconData icon; // Add this

  Assignment({
    required this.title,
    required this.courseName,
    required this.dueDate,
    required this.color,
    required this.icon,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    final courseData = json['courses'] as Map<String, dynamic>?;

    return Assignment(
      title: json['title'] ?? 'No Title',
      courseName: courseData != null ? courseData['name'] : 'Unknown Course',
      dueDate: json['due_date'] ?? '',
      // Map the color from a string in DB (e.g., 'red') to Flutter Color
      color: _getColor(json['color_name']), 
      icon: _getIcon(json['icon_type']),
    );
  }

  // Helper to turn database strings into Flutter Colors
  static Color _getColor(String? colorName) {
    switch (colorName) {
      case 'red': return Colors.red;
      case 'amber': return Colors.amber;
      case 'blue': return Colors.blue;
      default: return Colors.grey;
    }
  }

  // Helper to turn database strings into Icons
  static IconData _getIcon(String? iconType) {
    switch (iconType) {
      case 'note': return Icons.note_add_outlined;
      case 'quiz': return Icons.assignment_turned_in_outlined;
      default: return Icons.attachment_outlined;
    }
  }
}