import 'package:flutter/material.dart';
import 'package:academia/core/widgets/bottom_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("profile page")),

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