import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:coptic_hymns_school/shared/providers/api_provider.dart';
import 'package:coptic_hymns_school/views/payment/repository/payment_repository.dart';
import 'package:coptic_hymns_school/views/payment/services/payment_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final selectedPaymentMethodProvider = StateProvider<String>((ref) => "instapay");

// Provider للـ Service
final paymentServiceProvider = Provider<PaymentService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PaymentService(apiService: apiService);
});

// Provider للـ Repository
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final service = ref.watch(paymentServiceProvider);
  return PaymentRepository(service);
});

// StateNotifier لحالة الرفع
class PaymentUploadNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final PaymentRepository _repository;

  PaymentUploadNotifier(this._repository) : super(const AsyncValue.data({}));

  Future<void> uploadPayment(
      Uint8List fileBytes,
      String fileName,
      String enrollmentId,
      ) async {
    state = const AsyncValue.loading();

    final result = await _repository.uploadPayment(
      fileBytes: fileBytes,
      fileName: fileName,
      enrollmentId: enrollmentId,
    );

    if (result["success"] == true) {
      state = AsyncValue.data(result["data"]);
    } else {
      state = AsyncValue.error(result["message"], StackTrace.current);
    }
  }

}

// Provider للـ Notifier
final paymentUploadProvider =
StateNotifierProvider<PaymentUploadNotifier, AsyncValue<Map<String, dynamic>>>(
        (ref) {
      final repo = ref.watch(paymentRepositoryProvider);
      return PaymentUploadNotifier(repo);
    });