import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModel> getMe();

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    // The response is wrapped: { success: true, statusCode, message, data: { accessToken, ... } }
    final data = response.data['data'];
    return AuthResponseModel.fromJson(data);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.register,
      data: {
        'email': email,
        'password': password,
        'name': name,
      },
    );

    final data = response.data['data'];
    return UserModel.fromJson(data);
  }

  @override
  Future<UserModel> getMe() async {
    final response = await _dio.get(ApiEndpoints.me);
    final data = response.data['data'];
    return UserModel.fromJson(data);
  }

  @override
  Future<void> logout() async {
    await _dio.post(ApiEndpoints.logout);
  }
}
