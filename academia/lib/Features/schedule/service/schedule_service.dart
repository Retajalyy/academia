import 'package:academia/Features/Schedule/model/class_model.dart';
import '../../../Core/utilities/colors.dart';

class ScheduleService {
  Future<List<ClassModel>> fetchClasses(DateTime date) async {
    // Simulate network delay — replace with real API/DB call later
    await Future.delayed(const Duration(milliseconds: 400));

    final Map<int, List<ClassModel>> mockData = {
      1: [
        ClassModel(
          title: 'Programming 1',
          room: 'Room B1',
          instructor: 'Dr. Ahmed Safwat',
          startTime: '8:00',
          endTime: '9:30',
          type: 'Lecture',
          accentColor: AppColors.accentProgramming1,
        ),
        ClassModel(
          title: 'Introduction to AI',
          room: 'Lab 1',
          instructor: 'Mr. Ahmed Mohamed',
          startTime: '9:30',
          endTime: '11:00',
          type: 'Section',
          accentColor: AppColors.accentAI,
        ),
        ClassModel(
          title: 'Data Structures',
          room: 'Room B1',
          instructor: 'Dr. Marwa Ahmed',
          startTime: '11:00',
          endTime: '12:30',
          type: 'Lecture',
          accentColor: AppColors.accentProgramming1,
        ),
      ],
      2: [
        ClassModel(
          title: 'Calculus II',
          room: 'Room A3',
          instructor: 'Dr. Nour El-Din',
          startTime: '10:00',
          endTime: '11:30',
          type: 'Lecture',
          accentColor: AppColors.accentAI,
        ),
        ClassModel(
          title: 'Digital Logic',
          room: 'Lab 2',
          instructor: 'Eng. Sara Kamel',
          startTime: '12:00',
          endTime: '13:30',
          type: 'Lab',
          accentColor: AppColors.accentProgramming1,
        ),
      ],
      3: [
        ClassModel(
          title: 'Programming 1',
          room: 'Room B1',
          instructor: 'Dr. Ahmed Safwat',
          startTime: '8:00',
          endTime: '9:30',
          type: 'Lecture',
          accentColor: AppColors.accentProgramming1,
        ),
        ClassModel(
          title: 'Databases',
          room: 'Room C2',
          instructor: 'Dr. Hana Farouk',
          startTime: '11:00',
          endTime: '12:30',
          type: 'Lecture',
          accentColor: AppColors.accentAI,
        ),
      ],
      4: [
        ClassModel(
          title: 'Introduction to AI',
          room: 'Lab 1',
          instructor: 'Mr. Ahmed Mohamed',
          startTime: '9:30',
          endTime: '11:00',
          type: 'Section',
          accentColor: AppColors.accentAI,
        ),
      ],
      5: [
        ClassModel(
          title: 'Data Structures',
          room: 'Room B1',
          instructor: 'Dr. Marwa Ahmed',
          startTime: '8:00',
          endTime: '9:30',
          type: 'Lecture',
          accentColor: AppColors.accentProgramming1,
        ),
        ClassModel(
          title: 'Digital Logic',
          room: 'Lab 2',
          instructor: 'Eng. Sara Kamel',
          startTime: '10:00',
          endTime: '12:00',
          type: 'Lab',
          accentColor: AppColors.accentAI,
        ),
      ],
    };

    return mockData[date.weekday] ?? [];
  }
}