// ──────────────────────────────────────────────
// registration/widgets/registration_widgets.dart
// ──────────────────────────────────────────────

import 'package:academia/Features/Registration/models/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


// ─────────────────────────────────────────────
// THEME CONSTANTS
// ─────────────────────────────────────────────
class RegistrationTheme {
  RegistrationTheme._();

  static const Color primary = Color(0xFF1A56DB);
  static const Color primaryLight = Color(0xFFEBF2FF);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color success = Color(0xFF22C55E);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color surface = Color(0xFFF9FAFB);

  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
}

// ─────────────────────────────────────────────
// 1. GROUP TAB BAR
// Uses Obx to react to selectedGroupId changes
// ─────────────────────────────────────────────
class GroupTabBar extends StatelessWidget {
  final List<Group> groups;
  final RxString selectedGroupId;
  final ValueChanged<String> onGroupSelected;

  const GroupTabBar({
    super.key,
    required this.groups,
    required this.selectedGroupId,
    required this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: groups.map((g) {
              final selected = g.id == selectedGroupId.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => onGroupSelected(g.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? RegistrationTheme.primary
                          : Colors.transparent,
                      borderRadius:
                          BorderRadius.circular(RegistrationTheme.radiusMd),
                      border: Border.all(
                        color: selected
                            ? RegistrationTheme.primary
                            : RegistrationTheme.border,
                      ),
                    ),
                    child: Text(
                      g.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: selected
                            ? Colors.white
                            : RegistrationTheme.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}

// ─────────────────────────────────────────────
// 2. GROUP INFO CARD
// ─────────────────────────────────────────────
class GroupInfoCard extends StatelessWidget {
  final Group group;

  const GroupInfoCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: RegistrationTheme.primaryLight,
          borderRadius: BorderRadius.circular(RegistrationTheme.radiusLg),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: RegistrationTheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                group.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group ${group.label}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: RegistrationTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${group.totalCourses} Courses · ${group.totalCredits} Credits',
                    style: const TextStyle(
                      fontSize: 13,
                      color: RegistrationTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Select',
                style: TextStyle(
                  color: RegistrationTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 3. COURSE SCHEDULE CARD
// Uses Obx on isSelected (RxBool) for checkbox
// ─────────────────────────────────────────────
class CourseScheduleCard extends StatelessWidget {
  final Course course;
  final VoidCallback onToggle;

  const CourseScheduleCard({
    super.key,
    required this.course,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final hasWarning = course.prerequisiteNote != null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RegistrationTheme.radiusLg),
        border: Border.all(
          color: hasWarning
              ? RegistrationTheme.warning.withOpacity(0.4)
              : RegistrationTheme.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: RegistrationTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${course.creditHours} Credit Hours',
                        style: const TextStyle(
                          fontSize: 12,
                          color: RegistrationTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Checkbox reacts to RxBool
                Obx(() => GestureDetector(
                      onTap: hasWarning ? null : onToggle,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: course.isSelected.value && !hasWarning
                              ? RegistrationTheme.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: hasWarning
                                ? RegistrationTheme.border
                                : course.isSelected.value
                                    ? RegistrationTheme.primary
                                    : RegistrationTheme.border,
                            width: 2,
                          ),
                        ),
                        child: course.isSelected.value && !hasWarning
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 16)
                            : null,
                      ),
                    )),
              ],
            ),
          ),

          // Sessions
          ...course.sessions.map((s) => _SessionRow(session: s)),

          // Prerequisite warning
          if (hasWarning)
            Container(
              margin: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: RegistrationTheme.warning.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: RegistrationTheme.warning.withOpacity(0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: RegistrationTheme.warning, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      course.prerequisiteNote!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: RegistrationTheme.warning,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SessionRow extends StatelessWidget {
  final CourseSession session;
  const _SessionRow({required this.session});

  @override
  Widget build(BuildContext context) {
    final isLecture = session.type == SessionType.lecture;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: isLecture
                  ? RegistrationTheme.primaryLight
                  : const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isLecture ? 'LECTURE' : 'SECTION',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: isLecture
                    ? RegistrationTheme.primary
                    : RegistrationTheme.success,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${session.day}  ${session.timeFrom} – ${session.timeTo}',
            style: const TextStyle(
              fontSize: 13,
              color: RegistrationTheme.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            session.location,
            style: const TextStyle(
              fontSize: 12,
              color: RegistrationTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 4. CONFIRM BUTTON  — Obx on isConfirming
// ─────────────────────────────────────────────
class ConfirmRegistrationButton extends StatelessWidget {
  final bool enabled;
  final RxBool isLoading;
  final VoidCallback onTap;

  const ConfirmRegistrationButton({
    super.key,
    required this.enabled,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Obx(() => SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: enabled && !isLoading.value ? onTap : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: RegistrationTheme.primary,
                disabledBackgroundColor: RegistrationTheme.border,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(RegistrationTheme.radiusMd),
                ),
                elevation: 0,
              ),
              child: isLoading.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Confirm Registration',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
            ),
          )),
    );
  }
}

// ─────────────────────────────────────────────
// 5. REGISTRATION CLOSED WIDGET
// ─────────────────────────────────────────────
class RegistrationClosedWidget extends StatelessWidget {
  final Semester semester;

  const RegistrationClosedWidget({super.key, required this.semester});

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('MMMM d, yyyy');
    return _StatusCard(
      icon: const Icon(Icons.lock_outline_rounded,
          size: 56, color: RegistrationTheme.textSecondary),
      title: 'Registration is now closed',
      subtitle:
          'The registration window for this semester has been closed. You can no longer add or change courses.',
      extraContent: _DateTable(rows: [
        _DateRow(label: 'Semester', value: semester.label, isBold: true),
        _DateRow(
            label: 'Registration opened',
            value: fmt.format(semester.registrationOpen)),
        _DateRow(
            label: 'Registration closed',
            value: fmt.format(semester.registrationClosed),
            isHighlighted: true),
        _DateRow(
            label: 'Semester starts',
            value: fmt.format(semester.semesterStarts)),
      ]),
    );
  }
}

// ─────────────────────────────────────────────
// 6. NOT OPENED YET (FEES PAID) WIDGET
// ─────────────────────────────────────────────
class RegistrationNotOpenedWidget extends StatelessWidget {
  const RegistrationNotOpenedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _StatusCard(
      icon: const Icon(Icons.access_time_rounded,
          size: 56, color: RegistrationTheme.textSecondary),
      title: "Registration hasn't opened yet",
      subtitle:
          'Course registration is not available yet. Check back later.',
      extraContent: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: RegistrationTheme.success.withOpacity(0.08),
          borderRadius: BorderRadius.circular(RegistrationTheme.radiusMd),
          border:
              Border.all(color: RegistrationTheme.success.withOpacity(0.25)),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: RegistrationTheme.success,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'All fees are paid\nYou have no outstanding balance; you\'re all set for when registration opens.',
                style: TextStyle(
                  fontSize: 13,
                  color: RegistrationTheme.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 7. UNPAID BALANCE WIDGET
// ─────────────────────────────────────────────
class RegistrationUnpaidWidget extends StatelessWidget {
  final double balance;
  final String dueDate;
  final VoidCallback onPayNow;

  const RegistrationUnpaidWidget({
    super.key,
    required this.balance,
    required this.dueDate,
    required this.onPayNow,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = NumberFormat('#,###', 'en_US').format(balance.toInt());

    return _StatusCard(
      icon: const Icon(Icons.access_time_rounded,
          size: 56, color: RegistrationTheme.textSecondary),
      title: "Registration hasn't opened yet",
      subtitle:
          'Course registration is not available yet. Check back later.',
      extraContent: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: RegistrationTheme.error.withOpacity(0.06),
              borderRadius: BorderRadius.circular(RegistrationTheme.radiusMd),
              border: Border.all(
                  color: RegistrationTheme.error.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline_rounded,
                    color: RegistrationTheme.error, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Your account has an outstanding balance that must be fully paid before registration opens.',
                    style: TextStyle(
                      fontSize: 13,
                      color: RegistrationTheme.error.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$formatted EGP',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: RegistrationTheme.textPrimary,
                    ),
                  ),
                  Text(
                    'Second semester fee – Due $dueDate',
                    style: const TextStyle(
                      fontSize: 12,
                      color: RegistrationTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onPayNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: RegistrationTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(RegistrationTheme.radiusMd),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  elevation: 0,
                ),
                child: const Text(
                  'Pay now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 8. APP BAR
// ─────────────────────────────────────────────
class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: RegistrationTheme.textPrimary, size: 20),
        onPressed: () => Get.back(),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registration',
            style: TextStyle(
              color: RegistrationTheme.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          Text(
            'Enroll in and manage your courses',
            style: TextStyle(
              color: RegistrationTheme.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_rounded,
              color: RegistrationTheme.textPrimary),
          onPressed: () {},
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// SHARED PRIVATE HELPERS
// ─────────────────────────────────────────────
class _StatusCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final Widget? extraContent;

  const _StatusCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.extraContent,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: RegistrationTheme.surface,
                shape: BoxShape.circle,
                border: Border.all(color: RegistrationTheme.border),
              ),
              child: icon,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: RegistrationTheme.textPrimary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: RegistrationTheme.textSecondary,
                height: 1.5,
              ),
            ),
            if (extraContent != null) extraContent!,
          ],
        ),
      ),
    );
  }
}

class _DateRow {
  final String label;
  final String value;
  final bool isBold;
  final bool isHighlighted;

  const _DateRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.isHighlighted = false,
  });
}

class _DateTable extends StatelessWidget {
  final List<_DateRow> rows;
  const _DateTable({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RegistrationTheme.radiusLg),
        border: Border.all(color: RegistrationTheme.border),
      ),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          final i = entry.key;
          final row = entry.value;
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              border: i < rows.length - 1
                  ? const Border(
                      bottom: BorderSide(
                          color: RegistrationTheme.border, width: 1))
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    row.label,
                    style: const TextStyle(
                      fontSize: 13,
                      color: RegistrationTheme.textSecondary,
                    ),
                  ),
                ),
                Text(
                  row.value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight:
                        row.isBold ? FontWeight.w700 : FontWeight.w500,
                    color: row.isHighlighted
                        ? RegistrationTheme.error
                        : RegistrationTheme.textPrimary,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}