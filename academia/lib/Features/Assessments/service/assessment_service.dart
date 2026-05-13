// lib/features/assessment/data/services/assessment_service.dart

import '../model/assessment_model.dart';

abstract class AssessmentServiceBase {
  Future<List<AssessmentModel>> fetchAssessments();
  Future<AssessmentStatsModel> fetchStats();
  Future<List<AssessmentModel>> searchAssessments(String query);
}

class AssessmentService implements AssessmentServiceBase {
  // Replace with your real API client / Dio instance as needed.
  // Currently uses hardcoded mock data that mirrors your screen.

  @override
  Future<List<AssessmentModel>> fetchAssessments() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    return const [
      AssessmentModel(
        courseTitle: 'Cloud Computing',
        courseType: 'Core',
        midterm: '10/15',
        midtermStatus: 'Average',
        participation: '25/25',
        participationStatus: 'Excellent',
        attendance: '92%',
        attendanceStatus: 'Excellent',
        progress: 0.9,
      ),
      AssessmentModel(
        courseTitle: 'Digital Marketing',
        courseType: 'Elective',
        midterm: '8/15',
        midtermStatus: 'Below avg',
        participation: '25/25',
        participationStatus: 'Excellent',
        attendance: '92%',
        attendanceStatus: 'Excellent',
        progress: 0.75,
      ),
      AssessmentModel(
        courseTitle: 'Introduction to AI',
        courseType: 'Core',
        midterm: '5/15',
        midtermStatus: 'Fair',
        participation: '25/25',
        participationStatus: 'Excellent',
        attendance: '88%',
        attendanceStatus: 'Very Good',
        progress: 0.5,
      ),
    ];
  }

  @override
  Future<AssessmentStatsModel> fetchStats() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return const AssessmentStatsModel(
      avgMidterm: 74,
      avgParticipation: 88,
      avgAttendance: 80,
    );
  }

  @override
  Future<List<AssessmentModel>> searchAssessments(String query) async {
    final all = await fetchAssessments();
    if (query.trim().isEmpty) return all;

    final lower = query.toLowerCase();
    return all
        .where((a) => a.courseTitle.toLowerCase().contains(lower))
        .toList();
  }
}