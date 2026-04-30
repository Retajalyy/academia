import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Features/Assessments/screens/AssessmentScreen.dart';
//import 'Features/Schedule/screens/schedule_screen.dart';
//import 'Features/exam_schedule/screens/exam_Schedule_screen2.dart';
//import 'Features/noexam_schedule/screens/exam_Schedule_screen.dart';
//import 'Features/Academic_results/screens/Academic_results_screen.dart';
//import 'Features/Auth/screens/login_screen.dart';
//import 'Features/Academic_results(courses)/screens/AcademicResultCourseScreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🌐 Initialize Supabase (Auth + Database)
  await Supabase.initialize(
    url: 'https://fwyixcaqfhveqzjmgnuq.supabase.co',
    anonKey: 'sb_publishable_Io9J4NS26dKLj0gTKFk-sA_f1MRN97T',
  );

  runApp(const AcademiaApp());
}

class AcademiaApp extends StatelessWidget {
  const AcademiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Academia',
      debugShowCheckedModeBanner: false,

      /// 🎨 Theme
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      /// 🚀 Start screen
      initialRoute: '/login',

      /// 🧭 Routes (scalable navigation)
      getPages: [
        GetPage(
          name: '/login',
          page: () => Assessmentscreen(),
        ),

        /// 🔥 placeholder home (replace later)
        GetPage(
          name: '/home',
          page: () => const Scaffold(
            body: Center(
              child: Text("Home Screen"),
            ),
          ),
        ),
      ],
    );
  }
}