import 'package:get/get.dart';
import '../model/fees_model.dart';

class FeeService extends GetxService {
  // Replace with your actual Dio/http client
  // final _dio = Get.find<DioClient>();

  Future<List<FeeModel>> fetchFees() async {
    try {
      // TODO: replace with real API call
      // final response = await _dio.get('/fees');
      // return (response.data as List).map((e) => FeeModel.fromJson(e)).toList();

      // ── Mock data (matches your UI) ──────────────────
      await Future.delayed(const Duration(milliseconds: 800));
      return [
        FeeModel(
          id: '1',
          title: 'Graduation Project Fee',
          amount: 5000,
          status: 'unpaid',
          dueDate: DateTime(2026, 4, 20),
        ),
        FeeModel(
          id: '2',
          title: 'Tuition Fee',
          amount: 17000,
          status: 'paid',
          paidOn: DateTime(2026, 3, 1),
          invoiceUrl: 'https://example.com/invoice/2',
        ),
      ];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> payFee(String feeId, String paymentMethod) async {
    try {
      // TODO: replace with real API call
      // await _dio.post('/fees/$feeId/pay', data: {'method': paymentMethod});
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      return false;
    }
  }
}