import 'package:flutter/material.dart';
import '../model/subject_result_model.dart';

class AcademicResultsService {
  Future<SemesterResultModel?> fetchSemesterResult(int semesterNumber) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final mockData = <int, Map<String, dynamic>>{
      7: {
        'semesterName': 'Semester 7',
        'year': 'Year 4',
        'term': 'Fall 2025',
        'semesterGpa': 3.8,
        'subjects': [
          {
            'subject': 'Cloud Computing',
            'grade': 98,
            'gpa': 4.0,
            'letter': 'A+',
            'badgeColor': const Color(0xFFDDEDFA).value,
            'letterColor': const Color(0xFF0C4D83).value,
          },
          {
            'subject': 'Introduction to AI',
            'grade': 73,
            'gpa': 3.2,
            'letter': 'C',
            'badgeColor': const Color(0xFFFFF3DF).value,
            'letterColor': const Color(0xFFB18334).value,
          },
          {
            'subject': 'Data Structures',
            'grade': 85,
            'gpa': 3.4,
            'letter': 'B',
            'badgeColor': const Color(0xFFDDEDFA).value,
            'letterColor': const Color(0xFF0C4D83).value,
          },
          {
            'subject': 'Programming 1',
            'grade': 98,
            'gpa': 4.0,
            'letter': 'A+',
            'badgeColor': const Color(0xFFDDEDFA).value,
            'letterColor': const Color(0xFF0C4D83).value,
          },
          {
            'subject': 'Digital Marketing',
            'grade': 77,
            'gpa': 3.0,
            'letter': 'C',
            'badgeColor': const Color(0xFFFFF3DF).value,
            'letterColor': const Color(0xFFB18334).value,
          },
          {
            'subject': 'Design Patterns',
            'grade': 58,
            'gpa': 2.3,
            'letter': 'D',
            'badgeColor': const Color(0xFFFFE8E8).value,
            'letterColor': Colors.red.value,
          },
        ],
      },
    };

    final raw = mockData[semesterNumber];
    if (raw == null) return null;
    return SemesterResultModel.fromJson(raw);
  }

  Future<List<SemesterResultModel>> fetchAllSemesters() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final result = await fetchSemesterResult(7);
    return result != null ? [result] : [];
  }
}