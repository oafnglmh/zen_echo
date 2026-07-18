// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
    required TResult Function(Profile profile) updateRequested,
    required TResult Function(String filePath) avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRequested,
    TResult? Function(Profile profile)? updateRequested,
    TResult? Function(String filePath)? avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    TResult Function(Profile profile)? updateRequested,
    TResult Function(String filePath)? avatarUploadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequested value) fetchRequested,
    required TResult Function(_UpdateRequested value) updateRequested,
    required TResult Function(_AvatarUploadRequested value)
    avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRequested value)? fetchRequested,
    TResult? Function(_UpdateRequested value)? updateRequested,
    TResult? Function(_AvatarUploadRequested value)? avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequested value)? fetchRequested,
    TResult Function(_UpdateRequested value)? updateRequested,
    TResult Function(_AvatarUploadRequested value)? avatarUploadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchRequestedImplCopyWith<$Res> {
  factory _$$FetchRequestedImplCopyWith(
    _$FetchRequestedImpl value,
    $Res Function(_$FetchRequestedImpl) then,
  ) = __$$FetchRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$FetchRequestedImpl>
    implements _$$FetchRequestedImplCopyWith<$Res> {
  __$$FetchRequestedImplCopyWithImpl(
    _$FetchRequestedImpl _value,
    $Res Function(_$FetchRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchRequestedImpl implements _FetchRequested {
  const _$FetchRequestedImpl();

  @override
  String toString() {
    return 'ProfileEvent.fetchRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
    required TResult Function(Profile profile) updateRequested,
    required TResult Function(String filePath) avatarUploadRequested,
  }) {
    return fetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRequested,
    TResult? Function(Profile profile)? updateRequested,
    TResult? Function(String filePath)? avatarUploadRequested,
  }) {
    return fetchRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    TResult Function(Profile profile)? updateRequested,
    TResult Function(String filePath)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequested value) fetchRequested,
    required TResult Function(_UpdateRequested value) updateRequested,
    required TResult Function(_AvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return fetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRequested value)? fetchRequested,
    TResult? Function(_UpdateRequested value)? updateRequested,
    TResult? Function(_AvatarUploadRequested value)? avatarUploadRequested,
  }) {
    return fetchRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequested value)? fetchRequested,
    TResult Function(_UpdateRequested value)? updateRequested,
    TResult Function(_AvatarUploadRequested value)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested(this);
    }
    return orElse();
  }
}

abstract class _FetchRequested implements ProfileEvent {
  const factory _FetchRequested() = _$FetchRequestedImpl;
}

/// @nodoc
abstract class _$$UpdateRequestedImplCopyWith<$Res> {
  factory _$$UpdateRequestedImplCopyWith(
    _$UpdateRequestedImpl value,
    $Res Function(_$UpdateRequestedImpl) then,
  ) = __$$UpdateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});
}

/// @nodoc
class __$$UpdateRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateRequestedImpl>
    implements _$$UpdateRequestedImplCopyWith<$Res> {
  __$$UpdateRequestedImplCopyWithImpl(
    _$UpdateRequestedImpl _value,
    $Res Function(_$UpdateRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? profile = null}) {
    return _then(
      _$UpdateRequestedImpl(
        null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as Profile,
      ),
    );
  }
}

/// @nodoc

class _$UpdateRequestedImpl implements _UpdateRequested {
  const _$UpdateRequestedImpl(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.updateRequested(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRequestedImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRequestedImplCopyWith<_$UpdateRequestedImpl> get copyWith =>
      __$$UpdateRequestedImplCopyWithImpl<_$UpdateRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
    required TResult Function(Profile profile) updateRequested,
    required TResult Function(String filePath) avatarUploadRequested,
  }) {
    return updateRequested(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRequested,
    TResult? Function(Profile profile)? updateRequested,
    TResult? Function(String filePath)? avatarUploadRequested,
  }) {
    return updateRequested?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    TResult Function(Profile profile)? updateRequested,
    TResult Function(String filePath)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequested value) fetchRequested,
    required TResult Function(_UpdateRequested value) updateRequested,
    required TResult Function(_AvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return updateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRequested value)? fetchRequested,
    TResult? Function(_UpdateRequested value)? updateRequested,
    TResult? Function(_AvatarUploadRequested value)? avatarUploadRequested,
  }) {
    return updateRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequested value)? fetchRequested,
    TResult Function(_UpdateRequested value)? updateRequested,
    TResult Function(_AvatarUploadRequested value)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(this);
    }
    return orElse();
  }
}

abstract class _UpdateRequested implements ProfileEvent {
  const factory _UpdateRequested(final Profile profile) = _$UpdateRequestedImpl;

  Profile get profile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRequestedImplCopyWith<_$UpdateRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AvatarUploadRequestedImplCopyWith<$Res> {
  factory _$$AvatarUploadRequestedImplCopyWith(
    _$AvatarUploadRequestedImpl value,
    $Res Function(_$AvatarUploadRequestedImpl) then,
  ) = __$$AvatarUploadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$AvatarUploadRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$AvatarUploadRequestedImpl>
    implements _$$AvatarUploadRequestedImplCopyWith<$Res> {
  __$$AvatarUploadRequestedImplCopyWithImpl(
    _$AvatarUploadRequestedImpl _value,
    $Res Function(_$AvatarUploadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filePath = null}) {
    return _then(
      _$AvatarUploadRequestedImpl(
        null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AvatarUploadRequestedImpl implements _AvatarUploadRequested {
  const _$AvatarUploadRequestedImpl(this.filePath);

  @override
  final String filePath;

  @override
  String toString() {
    return 'ProfileEvent.avatarUploadRequested(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarUploadRequestedImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarUploadRequestedImplCopyWith<_$AvatarUploadRequestedImpl>
  get copyWith =>
      __$$AvatarUploadRequestedImplCopyWithImpl<_$AvatarUploadRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
    required TResult Function(Profile profile) updateRequested,
    required TResult Function(String filePath) avatarUploadRequested,
  }) {
    return avatarUploadRequested(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRequested,
    TResult? Function(Profile profile)? updateRequested,
    TResult? Function(String filePath)? avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    TResult Function(Profile profile)? updateRequested,
    TResult Function(String filePath)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (avatarUploadRequested != null) {
      return avatarUploadRequested(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequested value) fetchRequested,
    required TResult Function(_UpdateRequested value) updateRequested,
    required TResult Function(_AvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return avatarUploadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRequested value)? fetchRequested,
    TResult? Function(_UpdateRequested value)? updateRequested,
    TResult? Function(_AvatarUploadRequested value)? avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequested value)? fetchRequested,
    TResult Function(_UpdateRequested value)? updateRequested,
    TResult Function(_AvatarUploadRequested value)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (avatarUploadRequested != null) {
      return avatarUploadRequested(this);
    }
    return orElse();
  }
}

abstract class _AvatarUploadRequested implements ProfileEvent {
  const factory _AvatarUploadRequested(final String filePath) =
      _$AvatarUploadRequestedImpl;

  String get filePath;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarUploadRequestedImplCopyWith<_$AvatarUploadRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
