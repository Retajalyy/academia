import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';
import '../controller/schedule_controller.dart';
import '../widgets/calendar.dart';
import '../widgets/class_card.dart';

class ScheduleScreen extends StatelessWidget {
final ScheduleController controller = Get.find<ScheduleController>();

  ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Calendar
                Obx(
                  () => CalendarWidget(
                    selectedDate: controller.selectedDate.value,
                    onDateSelected: controller.selectDate,
                  ),
                ),

                const SizedBox(height: 24),

                // Section title
                Text('Classes', style: TextStyles.header2),
                const SizedBox(height: 16),

                // Content
                Obx(() {
                  if (controller.isLoading.value) {
                    return const _LoadingPlaceholder();
                  }

                  if (controller.errorMessage.value != null) {
                    return _ErrorState(
                      message: controller.errorMessage.value!,
                      onRetry: controller.refresh,
                    );
                  }

                  if (controller.classes.isEmpty) {
                    return const _EmptyState();
                  }

                  return Column(
                    children: controller.classes
                        .map((c) => ClassCardWidget(classModel: c))
                        .toList(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  const _LoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.event_available_outlined,
                size: 56, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              'No classes today 🎉',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade500,
                fontFamily: 'Instrument Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.wifi_off_rounded,
                size: 56, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontFamily: 'Instrument Sans',
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}