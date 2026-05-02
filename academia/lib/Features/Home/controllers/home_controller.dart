import 'package:academia/Features/Home/models/assignment_model.dart';
import 'package:academia/Features/Home/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = "Mariam Ibrahim".obs;
  var nextClass = ScheduleItem(title: "Cloud Computing", time: "09:00 - 11:00", location: "Room B1", instructor: "Dr. Youssef", type: "Lecture").obs;
var assignments = <Assignment>[].obs;


  // List of schedule items for the day
  var dailySchedule = <ScheduleItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSchedule();
  }
void loadAssignments() {
  assignments.addAll([
    Assignment(title: "Assignment 3", course: "Cloud Computing", dueDate: "Today", icon: Icons.note_add_outlined, color: Colors.red),
    Assignment(title: "Quiz 2", course: "Digital Marketing", dueDate: "Tomorrow", icon: Icons.assignment_turned_in_outlined, color: Colors.amber),
    Assignment(title: "Research submitting", course: "Technical Writing", dueDate: "Apr 12", icon: Icons.attachment_outlined, color: Colors.blue),
  ]);
}
  void loadSchedule() {
    // This would eventually come from your Service
    dailySchedule.addAll([
      ScheduleItem(title: "Cloud Computing", time: "09:00 - 11:00", location: "Room B1", instructor: "Dr. Youssef Senousy", type: "Lecture"),
      ScheduleItem(title: "Introduction to AI", time: "09:00 - 11:00", location: "Lab 1", instructor: "Mr. Ahmed Mohamed", type: "Section"),
    ]);
  }
}