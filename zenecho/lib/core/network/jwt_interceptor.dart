import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import 'api_endpoints.dart';

class JwtInterceptor extends QueuedInterceptor {
  final SecureStorage _secureStorage;
  final Dio _refreshDio;
  void Function()? onTokenExpired;

  JwtInterceptor(
    this._secureStorage, {
    required String baseUrl,
    this.onTokenExpired,
  }) : _refreshDio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Attach authorization header if token exists and not already set
    if (!options.headers.containsKey('Authorization')) {
      final accessToken = await _secureStorage.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If it's a 401 Unauthorized and not the refresh token request itself
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != ApiEndpoints.refresh) {
      try {
        final refreshToken = await _secureStorage.getRefreshToken();
        if (refreshToken == null) {
          _handleLogout();
          return handler.next(err);
        }

        // Request a new access token
        final response = await _refreshDio.post(
          ApiEndpoints.refresh,
          options: Options(
            headers: {'Authorization': 'Bearer $refreshToken'},
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseData = response.data;
          final success = responseData['success'] as bool? ?? false;

          if (success && responseData['data'] != null) {
            final data = responseData['data'];
            final newAccessToken = data['accessToken'] as String;
            final newRefreshToken = data['refreshToken'] as String;

            // Save new tokens
            await _secureStorage.saveTokens(
              accessToken: newAccessToken,
              refreshToken: newRefreshToken,
            );

            // Clone the original request with the new access token
            final originalRequestOptions = err.requestOptions;
            originalRequestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            // Re-execute request with new token
            final retryDio = Dio(BaseOptions(
              baseUrl: originalRequestOptions.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

            final retryResponse = await retryDio.request(
              originalRequestOptions.path,
              data: originalRequestOptions.data,
              queryParameters: originalRequestOptions.queryParameters,
              options: Options(
                method: originalRequestOptions.method,
                headers: originalRequestOptions.headers,
              ),
            );

            return handler.resolve(retryResponse);
          }
        }

        _handleLogout();
        return handler.next(err);
      } catch (e) {
        _handleLogout();
        return handler.next(err);
      }
    }

    super.onError(err, handler);
  }

  void _handleLogout() {
    _secureStorage.clearTokens();
    onTokenExpired?.call();
  }
}
