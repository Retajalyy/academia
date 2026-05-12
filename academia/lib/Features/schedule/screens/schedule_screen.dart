import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';
import 'package:academia/Features/Schedule/model/class_model.dart';
import '../widgets/calendar.dart';
import '../widgets/class_card.dart';
 
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
 
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}
 
class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime(2025, 9, 9);
  
 
  // Mock classes data
  final List<ClassModel> _classes = const [
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
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
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
            bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2D4B94),
        backgroundColor: AppColors.screenBackground,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}