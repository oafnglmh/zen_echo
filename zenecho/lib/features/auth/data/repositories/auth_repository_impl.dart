import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    return _handleNetworkCall(() async {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      // Save tokens securely
      await _secureStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      return response.user.toEntity();
    });
  }

  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    return _handleNetworkCall(() async {
      // 1. Register user
      await _remoteDataSource.register(
        email: email,
        password: password,
        name: name,
      );

      // 2. Automatically log in to get tokens
      final loginResponse = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      // 3. Save tokens securely
      await _secureStorage.saveTokens(
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
      );

      return loginResponse.user.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Even if remote logout fails, we still clear local storage tokens.
    try {
      await _remoteDataSource.logout();
    } catch (_) {
      // Ignore remote error for logging out, clear local cache anyway
    } finally {
      await _secureStorage.clearTokens();
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    return _handleNetworkCall(() async {
      final userModel = await _remoteDataSource.getMe();
      return userModel.toEntity();
    });
  }

  @override
  Future<Either<Failure, bool>> checkSession() async {
    try {
      final hasTokens = await _secureStorage.hasTokens();
      return Right(hasTokens);
    } catch (e) {
      return Left(CacheFailure('Không thể truy cập bộ nhớ bảo mật: $e'));
    }
  }

  Future<Either<Failure, T>> _handleNetworkCall<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.error is SocketException) {
        return const Left(NetworkFailure(
          'Không thể kết nối đến máy chủ. Vui lòng kiểm tra lại kết nối mạng.',
        ));
      }

      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData is Map<String, dynamic>) {
          final message = responseData['message'] ?? 'Đã xảy ra lỗi hệ thống';
          final error = responseData['error'] ?? 'Lỗi';
          final statusCode = responseData['statusCode'] ?? e.response?.statusCode;
          
          final String displayMessage = message is List
              ? message.join(', ')
              : message.toString();

          return Left(ServerFailure(
            displayMessage,
            statusCode: statusCode,
            errorType: error.toString(),
          ));
        }

        return Left(ServerFailure(
          'Lỗi kết nối máy chủ (${e.response?.statusCode})',
          statusCode: e.response?.statusCode,
        ));
      }

      return Left(ServerFailure(
        e.message ?? 'Đã xảy ra lỗi kết nối không xác định.',
      ));
    } catch (e) {
      return Left(UnknownFailure('Lỗi không xác định: $e'));
    }
  }
}
