import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  
  Future<Either<Failure, Profile>> updateProfile(Profile profile);
  
  Future<Either<Failure, String>> uploadAvatar(String filePath);
  
  Future<Either<Failure, void>> deleteAccount();
}
