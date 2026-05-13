// ─────────────────────────────────────────────
// registration/models/registration_models.dart
// ─────────────────────────────────────────────

import 'package:get/get.dart';

enum RegistrationStatus {
  open,
  closed,
  notOpenedYet,
  unpaidBalance,
}

// ── Semester ──────────────────────────────────
class Semester {
  final String id;
  final String label;
  final DateTime registrationOpen;
  final DateTime registrationClosed;
  final DateTime semesterStarts;
  final RegistrationStatus status;

  const Semester({
    required this.id,
    required this.label,
    required this.registrationOpen,
    required this.registrationClosed,
    required this.semesterStarts,
    required this.status,
  });

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json['id'] as String,
        label: json['label'] as String,
        registrationOpen: DateTime.parse(json['registration_open'] as String),
        registrationClosed:
            DateTime.parse(json['registration_closed'] as String),
        semesterStarts: DateTime.parse(json['semester_starts'] as String),
        status: RegistrationStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => RegistrationStatus.notOpenedYet,
        ),
      );
}

// ── Course Session ─────────────────────────────
enum SessionType { lecture, section }

class CourseSession {
  final String day;
  final String timeFrom;
  final String timeTo;
  final String location;
  final String instructor;
  final SessionType type;

  const CourseSession({
    required this.day,
    required this.timeFrom,
    required this.timeTo,
    required this.location,
    required this.instructor,
    required this.type,
  });

  factory CourseSession.fromJson(Map<String, dynamic> json) => CourseSession(
        day: json['day'] as String,
        timeFrom: json['time_from'] as String,
        timeTo: json['time_to'] as String,
        location: json['location'] as String,
        instructor: json['instructor'] as String,
        type: json['type'] == 'lecture'
            ? SessionType.lecture
            : SessionType.section,
      );
}

// ── Course ─────────────────────────────────────
// isSelected is RxBool so toggling it rebuilds only
// the card widget, not the whole list.
class Course {
  final String id;
  final String name;
  final int creditHours;
  final List<CourseSession> sessions;
  final String? prerequisiteNote;
  final RxBool isSelected;

  Course({
    required this.id,
    required this.name,
    required this.creditHours,
    required this.sessions,
    this.prerequisiteNote,
    bool selected = true,
  }) : isSelected = selected.obs;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as String,
        name: json['name'] as String,
        creditHours: json['credit_hours'] as int,
        sessions: (json['sessions'] as List)
            .map((s) => CourseSession.fromJson(s as Map<String, dynamic>))
            .toList(),
        prerequisiteNote: json['prerequisite_note'] as String?,
      );
}

// ── Group ──────────────────────────────────────
class Group {
  final String id;
  final String label;
  final int totalCourses;
  final int totalCredits;
  final List<Course> courses;

  const Group({
    required this.id,
    required this.label,
    required this.totalCourses,
    required this.totalCredits,
    required this.courses,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json['id'] as String,
        label: json['label'] as String,
        totalCourses: json['total_courses'] as int,
        totalCredits: json['total_credits'] as int,
        courses: (json['courses'] as List)
            .map((c) => Course.fromJson(c as Map<String, dynamic>))
            .toList(),
      );
}

// ── Registration Data ──────────────────────────
class RegistrationData {
  final Semester semester;
  final List<Group> groups;
  final double? outstandingBalance;
  final String? balanceDueDate;

  const RegistrationData({
    required this.semester,
    required this.groups,
    this.outstandingBalance,
    this.balanceDueDate,
  });

  bool get hasPendingBalance =>
      outstandingBalance != null && outstandingBalance! > 0;
}