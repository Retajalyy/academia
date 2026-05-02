import 'package:academia/Features/Home/controllers/home_controller.dart';
import 'package:academia/Features/Home/widgets/Due_soon_card.dart';
import 'package:academia/Features/Home/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // Injecting the controller to ensure it is found
    Get.put(HomeController()); 

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SingleChildScrollView( // Makes the whole page scrollable
        child: Column(
          children: [
            // 1. Header Section
            Container(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
              decoration: const BoxDecoration(
                color: Color(0xFF2D4B94),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30), 
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                        "Good Morning,\n${controller.userName}", 
                        style: const TextStyle(
                          color: Colors.white, 
                          fontSize: 24, 
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Next Class Highlight Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15), 
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NEXT CLASS", style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text(
                              "Cloud Computing", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.white70, size: 14),
                                SizedBox(width: 4),
                                Text("09:00 - 11:00", style: TextStyle(color: Colors.white70, fontSize: 12)),
                                SizedBox(width: 10),
                                Icon(Icons.location_on, color: Colors.white70, size: 14),
                                SizedBox(width: 4),
                                Text("Room B1", style: TextStyle(color: Colors.white70, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "In 20 min", 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            // 2. Today's Schedule Section
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Schedule", 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {}, 
                        child: const Text("Full schedule >", style: TextStyle(color: Color(0xFF2D4B94))),
                      ),
                    ],
                  ),
                  // List of Schedule Cards
                  Obx(() => ListView.builder(
                    shrinkWrap: true, // Crucial for nested lists
                    physics: const NeverScrollableScrollPhysics(), // Scroll handled by Parent
                    itemCount: controller.dailySchedule.length,
                    itemBuilder: (context, index) {
                      return ScheduleCard(
                        item: controller.dailySchedule[index],
                        accentColor: index % 2 == 0 ? const Color(0xFF2D4B94) : const Color(0xFFFFC107),
                        isLast: index == controller.dailySchedule.length - 1,
                      );
                    },
                  )),
                ],
              ),
            ),

            // 3. Due Soon Section (Matches image_6850b3.png)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Due Soon", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: const Text("All courses >", style: TextStyle(color: Color(0xFF2D4B94)))),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Obx(() => Column(
                      children: controller.assignments.map((a) => DueSoonCard(assignment: a)).toList(),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2D4B94),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}