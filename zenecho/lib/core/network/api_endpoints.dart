import 'dart:io';
import 'package:flutter/foundation.dart';

abstract final class ApiEndpoints {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000';
    }
    if (Platform.isAndroid) {
      // 10.0.2.2 maps to the host's localhost (127.0.0.1) on Android emulators.
      return 'http://10.0.2.2:3000';
    }
    return 'http://localhost:3000';
  }

  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String me = '/auth/me';
  static const String logout = '/auth/logout';
  static const String updateProfile = '/auth/profile';
  static const String updatePrivacy = '/auth/privacy';
  static const String uploadAvatar = '/auth/avatar';
  static const String deleteAccount = '/auth/delete';
}
