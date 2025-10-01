import 'dart:typed_data';
import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:coptic_hymns_school/shared/utils/api.dart';
import 'package:dio/dio.dart';

class PaymentService {
  final ApiService apiService;
  PaymentService({required this.apiService});

  Future<Response> uploadPayment({
    required Uint8List fileBytes,
    required String fileName,
    required String enrollmentId,
  }) async {
    final formData = FormData.fromMap({
      "receipt_image": MultipartFile.fromBytes(
        fileBytes,
        filename: fileName,
      ),
      "enrollment_id": enrollmentId,
    });

    final response = await apiService.post(
      ApiConstants.paymentEndpoint,
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response;
  }

}
