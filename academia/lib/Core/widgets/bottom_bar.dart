import 'package:academia/Features/Home/screens/home_page.dart';
import 'package:academia/Features/profile/screens/profile_page.dart';
import 'package:academia/Features/schedule/screens/schedule_screen.dart';
import 'package:academia/Features/Services/screens/services_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<BottomBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
     HomePage(),
    const ScheduleScreen(),
    const ServicesMainScreen(),
    const ProfilePage(),
  ];

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

Widget buildSvgIcon(String path, {bool isActive = false}) {
  return SvgPicture.asset(
    path,
    width: 31,
    height: 31,
    colorFilter: ColorFilter.mode(
      isActive ? const Color(0xFF2468A0) : Colors.black,
      BlendMode.srcIn,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabChanged,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: buildSvgIcon("lib/assets/Icons/home.svg"),
            activeIcon: buildSvgIcon("lib/assets/Icons/home.svg", isActive: true),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: buildSvgIcon("lib/assets/Icons/schedule.svg"),
            activeIcon:
                buildSvgIcon("lib/assets/Icons/schedule.svg", isActive: true),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: buildSvgIcon("lib/assets/Icons/services.svg"),
            activeIcon:
                buildSvgIcon("lib/assets/Icons/services.svg", isActive: true),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: buildSvgIcon("lib/assets/Icons/profile.svg"),
            activeIcon:
                buildSvgIcon("lib/assets/Icons/profile.svg", isActive: true),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}