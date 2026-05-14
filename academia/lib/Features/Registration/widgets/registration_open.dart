import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../models/registration_model.dart';


/// Shown when registration is open.
/// Matches Figma: group card, lectures schedule cards, confirm CTA.
class RegistrationOpenWidget extends StatelessWidget {
  const RegistrationOpenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<RegistrationController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GroupCard(ctrl: ctrl),
        const SizedBox(height: 20),
        _ScheduleSection(ctrl: ctrl),
        const SizedBox(height: 20),
        _ConfirmButton(ctrl: ctrl),
        const SizedBox(height: 24),
      ],
    );
  }
}

// ── Group Card ────────────────────────────────────────────────────────────────

class _GroupCard extends StatelessWidget {
  final RegistrationController ctrl;
  const _GroupCard({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final group = ctrl.selectedGroup;
      final groupLabel = group?.label ?? 'Group SE1';
      final courseCount = group?.lectures.length ?? 0;
      final credits = group?.creditHours ?? 0;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // "SE1" avatar — dark navy circle with white bold text
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFF0F1B3D),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'SE1',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupLabel,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$courseCount Courses · $credits Credits',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: open group picker bottom sheet
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A6EFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// ── Schedule Section ──────────────────────────────────────────────────────────

class _ScheduleSection extends StatelessWidget {
  final RegistrationController ctrl;
  const _ScheduleSection({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.isLoading.value) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(color: Color(0xFF1A6EFF)),
          ),
        );
      }

      final courses = ctrl.scheduledCourses;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'LECTURES SCHEDULE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9CA3AF),
                  letterSpacing: 0.8,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${ctrl.totalCreditHours} Credits',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A6EFF),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...courses.map((cw) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _CourseCard(courseWithWarning: cw),
              )),
        ],
      );
    });
  }
}

// ── Course Card ───────────────────────────────────────────────────────────────

class _CourseCard extends StatelessWidget {
  final CourseWithWarning courseWithWarning;
  const _CourseCard({required this.courseWithWarning});

  @override
  Widget build(BuildContext context) {
    final lec = courseWithWarning.lecture;
    final hasWarning = courseWithWarning.warningMessage != null;
    final isLocked = courseWithWarning.isLocked ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Colored left border strip ─────────────────────────────
            Container(
              width: 4,
              color: hasWarning
                  ? const Color(0xFFEF4444)
                  : const Color(0xFF1A6EFF),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Course name row + credits badge + lock ────
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                lec.courseName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Credits badge (blue pill, top-right)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${lec.creditHours} Credits',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A6EFF),
                                ),
                              ),
                            ),
                            // Lock icon when prerequisite not met
                            if (isLocked) ...[
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.lock_outline_rounded,
                                size: 14,
                                color: Color(0xFFEF4444),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 10),

                        // ── LECTURE · Day chip ────────────────────────
                        _InfoChip(
                          icon: Icons.menu_book_rounded,
                          label: 'LECTURE · ${lec.day}',
                          color: const Color(0xFF1A6EFF),
                          bgColor: const Color(0xFFEFF6FF),
                        ),
                        const SizedBox(height: 8),

                        // Time
                        _IconRow(
                          icon: Icons.access_time_rounded,
                          text: '${lec.timeFrom} - ${lec.timeTo}',
                        ),
                        const SizedBox(height: 4),

                        // Instructor
                        _IconRow(
                          icon: Icons.person_outline_rounded,
                          text: lec.instructor,
                        ),

                        // Room
                        if (lec.room != null) ...[
                          const SizedBox(height: 4),
                          _IconRow(
                            icon: Icons.location_on_outlined,
                            text: lec.room!,
                          ),
                        ],

                        // ── SECTION chip (amber) ──────────────────────
                        if (lec.sectionDay != null) ...[
                          const SizedBox(height: 10),
                          _InfoChip(
                            icon: Icons.edit_note_rounded,
                            label: 'SECTION · ${lec.sectionDay}',
                            color: const Color(0xFFF59E0B),
                            bgColor: const Color(0xFFFFFBEB),
                          ),
                          if (lec.sectionInstructor != null) ...[
                            const SizedBox(height: 8),
                            _IconRow(
                              icon: Icons.person_outline_rounded,
                              text: lec.sectionInstructor!,
                            ),
                          ],
                          if (lec.sectionTime != null) ...[
                            const SizedBox(height: 4),
                            _IconRow(
                              icon: Icons.access_time_rounded,
                              text: lec.sectionTime!,
                            ),
                          ],
                          if (lec.sectionRoom != null) ...[
                            const SizedBox(height: 4),
                            _IconRow(
                              icon: Icons.location_on_outlined,
                              text: lec.sectionRoom!,
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),

                  // ── Warning footer strip ──────────────────────────────
                  if (hasWarning)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 9),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF1F1),
                        border: Border(
                          top: BorderSide(color: Color(0xFFFFCDD2)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              size: 13, color: Color(0xFFEF4444)),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              courseWithWarning.warningMessage!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFFB91C1C),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // ── "+ Add" button row (bottom-right) ─────────────────
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: add course action
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add_rounded,
                                  size: 14, color: Color(0xFF1A6EFF)),
                              SizedBox(width: 3),
                              Text(
                                'Add',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A6EFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Shared small widgets ──────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bgColor;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: const Color(0xFF9CA3AF)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
        ),
      ],
    );
  }
}

// ── Confirm Registration Button ───────────────────────────────────────────────

class _ConfirmButton extends StatelessWidget {
  final RegistrationController ctrl;
  const _ConfirmButton({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed:
              ctrl.isSubmitting.value ? null : ctrl.confirmRegistration,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A6EFF),
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xFF93C5FD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: ctrl.isSubmitting.value
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Confirm Registration',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
        ),
      );
    });
  }
}