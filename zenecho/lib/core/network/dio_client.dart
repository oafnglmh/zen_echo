import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/secure_storage.dart';
import 'jwt_interceptor.dart';

class DioClient {
  final Dio _dio;
  final JwtInterceptor jwtInterceptor;

  DioClient({
    required String baseUrl,
    required SecureStorage secureStorage,
    void Function()? onTokenExpired,
  })  : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: Headers.jsonContentType,
        )),
        jwtInterceptor = JwtInterceptor(
          secureStorage,
          baseUrl: baseUrl,
          onTokenExpired: onTokenExpired,
        ) {
    _dio.interceptors.add(jwtInterceptor);

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ));
    }
  }

  Dio get dio => _dio;
}
