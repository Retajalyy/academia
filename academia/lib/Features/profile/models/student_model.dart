class StudentModel {
  final String name;
  final String id;
  final String level;
  final String faculty;
  final double gpa;
  final int attendancePercent;
  final int coursesEnrolled;
  final int semesterCompleted;
  final int completedCredits;
  final int totalCredits;
  final int remainingCredits;

  StudentModel({
    required this.name,
    required this.id,
    required this.level,
    required this.faculty,
    required this.gpa,
    required this.attendancePercent,
    required this.coursesEnrolled,
    required this.semesterCompleted,
    required this.completedCredits,
    required this.totalCredits,
    required this.remainingCredits,
  });

  double get degreeProgress => completedCredits / totalCredits;

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'],
      id: json['id'],
      level: json['level'],
      faculty: json['faculty'],
      gpa: (json['gpa'] as num).toDouble(),
      attendancePercent: json['attendancePercent'],
      coursesEnrolled: json['coursesEnrolled'],
      semesterCompleted: json['semesterCompleted'],
      completedCredits: json['completedCredits'],
      totalCredits: json['totalCredits'],
      remainingCredits: json['remainingCredits'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'level': level,
        'faculty': faculty,
        'gpa': gpa,
        'attendancePercent': attendancePercent,
        'coursesEnrolled': coursesEnrolled,
        'semesterCompleted': semesterCompleted,
        'completedCredits': completedCredits,
        'totalCredits': totalCredits,
        'remainingCredits': remainingCredits,
      };
}