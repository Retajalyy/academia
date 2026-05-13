import 'package:get/get.dart';
import '../model/fees_model.dart';
import '../service/fees_service.dart';

class FeeController extends GetxController {
  final FeeService _service = Get.find<FeeService>();

  // ── State ────────────────────────────────────────────
  final fees        = <FeeModel>[].obs;
  final isLoading   = false.obs;
  final errorMsg    = ''.obs;

  // ── Computed ─────────────────────────────────────────
  List<FeeModel> get dueFees  => fees.where((f) => !f.isPaid).toList();
  List<FeeModel> get paidFees => fees.where((f) => f.isPaid).toList();

  double get totalFees    => fees.fold(0, (sum, f) => sum + f.amount);
  double get totalPaid    => paidFees.fold(0, (sum, f) => sum + f.amount);
  double get outstanding  => dueFees.fold(0, (sum, f) => sum + f.amount);
  double get progress     => totalFees == 0 ? 0 : totalPaid / totalFees;

  // ── Lifecycle ─────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    loadFees();
  }

  // ── Methods ───────────────────────────────────────────
  Future<void> loadFees() async {
    isLoading.value = true;
    errorMsg.value  = '';
    try {
      final result = await _service.fetchFees();
      fees.assignAll(result);
    } catch (e) {
      errorMsg.value = 'Failed to load fees. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> payFee(String feeId, String method) async {
    isLoading.value = true;
    try {
      final success = await _service.payFee(feeId, method);
      if (success) {
        final index = fees.indexWhere((f) => f.id == feeId);
        if (index != -1) {
          fees[index] = FeeModel(
            id:       fees[index].id,
            title:    fees[index].title,
            amount:   fees[index].amount,
            status:   'paid',
            paidOn:   DateTime.now(),
            dueDate:  fees[index].dueDate,
            invoiceUrl: fees[index].invoiceUrl,
          );
          fees.refresh();
        }
        Get.snackbar('Success', 'Payment completed!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Payment failed. Try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading.value = false;
    }
  }
}