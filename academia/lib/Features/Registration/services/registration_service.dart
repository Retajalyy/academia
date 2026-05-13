// ──────────────────────────────────────────────────────
// registration/services/registration_service.dart
// ──────────────────────────────────────────────────────


import 'package:academia/Features/Registration/models/registration_model.dart';

abstract class IRegistrationService {
  Future<RegistrationData> fetchRegistrationData();
  Future<void> confirmRegistration({
    required String semesterId,
    required String groupId,
    required List<String> selectedCourseIds,
  });
}

class RegistrationService implements IRegistrationService {
  final String baseUrl;

  RegistrationService({this.baseUrl = 'https://api.university.edu/v1'});

  @override
  Future<RegistrationData> fetchRegistrationData() async {
    // ── Real implementation ──────────────────────────
    // final response = await _client.get('$baseUrl/registration');
    // return _parseRegistrationData(jsonDecode(response.body));

    await Future.delayed(const Duration(milliseconds: 800));
    return _mockData();
  }

  @override
  Future<void> confirmRegistration({
    required String semesterId,
    required String groupId,
    required List<String> selectedCourseIds,
  }) async {
    // ── Real implementation ──────────────────────────
    // await _client.post(
    //   '$baseUrl/registration/confirm',
    //   body: jsonEncode({
    //     'semester_id': semesterId,
    //     'group_id': groupId,
    //     'course_ids': selectedCourseIds,
    //   }),
    // );

    await Future.delayed(const Duration(seconds: 1));
  }

  // ── Mock data ─────────────────────────────────────
  RegistrationData _mockData() => RegistrationData(
        semester: Semester(
          id: 'S5_SP26',
          label: 'Semester 5, Spring 2026',
          registrationOpen: DateTime(2026, 4, 20),
          registrationClosed: DateTime(2026, 4, 25),
          semesterStarts: DateTime(2026, 5, 10),
          status: RegistrationStatus.open, // change to test other states
        ),
        groups: [
          Group(
            id: 'SE1',
            label: 'SE1',
            totalCourses: 5,
            totalCredits: 12,
            courses: [
              Course(
                id: 'CC101',
                name: 'Cloud Computing',
                creditHours: 3,
                sessions: [
                  const CourseSession(
                    day: 'Sat',
                    timeFrom: '09:00',
                    timeTo: '11:00',
                    location: 'Room B2',
                    instructor: 'Dr. Youssef Gomaa',
                    type: SessionType.lecture,
                  ),
                  const CourseSession(
                    day: 'Tue',
                    timeFrom: '11:00',
                    timeTo: '12:30',
                    location: 'Lab 31',
                    instructor: 'Mr. Ahmed Mohamed',
                    type: SessionType.section,
                  ),
                ],
              ),
              Course(
                id: 'AA201',
                name: 'Analysis of Algorithms',
                creditHours: 3,
                sessions: [
                  const CourseSession(
                    day: 'Sun',
                    timeFrom: '08:30',
                    timeTo: '10:00',
                    location: 'Room A1',
                    instructor: 'Dr. Youssef Dammous',
                    type: SessionType.lecture,
                  ),
                ],
                prerequisiteNote:
                    'Prerequisite not met: requires Discrete Mathematics to unlock this course.',
              ),
            ],
          ),
          Group(
            id: 'SE2',
            label: 'SE2',
            totalCourses: 5,
            totalCredits: 12,
            courses: [],
          ),
        ],
        // outstandingBalance: 17000,  // ← uncomment to test unpaid state
        // balanceDueDate: 'Apr 30',
      );
}