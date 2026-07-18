import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/profile.dart';
import '../../../domain/usecases/get_profile_use_case.dart';
import '../../../domain/usecases/update_profile_use_case.dart';
import '../../../domain/usecases/upload_avatar_use_case.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UploadAvatarUseCase _uploadAvatarUseCase;

  ProfileBloc({
    required GetProfileUseCase getProfileUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
    required UploadAvatarUseCase uploadAvatarUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        _uploadAvatarUseCase = uploadAvatarUseCase,
        super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.when(
        fetchRequested: () async => await _onFetchRequested(emit),
        updateRequested: (profile) async => await _onUpdateRequested(profile, emit),
        avatarUploadRequested: (filePath) async => await _onAvatarUploadRequested(filePath, emit),
      );
    });
  }

  Future<void> _onFetchRequested(Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    final result = await _getProfileUseCase();
    result.fold(
      (failure) => emit(ProfileState.failure(failure.message)),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onUpdateRequested(
    Profile profile,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = state.maybeWhen(
      loaded: (p) => p,
      updateSuccess: (p) => p,
      orElse: () => profile,
    );
    emit(ProfileState.updating(currentProfile));
    
    final result = await _updateProfileUseCase(profile);
    result.fold(
      (failure) => emit(ProfileState.failure(failure.message)),
      (updatedProfile) => emit(ProfileState.updateSuccess(updatedProfile)),
    );
  }

  Future<void> _onAvatarUploadRequested(
    String filePath,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = state.maybeWhen(
      loaded: (p) => p,
      updateSuccess: (p) => p,
      orElse: () => null,
    );
    if (currentProfile == null) return;
    
    emit(ProfileState.updating(currentProfile));
    final result = await _uploadAvatarUseCase(filePath);
    
    result.fold(
      (failure) => emit(ProfileState.failure(failure.message)),
      (newUrl) {
        final updated = currentProfile.copyWith(avatarUrl: newUrl);
        emit(ProfileState.updateSuccess(updated));
      },
    );
  }
}
