import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/profile_model.dart';

abstract interface class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
  Future<void> saveProfile(ProfileModel profile);
  Future<void> deleteProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  static const _keyProfile = 'user_profile_data';

  ProfileLocalDataSourceImpl(this._secureStorage);

  @override
  Future<ProfileModel> getProfile() async {
    final rawJson = await _secureStorage.read(key: _keyProfile);
    if (rawJson != null) {
      try {
        final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
        return ProfileModel.fromJson(decoded);
      } catch (_) {
        // Fallback to default if JSON is corrupted
      }
    }
    return _buildDefaultProfile();
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    final rawJson = jsonEncode(profile.toJson());
    await _secureStorage.write(key: _keyProfile, value: rawJson);
  }

  @override
  Future<void> deleteProfile() async {
    await _secureStorage.delete(key: _keyProfile);
  }

  ProfileModel _buildDefaultProfile() {
    return const ProfileModel(
      id: 'default-profile-id',
      name: 'Lê Minh Hoàng',
      username: 'hoangcoder',
      bio: 'Collecting moments, not things.\nBuilding ZenEcho 💙',
      avatarUrl: null,
      location: 'Da Nang, Vietnam',
      website: 'https://github.com/hoangcoder',
      memoriesCount: 128,
      friendsCount: 24,
      capsulesCount: 12,
      profileVisibility: 'Friends',
      memoryVisibility: 'Friends',
      allowShareMemories: true,
      showMemoriesOnTimeline: true,
      showOnlineStatus: true,
      allowFriendRequests: true,
      allowMessagesFrom: 'Friends',
    );
  }
}
