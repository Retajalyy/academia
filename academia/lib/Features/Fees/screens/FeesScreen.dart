import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academia/Features/Fees/controller/fees_controller.dart';
import 'package:academia/Features/Fees/service/fees_service.dart';
import 'package:academia/Features/Fees/widgets/fees_headr.dart';
import 'package:academia/Features/Fees/widgets/DueFee_card.dart';
import 'package:academia/Features/Fees/widgets/Paid_Fees.dart';
import 'package:academia/Features/Fees/widgets/pay_button.dart';
import 'package:academia/Core/utilities/colors.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Ensure service is registered, then inject controller ──
    if (!Get.isRegistered<FeeService>()) {
      Get.put(FeeService(), permanent: true);
    }
    final controller = Get.put(FeeController());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pushReplacementNamed(context, '/services');
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBlue,
        body: SafeArea(
          child: Obx(() {
            // ── Loading State ──────────────────────────────────
            if (controller.isLoading.value && controller.fees.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            // ── Error State ────────────────────────────────────
            if (controller.errorMsg.value.isNotEmpty && controller.fees.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.white54, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      controller.errorMsg.value,
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: controller.loadFees,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Retry"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              );
            }

            // ── Main Content ───────────────────────────────────
            return Column(
              children: [
                /// Header (reactive)
                FeesHeader(
                  outstanding: controller.outstanding,
                  totalFees: controller.totalFees,
                  totalPaid: controller.totalPaid,
                  progress: controller.progress,
                ),

                /// Body
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.babyblue,
                    ),
                    child: RefreshIndicator(
                      onRefresh: controller.loadFees,
                      color: AppColors.primaryBlue,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Due fees section
                            if (controller.dueFees.isNotEmpty) ...[
                              ...controller.dueFees.map(
                                (fee) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: DueFeeCard(fee: fee),
                                ),
                              ),
                            ],

                            /// Paid fees section
                            if (controller.paidFees.isNotEmpty) ...[
                              ...controller.paidFees.map(
                                (fee) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: PaidFeeCard(fee: fee),
                                ),
                              ),
                            ],

                            /// Pay button — only show if there are due fees
                            if (controller.dueFees.isNotEmpty)
                              PayButton(
                                outstanding: controller.outstanding,
                              ),

                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}