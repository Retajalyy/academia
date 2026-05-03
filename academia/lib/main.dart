import 'package:academia/Features/Academic_results/screens/AcademicResultCourseScreen.dart';
import 'package:academia/Features/Academic_results/screens/Academic_results_screen.dart';
import 'package:academia/Features/Assessments/screens/AssessmentScreen.dart';
import 'package:academia/Features/Home/controllers/home_controller.dart';
import 'package:academia/Features/Splash/screens/splash_screen.dart';
import 'package:academia/Features/noexam_schedule/screens/exam_Schedule_screen2.dart';
import 'package:academia/Features/noexam_schedule/screens/exam_Schedule_screen.dart';
import 'package:academia/Features/profile/screens/profile_page.dart';
import 'package:academia/Features/schedule/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/supabase_service.dart';
import 'Core/utilities/colors.dart'; 
import 'features/auth/screens/login_screen.dart';
import 'features/home/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseService.init();
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // ✅ GLOBAL THEME
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightblue,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          primary: AppColors.primaryBlue,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      // 👇 start from splash instead of home
      initialRoute: '/assesments',

      // 👇 routes
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/academicresultscourses',
          page: () => AcademicResultsCourseScreen(),
        ),
        GetPage(
          name: '/academicresults',
          page: () => AcademicResultsScreen(),
        ),
        GetPage(
          name: '/noexam',
          page: () => ExamScheduleScreen(),
        ),
        GetPage(
          name: '/exam',
          page: () => ExamScheduleScreen2(),
        ),
        GetPage(
          name: '/assesments',
          page: () => Assessmentscreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/HomePage',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
        ),
         GetPage(
          name: '/schedule',
          page: () => ScheduleScreen(),
        ),
      ],
    );
  }
}