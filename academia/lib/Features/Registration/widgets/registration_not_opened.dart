import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/registration_controller.dart';
import '../models/registration_model.dart';

/// Shown when registration has not opened yet.
/// Handles two sub-states (Images 3 & 4):
///   - balanceInfo.isPaid == false  → outstanding balance + Pay Now button
///   - balanceInfo.isPaid == true   → green "All fees are paid" chip
class RegistrationNotOpenedWidget extends StatelessWidget {
  const RegistrationNotOpenedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<RegistrationController>();

    return Obx(() {
      if (ctrl.isLoading.value) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(48),
            child: CircularProgressIndicator(color: Color(0xFF1A6EFF)),
          ),
        );
      }

      final balance = ctrl.balanceInfo.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          _ClockIcon(),
          const SizedBox(height: 24),
          const Text(
            "Registration hasn't opened yet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Course registration for Semester 4 is\nnot available yet. Check back later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),

          // Balance section
          if (balance != null) ...[
            if (!balance.isPaid) ...[
              _OutstandingBalanceBanner(
                balance: balance,
                onPayNow: ctrl.payNow,
                isSubmitting: ctrl.isSubmitting.value,
              ),
            ] else ...[
              _FeesPaidChip(),
            ],
          ],
        ],
      );
    });
  }
}

// ── Clock Icon ────────────────────────────────────────────────────────────────

class _ClockIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF3F4F6),
      ),
      child: const Icon(
        Icons.access_time_rounded,
        size: 38,
        color: Color(0xFF9CA3AF),
      ),
    );
  }
}

// ── Outstanding Balance Banner ─────────────────────────────────────────────────

class _OutstandingBalanceBanner extends StatelessWidget {
  final BalanceInfo balance;
  final VoidCallback onPayNow;
  final bool isSubmitting;

  const _OutstandingBalanceBanner({
    required this.balance,
    required this.onPayNow,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    final formattedAmount = NumberFormat('#,###').format(balance.outstandingAmount);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFED7AA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Warning badge row
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded,
                  color: Color(0xFFF97316), size: 16),
              const SizedBox(width: 6),
              const Text(
                'Your account has an outstanding balance',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF92400E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Your account has an outstanding balance. Please pay your fees in full before registration opens.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF92400E),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),

          // Amount + Pay Now row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$formattedAmount ${balance.currency}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Text(
                    'Due ${balance.dueDate}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: isSubmitting ? null : onPayNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A6EFF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 0,
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Pay now',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Fees Paid Chip ────────────────────────────────────────────────────────────

class _FeesPaidChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFBBF7D0)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF22C55E),
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'All fees are paid',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF14532D),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'You are now set for when registration opens.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF166534),
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