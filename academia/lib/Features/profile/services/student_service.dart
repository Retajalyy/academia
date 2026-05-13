import 'package:academia/Features/profile/models/student_model.dart';

class StudentService {
  Future<StudentModel> fetchStudentProfile() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return StudentModel(
      name: 'Mariam Ibrahim Mustafa',
      id: '2022317',
      level: 'Level 4',
      faculty: 'FCI . SE',
      gpa: 3.68,
      attendancePercent: 92,
      coursesEnrolled: 6,
      semesterCompleted: 7,
      completedCredits: 110,
      totalCredits: 140,
      remainingCredits: 30,
    );
  }

  // Added this to support the Save action in the UI
  Future<bool> updateStudentPhone(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 1));
    // Implementation for API call would go here
    return true;
  }
}