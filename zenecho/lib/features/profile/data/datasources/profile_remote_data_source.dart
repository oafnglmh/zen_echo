import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(ProfileModel profile);
  Future<ProfileModel> updatePrivacy(ProfileModel profile);
  Future<String> uploadAvatar(String filePath);
  Future<void> deleteAccount();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSourceImpl(this._dio);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _dio.get(ApiEndpoints.me);
    final data = response.data['data'];
    return ProfileModel.fromJson(data);
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    final response = await _dio.put(
      ApiEndpoints.updateProfile,
      data: {
        'name': profile.name,
        'username': profile.username,
        'bio': profile.bio,
        'location': profile.location,
        'website': profile.website,
      },
    );
    final data = response.data['data'];
    return ProfileModel.fromJson(data);
  }

  @override
  Future<ProfileModel> updatePrivacy(ProfileModel profile) async {
    final response = await _dio.put(
      ApiEndpoints.updatePrivacy,
      data: {
        'profileVisibility': profile.profileVisibility,
        'memoryVisibility': profile.memoryVisibility,
        'allowShareMemories': profile.allowShareMemories,
        'showMemoriesOnTimeline': profile.showMemoriesOnTimeline,
        'showOnlineStatus': profile.showOnlineStatus,
        'allowFriendRequests': profile.allowFriendRequests,
        'allowMessagesFrom': profile.allowMessagesFrom,
      },
    );
    final data = response.data['data'];
    return ProfileModel.fromJson(data);
  }

  @override
  Future<String> uploadAvatar(String filePath) async {
    final fileName = filePath.split('/').last;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });

    final response = await _dio.post(ApiEndpoints.uploadAvatar, data: formData);

    final data = response.data['data'];
    final updatedProfile = ProfileModel.fromJson(data);
    return updatedProfile.avatarUrl ?? '';
  }

  @override
  Future<void> deleteAccount() async {
    await _dio.delete(ApiEndpoints.deleteAccount);
  }
}
