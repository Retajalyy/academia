import 'package:flutter/material.dart';

class CourseModel {
  final String title;
  final String doctor;
  final String type;
  final String credits;
  final String day;
  final String time;
  final String location;
  final Color color;

  CourseModel({
    required this.title,
    required this.doctor,
    required this.type,
    required this.credits,
    required this.day,
    required this.time,
    required this.location,
    required this.color,
  });

  /// Create a CourseModel from a JSON map (e.g., from an API response)
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'] as String,
      doctor: json['doctor'] as String,
      type: json['type'] as String,
      credits: json['credits'] as String,
      day: json['day'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      // Color comes as an int hex value, e.g. 0xFF4A90D9
      color: Color(json['color'] as int),
    );
  }

  /// Convert a CourseModel back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'doctor': doctor,
      'type': type,
      'credits': credits,
      'day': day,
      'time': time,
      'location': location,
      'color': color.value,
    };
  }

  /// CopyWith — useful for updating a single field without mutation
  CourseModel copyWith({
    String? title,
    String? doctor,
    String? type,
    String? credits,
    String? day,
    String? time,
    String? location,
    Color? color,
  }) {
    return CourseModel(
      title: title ?? this.title,
      doctor: doctor ?? this.doctor,
      type: type ?? this.type,
      credits: credits ?? this.credits,
      day: day ?? this.day,
      time: time ?? this.time,
      location: location ?? this.location,
      color: color ?? this.color,
    );
  }
}