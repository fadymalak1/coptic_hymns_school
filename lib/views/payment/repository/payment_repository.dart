import 'dart:typed_data';
import 'package:coptic_hymns_school/views/payment/services/payment_service.dart';
import 'package:dio/dio.dart';

class PaymentRepository {
  final PaymentService _paymentService;
  PaymentRepository(this._paymentService);

  Future<Map<String, dynamic>> uploadPayment({
    required Uint8List fileBytes,
    required String fileName,
    required String enrollmentId,
  }) async {
    try {
      final response = await _paymentService.uploadPayment(
        fileBytes: fileBytes,
        fileName: fileName,
        enrollmentId: enrollmentId,
      );

      return {"success": true, "data": response.data};
    } on DioError catch (e) {
      return {"success": false, "message": e.response?.data ?? e.message};
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

}
