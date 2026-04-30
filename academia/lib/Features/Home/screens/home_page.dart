import 'package:academia/Core/widgets/blue_header.dart';
import 'package:academia/Features/Home/widgets/assignment_card.dart';
import 'package:academia/Features/Home/widgets/next_class_card.dart';
import 'package:academia/Features/Home/widgets/quiz_card.dart';
import 'package:academia/Features/Home/widgets/schedult_item.dart';
import 'package:academia/Features/Home/widgets/section_header.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👋 Header
              AppHeader(
                subtitle: "Good Morning",
                title: "Mariam Ibrahim",
                trailing: IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 20),

              // 📘 Next Class
              NextClassCard(
                title: "Cloud Computing",
                time: "09:00 - 11:00",
                room: "Room B1",
                minutesLeft: 20,
              ),

              const SizedBox(height: 20),

              // 📅 Today's Schedule Header
              SectionHeader(
                title: "Today's Schedule",
                actionText: "Full schedule",
                onTap: () {},
              ),

              const SizedBox(height: 10),

              // 📚 Schedule Items
              const ScheduleItem(
                courseName: "Cloud Computing",
                type: "Lecture",
                room: "Room B1",
                doctor: "Dr. Youssef Senousy",
                time: "09:00 - 11:00",
              ),

              const ScheduleItem(
                courseName: "Introduction to AI",
                type: "Section",
                room: "Lab 1",
                doctor: "Dr. Ahmed Mohamed",
                time: "11:00 - 13:00",
              ),

              const ScheduleItem(
                courseName: "Data Structures",
                type: "Lecture",
                room: "Hall 001",
                doctor: "Dr. Marwa Ahmed",
                time: "13:00 - 15:00",
              ),

              const SizedBox(height: 20),

              // 📌 Due Soon Header
              SectionHeader(
                title: "Due Soon",
                actionText: "All courses",
                onTap: () {},
              ),

              const SizedBox(height: 10),

              // 📄 Assignments / Quizzes
              const AssignmentCard(
                title: "Assignment 3",
                course: "Cloud Computing",
                dueDate: "Today",
              ),

              const QuizCard(
                title: "Quiz 2",
                course: "Digital Marketing",
                dueDate: "Tomorrow",
              ),

              const AssignmentCard(
                title: "Research submitting",
                course: "Technical Writing",
                dueDate: "Apr 12",
              ),
            ],
          ),
        ),
      ),
    );
  }
}