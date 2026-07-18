import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/profile.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchRequested() = _FetchRequested;
  const factory ProfileEvent.updateRequested(Profile profile) = _UpdateRequested;
  const factory ProfileEvent.avatarUploadRequested(String filePath) = _AvatarUploadRequested;
}
