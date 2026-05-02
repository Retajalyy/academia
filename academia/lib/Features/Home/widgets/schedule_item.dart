import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleItem extends StatelessWidget {
  final String courseName;
  final String type; // Lecture / Section
  final String room;
  final String doctor;
  final String time;

  const ScheduleItem({
    super.key,
    required this.courseName,
    required this.type,
    required this.room,
    required this.doctor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 5,
        color: Colors.blue,
      ),
      title: Text(courseName),
      subtitle: Text("$type • $room • $doctor"),
      trailing: Text(time),
    );
  }
}