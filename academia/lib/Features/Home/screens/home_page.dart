import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academia/Features/Home/controllers/home_controller.dart';
import 'package:academia/Features/Home/widgets/Due_soon_card.dart';
import 'package:academia/Features/Home/widgets/schedule_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F3FA),
      body: Column(
        children: [
          // ── 1. Header ──────────────────────────────────────────────
          _Header(controller: controller, sw: sw, sh: sh),

          // ── 2. Scrollable body ─────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: sh * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Today's Schedule
                  _SectionHeader(
                    title: "Today's Schedule",
                    actionLabel: "Full schedule >",
                    sw: sw,
                    sh: sh,
                  ),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: sw * 0.045),
                        itemCount: controller.dailySchedule.length,
                        itemBuilder: (context, index) {
                          return ScheduleCard(
                            item: controller.dailySchedule[index],
                            accentColor: index == 1
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFF2D4B94),
                            isLast: index == controller.dailySchedule.length - 1,
                          );
                        },
                      )),

                  SizedBox(height: sh * 0.02),

                  // Due Soon
                  _SectionHeader(
                    title: "Due Soon",
                    actionLabel: "All courses >",
                    sw: sw,
                    sh: sh,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.045),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(sw * 0.04),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: sw * 0.04,
                            offset: Offset(0, sw * 0.01),
                          ),
                        ],
                      ),
                      child: Obx(() => Column(
                            children: List.generate(
                              controller.assignments.length,
                              (index) => Column(
                                children: [
                                  DueSoonCard(
                                      assignment: controller.assignments[index]),
                                  if (index != controller.assignments.length - 1)
                                    Divider(
                                      height: 1,
                                      indent: sw * 0.04,
                                      endIndent: sw * 0.04,
                                      color: Colors.grey.shade100,
                                    ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // NO bottomNavigationBar — handled externally by BottomBar widget
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  final HomeController controller;
  final double sw, sh;
  const _Header({required this.controller, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: sh * 0.065,
        left: sw * 0.055,
        right: sw * 0.055,
        bottom: sh * 0.03,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF2D4B94),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: sw * 0.038,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: sh * 0.003),
                  Obx(() => Text(
                        controller.userName.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: sw * 0.065,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      )),
                ],
              ),
              // Notification bell with yellow dot badge
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(sw * 0.022),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: sw * 0.065,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: sw * 0.025,
                      height: sw * 0.025,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: sh * 0.025),

          // ── Next Class card ────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: sw * 0.045,
              vertical: sh * 0.018,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.13),
              borderRadius: BorderRadius.circular(sw * 0.04),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "NEXT CLASS" label + "In 20 min" pill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NEXT CLASS",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: sw * 0.028,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sw * 0.03,
                        vertical: sh * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC107),
                        borderRadius: BorderRadius.circular(sw * 0.05),
                      ),
                      child: Text(
                        "In 20 min",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: sw * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: sh * 0.008),

                // Course name
                Text(
                  "Cloud Computing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.052,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: sh * 0.008),

                // Time & Room row
                Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        color: Colors.white60, size: sw * 0.038),
                    SizedBox(width: sw * 0.015),
                    Text(
                      "09:00 - 11:00",
                      style: TextStyle(
                          color: Colors.white70, fontSize: sw * 0.032),
                    ),
                    SizedBox(width: sw * 0.045),
                    Icon(Icons.location_on_outlined,
                        color: Colors.white60, size: sw * 0.038),
                    SizedBox(width: sw * 0.01),
                    Text(
                      "Room B1",
                      style: TextStyle(
                          color: Colors.white70, fontSize: sw * 0.032),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Header
// ─────────────────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final double sw, sh;
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.sw,
    required this.sh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: sw * 0.055,
        right: sw * 0.04,
        top: sh * 0.022,
        bottom: sh * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: sw * 0.046,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A2E),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              actionLabel,
              style: TextStyle(
                fontSize: sw * 0.033,
                color: const Color(0xFF2D4B94),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}