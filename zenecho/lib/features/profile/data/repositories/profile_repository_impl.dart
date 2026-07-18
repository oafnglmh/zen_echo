import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;
  final SecureStorage _secureStorage;

  ProfileRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._secureStorage,
  );

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final remoteModel = await _remoteDataSource.getProfile();
      await _localDataSource.saveProfile(remoteModel);
      return Right(remoteModel.toEntity());
    } catch (e) {
      try {
        final localModel = await _localDataSource.getProfile();
        return Right(localModel.toEntity());
      } catch (localError) {
        return Left(
          CacheFailure('Không thể đọc thông tin cá nhân: $localError'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      final localModel = await _localDataSource.getProfile();
      final remoteModel = ProfileModel.fromEntity(profile);

      ProfileModel updatedModel;

      final hasPrivacyChanges =
          localModel.profileVisibility != profile.profileVisibility ||
          localModel.memoryVisibility != profile.memoryVisibility ||
          localModel.allowShareMemories != profile.allowShareMemories ||
          localModel.showMemoriesOnTimeline != profile.showMemoriesOnTimeline ||
          localModel.showOnlineStatus != profile.showOnlineStatus ||
          localModel.allowFriendRequests != profile.allowFriendRequests ||
          localModel.allowMessagesFrom != profile.allowMessagesFrom;

      if (hasPrivacyChanges) {
        updatedModel = await _remoteDataSource.updatePrivacy(remoteModel);
      } else {
        updatedModel = await _remoteDataSource.updateProfile(remoteModel);
      }

      await _localDataSource.saveProfile(updatedModel);
      return Right(updatedModel.toEntity());
    } catch (e) {
      return Left(ServerFailure('Không thể lưu thông tin cá nhân: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadAvatar(String filePath) async {
    try {
      final remoteUrl = await _remoteDataSource.uploadAvatar(filePath);

      final currentProfile = await _localDataSource.getProfile();
      final updatedProfile = currentProfile.copyWith(avatarUrl: remoteUrl);
      await _localDataSource.saveProfile(updatedProfile);

      return Right(remoteUrl);
    } catch (e) {
      return Left(ServerFailure('Không thể tải lên ảnh đại diện: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      await _remoteDataSource.deleteAccount();

      await _secureStorage.clearTokens();

      await _localDataSource.deleteProfile();

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Không thể xóa dữ liệu tài khoản: $e'));
    }
  }
}
