import 'package:academia/Features/Splash/screens/splash_screen.dart';
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
      initialRoute: '/splash',

      // 👇 routes
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
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
          name: '/Schedule',
          page: () => ScheduleScreen(),
        ),
      ],
    );
  }
}