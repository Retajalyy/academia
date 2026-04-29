import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';
import 'package:academia/Features/Schedule/model/class_model.dart';
import '../widgets/calendar.dart';
import '../widgets/class_card.dart';
import '../widgets/bottom_nav.dart';
 
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
 
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}
 
class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime(2025, 9, 9);
  int _currentNavIndex = 1;
 
  // Mock classes data
  final List<ClassModel> _classes = const [
    ClassModel(
      title: 'Programming 1',
      room: 'Room B1',
      instructor: 'Dr. Ahmed Safwat',
      startTime: '8:00',
      endTime: '9:30',
      type: 'Lecture',
      accentColor: AppColors.accentProgramming,
    ),
    ClassModel(
      title: 'Introduction to AI',
      room: 'Lab 1',
      instructor: 'Mr. Ahmed Mohamed',
      startTime: '9:30',
      endTime: '11:00',
      type: 'Section',
      accentColor: AppColors.secondaryYellow,
    ),
    ClassModel(
      title: 'Data Structures',
      room: 'Room B1',
      instructor: 'Dr. Marwa Ahmed',
      startTime: '11:00',
      endTime: '12:30',
      type: 'Lecture',
      accentColor: AppColors.accentDataStructures,
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: _currentNavIndex,
        onTap: (index) => setState(() => _currentNavIndex = index),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar
              CalendarWidget(
                selectedDate: _selectedDate,
                onDateSelected: (date) => setState(() => _selectedDate = date),
              ),
              const SizedBox(height: 24),
              // Classes section title
              Text('Classes', style: TextStyles.header2),
              const SizedBox(height: 16),
              // Class cards
              ..._classes.map((c) => ClassCardWidget(classModel: c)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}