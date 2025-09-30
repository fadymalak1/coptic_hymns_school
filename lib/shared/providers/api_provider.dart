import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../views/home/provider/home_provider.dart';
import 'local_provider.dart';

final dioProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = 'https://admin.coptichymnsschool.com/api';

  // ✅ اللغة الحالية (كود فقط en/ar)
  final locale = ref.watch(localeProvider); // depends on locale

  dio.interceptors.clear();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Accept-Language'] = locale.languageCode;
        options.connectTimeout = const Duration(seconds: 60);
        options.receiveTimeout = const Duration(seconds: 60);
        options.sendTimeout = const Duration(seconds: 60);
        return handler.next(options);
      },
    ),
  );
  return dio;
});

final apiServiceProvider = Provider.autoDispose<ApiService>((ref) {
  final locale = ref.watch(localeProvider); // depends on locale
  final dio = ref.watch(dioProvider);
  return ApiService(dio, ref);
});
