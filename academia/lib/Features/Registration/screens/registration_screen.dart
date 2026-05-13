

import 'package:academia/Features/Registration/models/registration_model.dart';
import 'package:academia/Features/Registration/widgets/registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';



class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const RegistrationAppBar(),
      // Single Obx at the top level reacts to viewState changes
      body: Obx(() {
        switch (controller.viewState.value) {
          case RegistrationViewState.loading:
            return const _LoadingView();

          case RegistrationViewState.error:
            return _ErrorView(
              message: controller.errorMessage.value ?? 'Something went wrong.',
              onRetry: controller.fetchData,
            );

          case RegistrationViewState.closed:
            return _ClosedView(semester: controller.registrationData.value!.semester);

          case RegistrationViewState.notOpened:
            return const _NotOpenedView();

          case RegistrationViewState.unpaid:
            return _UnpaidView(
              balance: controller.registrationData.value!.outstandingBalance!,
              dueDate: controller.registrationData.value!.balanceDueDate ?? '',
            );

          case RegistrationViewState.open:
            return _OpenView(controller: controller);
        }
      }),
    );
  }
}

// ─────────────────────────────────────────────
// SUB-VIEWS
// ─────────────────────────────────────────────

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: RegistrationTheme.primary,
          strokeWidth: 2.5,
        ),
      );
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded,
                color: RegistrationTheme.textSecondary, size: 56),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: RegistrationTheme.textSecondary),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: RegistrationTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(RegistrationTheme.radiusMd),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClosedView extends StatelessWidget {
  final Semester semester;
  const _ClosedView({required this.semester});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: RegistrationClosedWidget(semester: semester),
      );
}

class _NotOpenedView extends StatelessWidget {
  const _NotOpenedView();

  @override
  Widget build(BuildContext context) => const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: RegistrationNotOpenedWidget(),
      );
}

class _UnpaidView extends StatelessWidget {
  final double balance;
  final String dueDate;

  const _UnpaidView({required this.balance, required this.dueDate});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: RegistrationUnpaidWidget(
          balance: balance,
          dueDate: dueDate,
          onPayNow: () => Get.toNamed('/payment'),
        ),
      );
}

// ─────────────────────────────────────────────
// OPEN VIEW — course selection
// ─────────────────────────────────────────────
class _OpenView extends StatelessWidget {
  final RegistrationController controller;

  const _OpenView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final data = controller.registrationData.value!;

    return Column(
      children: [
        // Group tabs — reacts to selectedGroupId
        GroupTabBar(
          groups: data.groups,
          selectedGroupId: controller.selectedGroupId,
          onGroupSelected: controller.selectGroup,
        ),

        // Group info card — rebuilds when group changes
        Obx(() {
          final group = controller.selectedGroup;
          if (group == null) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GroupInfoCard(group: group),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                child: Row(
                  children: [
                    const Text(
                      'COURSES SCHEDULE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: RegistrationTheme.textSecondary,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${group.totalCredits} Credits',
                      style: const TextStyle(
                        fontSize: 12,
                        color: RegistrationTheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),

        // Course list
        Expanded(
          child: Obx(() {
            final group = controller.selectedGroup;
            if (group == null) {
              return const Center(child: Text('No group selected'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 8),
              itemCount: group.courses.length,
              itemBuilder: (_, i) {
                final course = group.courses[i];
                return CourseScheduleCard(
                  course: course,
                  onToggle: () => controller.toggleCourse(course.id),
                );
              },
            );
          }),
        ),

        // Sticky confirm button
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          // Obx here so canConfirm reacts to course selection changes
          child: Obx(() => ConfirmRegistrationButton(
                enabled: controller.canConfirm,
                isLoading: controller.isConfirming,
                onTap: controller.confirmRegistration,
              )),
        ),
      ],
    );
  }
}