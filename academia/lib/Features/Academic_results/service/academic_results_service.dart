import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/semster_result_model.dart';

class AcademicResultsService {
  static const String _baseUrl = 'https://your-api.com/api/v1';

  Future<AcademicSummaryModel> fetchAcademicSummary({
    required String studentId,
    required String authToken,
  }) async {
    final uri = Uri.parse('$_baseUrl/students/$studentId/academic-results');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return AcademicSummaryModel.fromJson(json);
    } else {
      throw Exception(
        'Failed to load academic results (${response.statusCode})',
      );
    }
  }

  Future<AcademicSummaryModel> fetchMock() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return AcademicSummaryModel.fromJson({
      "cumulative_gpa": 3.61,
      "total_semesters": 7,
      "current_year_label": "Year 4 • 2025-2026 (current)",
      "semesters": [
        {
          "semester_number": 8,
          "semester_label": "Semester 8",
          "subtitle": "Year 4 . Spring 2026 . Ongoing",
          "year_label": "Year 4 • 2025-2026",
          "gpa": null,
          "status": "notPublished",
        },
        {
          "semester_number": 7,
          "semester_label": "Semester 7",
          "subtitle": "Year 4 . Fall 2025 . 6 courses",
          "year_label": "Year 4 • 2025-2026",
          "gpa": 3.8,
          "status": "latest",
        },
        {
          "semester_number": 6,
          "semester_label": "Semester 6",
          "subtitle": "Year 3 . Spring 2025 . 6 courses",
          "year_label": "Year 3 • 2024-2025",
          "gpa": 4.0,
          "status": "completed",
        },
        {
          "semester_number": 5,
          "semester_label": "Semester 5",
          "subtitle": "Year 3 . Fall 2024 . 6 courses",
          "year_label": "Year 3 • 2024-2025",
          "gpa": 3.8,
          "status": "completed",
        },
        {
          "semester_number": 4,
          "semester_label": "Semester 4",
          "subtitle": "Year 2 . Spring 2024 . 6 courses",
          "year_label": "Year 2 • 2023-2024",
          "gpa": 3.7,
          "status": "completed",
        },
        {
          "semester_number": 3,
          "semester_label": "Semester 3",
          "subtitle": "Year 2 . Fall 2023 . 6 courses",
          "year_label": "Year 2 • 2023-2024",
          "gpa": 3.3,
          "status": "completed",
        },
        {
          "semester_number": 2,
          "semester_label": "Semester 2",
          "subtitle": "Year 1 . Spring 2023 . 6 courses",
          "year_label": "Year 1 • 2022-2023",
          "gpa": 3.6,
          "status": "completed",
        },
        {
          "semester_number": 1,
          "semester_label": "Semester 1",
          "subtitle": "Year 1 . Fall 2022 . 6 courses",
          "year_label": "Year 1 • 2022-2023",
          "gpa": 3.9,
          "status": "completed",
        },
      ],
    });
  }
}