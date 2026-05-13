// lib/features/assessment/data/models/assessment_model.dart

class AssessmentModel {
  final String courseTitle;
  final String courseType; // "Core" or "Elective"
  final String midterm;
  final String midtermStatus;
  final String participation;
  final String participationStatus;
  final String attendance;
  final String attendanceStatus;
  final double progress;

  const AssessmentModel({
    required this.courseTitle,
    required this.courseType,
    required this.midterm,
    required this.midtermStatus,
    required this.participation,
    required this.participationStatus,
    required this.attendance,
    required this.attendanceStatus,
    required this.progress,
  });

  factory AssessmentModel.fromJson(Map<String, dynamic> json) {
    return AssessmentModel(
      courseTitle: json['courseTitle'] as String,
      courseType: json['courseType'] as String,
      midterm: json['midterm'] as String,
      midtermStatus: json['midtermStatus'] as String,
      participation: json['participation'] as String,
      participationStatus: json['participationStatus'] as String,
      attendance: json['attendance'] as String,
      attendanceStatus: json['attendanceStatus'] as String,
      progress: (json['progress'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'courseTitle': courseTitle,
        'courseType': courseType,
        'midterm': midterm,
        'midtermStatus': midtermStatus,
        'participation': participation,
        'participationStatus': participationStatus,
        'attendance': attendance,
        'attendanceStatus': attendanceStatus,
        'progress': progress,
      };
}

class AssessmentStatsModel {
  final double avgMidterm;
  final double avgParticipation;
  final double avgAttendance;

  const AssessmentStatsModel({
    required this.avgMidterm,
    required this.avgParticipation,
    required this.avgAttendance,
  });

  factory AssessmentStatsModel.fromJson(Map<String, dynamic> json) {
    return AssessmentStatsModel(
      avgMidterm: (json['avgMidterm'] as num).toDouble(),
      avgParticipation: (json['avgParticipation'] as num).toDouble(),
      avgAttendance: (json['avgAttendance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'avgMidterm': avgMidterm,
        'avgParticipation': avgParticipation,
        'avgAttendance': avgAttendance,
      };
}