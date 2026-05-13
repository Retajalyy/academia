import 'package:academia/Core/utilities/colors.dart';
import '../model/course_model.dart';

/// CourseService is responsible for ALL data access logic.
/// Swap the body of fetchCourses() with a real HTTP/Dio call when your
/// back-end is ready — the controller won't need to change at all.
class CourseService {
  // ── Singleton (optional, GetX can also manage lifecycle) ──────────────────
  CourseService._();

  static final CourseService instance = CourseService._();

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Returns the full list of courses.
  /// Throws an [Exception] on failure so the controller can react.
  Future<List<CourseModel>> fetchCourses() async {
    // TODO: replace with real network call, e.g.
    // final response = await _dio.get('/courses');
    // return (response.data as List)
    //     .map(CourseModel.fromJson)
    //     .toList();

    // Simulated network delay
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    // Hardcoded mock data matching your current CourseScreen
    return [
      CourseModel(
        title: "Cloud Computing",
        doctor: "Dr. Youssef Senousy",
        type: "Core",
        credits: "3 credits",
        day: "Sunday",
        time: "11:00 - 12:00",
        location: "Room B3",
        color: AppColors.accentProgramming1,
      ),

      CourseModel(
        title: "Digital Marketing",
        doctor: "Dr. Kholoud Farag",
        type: "Elective",
        credits: "2 credits",
        day: "Monday",
        time: "11:00 - 12:00",
        location: "Lab 1",
        color: AppColors.accentAI,
      ),

      CourseModel(
        title: "Design Patterns",
        doctor: "Dr. Marwa Ahmed",
        type: "Core",
        credits: "3 credits",
        day: "Tuesday",
        time: "11:00 - 12:00",
        location: "Room B3",
        color: AppColors.accentProgramming1,
      ),
    ];
  }

  /// Search / filter courses by query string (client-side).
  /// Pass this the full list already fetched to avoid an extra network round-trip.
  List<CourseModel> search(
    List<CourseModel> courses,
    String query,
  ) {
    if (query.trim().isEmpty) {
      return courses;
    }

    final lower = query.toLowerCase();

    return courses.where((c) {
      return c.title.toLowerCase().contains(lower) ||
          c.doctor.toLowerCase().contains(lower) ||
          c.type.toLowerCase().contains(lower);
    }).toList();
  }
}