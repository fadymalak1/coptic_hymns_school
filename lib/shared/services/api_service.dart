// Dart imports:
import 'dart:developer';
import 'dart:developer' as AppLogger;

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Project imports:

// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:

class ApiService {
  final Dio _dio;
  final Ref ref;

  ApiService(this._dio, this.ref);

  /// Retry helper for connection errors
  Future<Response> _retryOnReconnect(
      Future<Response> Function() requestFn,
      ) async {
    AppLogger.log(
      "Connection error detected. Waiting for internet to reconnect...",
    );

    // Wait for the internet status to be true (online)
    AppLogger.log("Internet reconnected. Retrying request...");
    return await requestFn();
  }

  Future<Response> post(
      String endpoint,
      { // 👈 بدل Map<String, dynamic>
        dynamic? data,
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      // اعمل نسخة للـ log بس لو كان data Map عشان ما يبوظش مع FormData
      dynamic logData;
      if (data is Map<String, dynamic>) {
        logData = Map.from(data);
        if (logData.containsKey('password')) {
          logData['password'] = '******';
        }
      } else {
        logData = data.toString();
      }

      AppLogger.log('POST $endpoint with data: $logData');

      final response = await _dio.post(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options:
        options ??
            Options(
              receiveTimeout: const Duration(seconds: 30),
              sendTimeout: const Duration(seconds: 30),
              headers: {
                'Accept': 'application/json',
                // 👇 خلي Content-Type dynamic
                if (data is! FormData) 'Content-Type': 'application/json',
              },
              validateStatus: (status) {
                return status != null && status >= 200 && status < 500;
              },
            ),
      );

      AppLogger.log('Response from $endpoint: ${response.data}');

      if (response.data == null) {
        throw Exception("Server returned empty response");
      }

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await _retryOnReconnect(
              () => post(endpoint, data: data, options: options),
        );
      }


      AppLogger.log(
        'POST Error at $endpoint',
        error: e,
        stackTrace: e.stackTrace,
      );
      throw Exception("POST Error at $endpoint");
    } catch (e, stackTrace) {
      AppLogger.log(
        'Unexpected error at $endpoint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception("Unexpected error at $endpoint");
    }
  }

  Future<Response> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {


      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(receiveTimeout: const Duration(seconds: 30)),
      );

      AppLogger.log('Response from GET $endpoint: ${response.statusCode}');

      if (response.data == null) {
        throw Exception("Server returned empty response");
      }

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await _retryOnReconnect(
              () => get(endpoint, queryParameters: queryParameters),
        );
      }

      log("Error: ${e.response?.data}");
      final errorDetails = {
        'endpoint': endpoint,
        'error': e.toString(),
        'message': e.message,
        'response': e.response?.data,
        'stackTrace': e.stackTrace.toString(),
        'type': e.type.name,
      };

      if (e.response?.statusCode == 429) {
        await Future.delayed(const Duration(seconds: 30));
      }

      AppLogger.log(
        'GET Error at $endpoint',
        error: e,
        stackTrace: e.stackTrace,
      );
      throw Exception("GET Error at $endpoint");
    } catch (e, stackTrace) {
      AppLogger.log(
        'Unexpected GET error at $endpoint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception("Unexpected GET error at $endpoint");
    }
  }

  // void _redirectToLogin() {
  //
  // notificationNavigatorKey.currentState?.pushAndRemoveUntil(
  //   MaterialPageRoute(builder: (context) => const Login()),
  //   (route) => false,
  //   ).then((_) {
  //     // Reset the flag after navigation is complete
  //     _isRedirectingToLogin = false;
  //   });
  //    }

  Future<Response> put(String endpoint, Map<String, dynamic> data, {Map<String, dynamic>? queryParameters}) async {
    try {
      final logData = Map.from(data);
      if (logData.containsKey('password')) {
        logData['password'] = '******';
      }

      AppLogger.log('PUT $endpoint with data: $logData');

      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      );

      AppLogger.log('Response from PUT $endpoint: ${response.statusCode}');

      if (response.data == null) {
        throw Exception("Server returned empty response");
      }

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await _retryOnReconnect(() => put(endpoint, data));
      }

      final errorDetails = {
        'endpoint': endpoint,
        'error': e.toString(),
        'message': e.message,
        'response': e.response?.data,
        'stackTrace': e.stackTrace.toString(),
        'type': e.type.name,
      };
      log("Error: ${e.response?.data}");

      AppLogger.log(
        'PUT Error at $endpoint',
        error: e,
        stackTrace: e.stackTrace,
      );
      throw Exception("PUT Error at $endpoint");
    } catch (e, stackTrace) {
      log("Error: $e");
      AppLogger.log(
        'Unexpected PUT error at $endpoint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception("Unexpected PUT error at $endpoint");
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      );
      if (response.data == null) {
        throw Exception("Server returned empty response");
      }
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return await _retryOnReconnect(() => delete(endpoint, queryParameters: queryParameters));
      }
      throw Exception("DELETE Error at $endpoint");
    } catch (e, stackTrace) {
      log("Error: $e");
      AppLogger.log(
        'Unexpected DELETE error at $endpoint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception("Unexpected DELETE error at $endpoint");
    }

  }

  String _getDioErrorMessage(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return e.response?.data?['message'] ?? 'Invalid request';
        case 401:
          return 'Session expired. Please login again';
        case 403:
          return 'You don\'t have permission for this action';
        case 404:
          return 'Resource not found';
        case 409:
          return 'Conflict occurred. Please try again';
        case 429:
          return 'Too many requests. Please wait before trying again';
        case 500:
          return 'Server error. Please try again later';
      }
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Connection timeout. Please check your internet connection';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network settings';
      case DioExceptionType.badCertificate:
        return 'Security error occurred. Please try again';
      case DioExceptionType.badResponse:
        return e.response?.data?['message'] ?? 'User Not Exists';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      default:
        return e.message ?? 'Network request failed';
    }
  }
}
