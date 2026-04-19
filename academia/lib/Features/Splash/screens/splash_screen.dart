import 'package:academia/Core/utilities/colors.dart';
import 'package:academia/Features/Auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'lib/assets/Images/partA.png',
                width: 400,
              ),

              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeOutCubic,
                tween: Tween(begin: 200, end: 0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: Image.asset(
                  'lib/assets/Images/partB.png',
                  width: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}