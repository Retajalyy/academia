import 'package:flutter/material.dart';

class SubjectResultModel {
  final String subject;
  final int grade;
  final double gpa;
  final String letter;
  final Color badgeColor;
  final Color letterColor;

  const SubjectResultModel({
    required this.subject,
    required this.grade,
    required this.gpa,
    required this.letter,
    required this.badgeColor,
    required this.letterColor,
  });

  factory SubjectResultModel.fromJson(Map<String, dynamic> json) {
    return SubjectResultModel(
      subject: json['subject'] as String,
      grade: json['grade'] as int,
      gpa: (json['gpa'] as num).toDouble(),
      letter: json['letter'] as String,
      badgeColor: Color(json['badgeColor'] as int),
      letterColor: Color(json['letterColor'] as int),
    );
  }

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'grade': grade,
        'gpa': gpa,
        'letter': letter,
        'badgeColor': badgeColor.value,
        'letterColor': letterColor.value,
      };
}

class SemesterResultModel {
  final String semesterName;
  final String year;
  final String term;
  final double semesterGpa;
  final List<SubjectResultModel> subjects;

  const SemesterResultModel({
    required this.semesterName,
    required this.year,
    required this.term,
    required this.semesterGpa,
    required this.subjects,
  });

  String get headerLabel => '$semesterName · $year · $term';

  factory SemesterResultModel.fromJson(Map<String, dynamic> json) {
    return SemesterResultModel(
      semesterName: json['semesterName'] as String,
      year: json['year'] as String,
      term: json['term'] as String,
      semesterGpa: (json['semesterGpa'] as num).toDouble(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'semesterName': semesterName,
        'year': year,
        'term': term,
        'semesterGpa': semesterGpa,
        'subjects': subjects.map((s) => s.toJson()).toList(),
      };
}