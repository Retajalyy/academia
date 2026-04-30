import 'package:flutter/material.dart';

class ScheduleTile extends StatelessWidget {
  final String title;
  final String room;
  final String time;

  const ScheduleTile({
    super.key,
    required this.title,
    required this.room,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text("$room • $time"),
      ),
    );
  }
}