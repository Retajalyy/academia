import 'package:flutter/material.dart';
import 'package:academia/core/widgets/bottom_bar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),

      body: Center(
        child: ElevatedButton(
          child: const Text("Test Bottom Bar"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomBar(),
              ),
            );
          },
        ),
      ),
    );
  }
}