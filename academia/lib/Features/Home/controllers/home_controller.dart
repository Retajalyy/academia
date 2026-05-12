import 'package:academia/Features/Home/models/assignment_model.dart';
import 'package:academia/Features/Home/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = "Mariam Ibrahim".obs;
  var nextClass = ScheduleItem(
          title: "Cloud Computing",
          time: "09:00 - 11:00",
          location: "Room B1",
          instructor: "Dr. Youssef",
          type: "Lecture")
      .obs;

  var assignments = <Assignment>[].obs;
  var dailySchedule = <ScheduleItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // CRITICAL: You must call both functions here
    loadSchedule();
    loadAssignments(); 
  }

  void loadAssignments() {
    assignments.assignAll([
      Assignment(title: "Assignment 3", courseName: "Cloud Computing", dueDate: "Today", icon: Icons.note_add_outlined, color: Colors.red),
      Assignment(title: "Quiz 2", courseName: "Digital Marketing", dueDate: "Tomorrow", icon: Icons.assignment_turned_in_outlined, color: Colors.amber),
      Assignment(title: "Research submitting", courseName: "Technical Writing", dueDate: "Apr 12", icon: Icons.attachment_outlined, color: Colors.blue),
    ]);
  }

  void loadSchedule() {
    dailySchedule.assignAll([
      ScheduleItem(title: "Cloud Computing", time: "09:00 - 11:00", location: "Room B1", instructor: "Dr. Youssef Senousy", type: "Lecture"),
      ScheduleItem(title: "Introduction to AI", time: "09:00 - 11:00", location: "Lab 1", instructor: "Mr. Ahmed Mohamed", type: "Section"),
      ScheduleItem(title: "Data Structures", time: "09:00 - 11:00", location: "Hall 001", instructor: "Dr. Marwa Ahmed", type: "Lecture"),
    ]);
  }
}