import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/course_controller.dart';
import '../services/course_services.dart';

import '../widgets/course_headr.dart';
import '../widgets/search_bar.dart';
import '../widgets/course_card .dart';

import '../../../Core/utilities/colors.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Inject controller
    final controller = Get.put(
      CourseController(
        service: CourseService.instance,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔵 HEADER
            const courseHeader(),

            /// 🔵 BODY
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.babyblue,
                ),

                /// ✅ Reactive UI
                child: Obx(() {
                  // 🔄 Loading
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // ❌ Error
                  if (controller.errorMessage.value.isNotEmpty) {
                    return Center(
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  // 📚 Content
                  return Column(
                    children: [
                      /// 🔍 SEARCH
                      SearchBarWidget(
                        onChanged: controller.onSearchChanged,
                      ),

                      const SizedBox(height: 18),

                      /// 📚 COURSE LIST
                      Expanded(
                        child: ListView.separated(
                          itemCount:
                              controller.filteredCourses.length,

                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),

                          itemBuilder: (context, index) {
                            final course =
                                controller.filteredCourses[index];

                            return CourseCard(
                              title: course.title,
                              doctor: course.doctor,
                              type: course.type,
                              credits: course.credits,
                              day: course.day,
                              time: course.time,
                              location: course.location,
                              color: course.color,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}