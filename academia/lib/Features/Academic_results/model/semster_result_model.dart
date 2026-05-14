class SemesterResultModel {
  final int semesterNumber;
  final String semesterLabel;
  final String subtitle;
  final String yearLabel;
  final double? gpa;
  final SemesterStatus status;

  const SemesterResultModel({
    required this.semesterNumber,
    required this.semesterLabel,
    required this.subtitle,
    required this.yearLabel,
    this.gpa,
    required this.status,
  });

  String get gpaDisplay => gpa != null ? gpa!.toStringAsFixed(1) : "-";

  String get statusLabel {
    switch (status) {
      case SemesterStatus.notPublished:
        return "Not published yet";
      case SemesterStatus.inProgress:
        return "In progress";
      case SemesterStatus.latest:
        return "Latest results";
      case SemesterStatus.completed:
        return "Completed";
    }
  }

  factory SemesterResultModel.fromJson(Map<String, dynamic> json) {
    return SemesterResultModel(
      semesterNumber: json['semester_number'] as int,
      semesterLabel: json['semester_label'] as String,
      subtitle: json['subtitle'] as String,
      yearLabel: json['year_label'] as String,
      gpa: json['gpa'] != null ? (json['gpa'] as num).toDouble() : null,
      status: SemesterStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => SemesterStatus.completed,
      ),
    );
  }
}

enum SemesterStatus {
  notPublished,
  inProgress,
  latest,
  completed,
}

class AcademicSummaryModel {
  final double cumulativeGpa;
  final int totalSemesters;
  final String currentYearLabel;
  final List<SemesterResultModel> semesters;

  const AcademicSummaryModel({
    required this.cumulativeGpa,
    required this.totalSemesters,
    required this.currentYearLabel,
    required this.semesters,
  });

  double get gpaProgress => (cumulativeGpa / 4.0).clamp(0.0, 1.0);
  String get cumulativeGpaDisplay => cumulativeGpa.toStringAsFixed(2);

  factory AcademicSummaryModel.fromJson(Map<String, dynamic> json) {
    return AcademicSummaryModel(
      cumulativeGpa: (json['cumulative_gpa'] as num).toDouble(),
      totalSemesters: json['total_semesters'] as int,
      currentYearLabel: json['current_year_label'] as String,
      semesters: (json['semesters'] as List)
          .map((e) => SemesterResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}