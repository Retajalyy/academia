import 'package:academia/Features/Registration/models/registration_model.dart';

import '../models/registration_model.dart';

/// Mock service — replace method bodies with real API calls.
class RegistrationService {
  // ── Fetch current registration state from the server ───────────────────────
  Future<RegistrationState> fetchRegistrationState() async {
    // TODO: call GET /api/registration/status
    await Future.delayed(const Duration(milliseconds: 600));
    return RegistrationState.notOpenedYet; // mock
  }

  // ── Fetch available groups for a given semester tab ─────────────────────────
  Future<List<CourseGroup>> fetchGroups(String semesterTab) async {
    // TODO: call GET /api/registration/groups?semester={semesterTab}
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockGroups;
  }

  // ── Fetch semester info (shown when closed) ──────────────────────────────────
  Future<SemesterInfo> fetchSemesterInfo() async {
    // TODO: call GET /api/registration/semester-info
    await Future.delayed(const Duration(milliseconds: 400));
    return const SemesterInfo(
      semester: 'Semester B',
      year: 'Spring 2026',
      registrationOpen: 'April 10, 2026',
      registrationClosed: 'April 25, 2026',
      semesterStart: 'May 10, 2026',
    );
  }

  // ── Fetch student balance ────────────────────────────────────────────────────
  Future<BalanceInfo> fetchBalanceInfo() async {
    // TODO: call GET /api/student/balance
    await Future.delayed(const Duration(milliseconds: 400));
    return const BalanceInfo(
      outstandingAmount: 17000,
      currency: 'EGP',
      isPaid: false,
      dueDate: 'June 1, 2026',
    );
  }

  // ── Confirm / submit registration ────────────────────────────────────────────
  Future<bool> submitRegistration({
    required String groupId,
    required List<String> courseIds,
  }) async {
    // TODO: call POST /api/registration/confirm
    await Future.delayed(const Duration(seconds: 1));
    return true; // mock success
  }

  // ── Initiate fee payment ──────────────────────────────────────────────────────
  Future<String> initiatePayment({required double amount}) async {
    // TODO: call POST /api/payment/initiate
    await Future.delayed(const Duration(milliseconds: 800));
    return 'https://payment.example.com/checkout/mock'; // mock payment URL
  }

  // ─────────────────────────── Mock Data ──────────────────────────────────────
  static final List<CourseGroup> _mockGroups = [
    CourseGroup(
      id: 'se1',
      label: 'Group SE1',
      creditHours: 18,
      lectures: [
        const CourseLecture(
          courseCode: 'CS401',
          courseName: 'Cloud Computing',
          creditHours: 3,
          day: 'Sun',
          timeFrom: '08:00',
          timeTo: '09:30',
          instructor: 'Dr. Youssef Senousy',
          room: 'Room B3',
          sectionDay: 'Tue',
          sectionInstructor: 'Mr. Ahmed Mohamed',
          sectionTime: '11:00 - 12:30',
          sectionRoom: 'Lab 01',
        ),
        const CourseLecture(
          courseCode: 'CS412',
          courseName: 'Analysis of Algorithms',
          creditHours: 3,
          day: 'Sun',
          timeFrom: '06:00',
          timeTo: '09:30',
          instructor: 'Dr. Youssef Senousy',
          room: 'Room B3',
          sectionDay: 'Tue',
          sectionInstructor: 'Mr. Ahmed Mohamed',
          sectionTime: '11:00 - 12:30',
          sectionRoom: 'Lab 01',
        ),
        const CourseLecture(
          courseCode: 'CS430',
          courseName: 'Analysis of Algorithms',
          creditHours: 3,
          day: 'Sun',
          timeFrom: '06:00',
          timeTo: '09:30',
          instructor: 'Dr. Youssef Senousy',
          room: 'Room B3',
          sectionDay: 'Tue',
        ),
      ],
    ),
    CourseGroup(
      id: 'se2',
      label: 'Group SE2',
      creditHours: 18,
      lectures: const [],
    ),
  ];
}