// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  int get memoriesCount => throw _privateConstructorUsedError;
  int get friendsCount => throw _privateConstructorUsedError;
  int get capsulesCount => throw _privateConstructorUsedError;
  String get profileVisibility => throw _privateConstructorUsedError;
  String get memoryVisibility => throw _privateConstructorUsedError;
  bool get allowShareMemories => throw _privateConstructorUsedError;
  bool get showMemoriesOnTimeline => throw _privateConstructorUsedError;
  bool get showOnlineStatus => throw _privateConstructorUsedError;
  bool get allowFriendRequests => throw _privateConstructorUsedError;
  String get allowMessagesFrom => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String username,
    String bio,
    String? avatarUrl,
    String location,
    String website,
    int memoriesCount,
    int friendsCount,
    int capsulesCount,
    String profileVisibility,
    String memoryVisibility,
    bool allowShareMemories,
    bool showMemoriesOnTimeline,
    bool showOnlineStatus,
    bool allowFriendRequests,
    String allowMessagesFrom,
  });
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? bio = null,
    Object? avatarUrl = freezed,
    Object? location = null,
    Object? website = null,
    Object? memoriesCount = null,
    Object? friendsCount = null,
    Object? capsulesCount = null,
    Object? profileVisibility = null,
    Object? memoryVisibility = null,
    Object? allowShareMemories = null,
    Object? showMemoriesOnTimeline = null,
    Object? showOnlineStatus = null,
    Object? allowFriendRequests = null,
    Object? allowMessagesFrom = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            website: null == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String,
            memoriesCount: null == memoriesCount
                ? _value.memoriesCount
                : memoriesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            friendsCount: null == friendsCount
                ? _value.friendsCount
                : friendsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            capsulesCount: null == capsulesCount
                ? _value.capsulesCount
                : capsulesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            profileVisibility: null == profileVisibility
                ? _value.profileVisibility
                : profileVisibility // ignore: cast_nullable_to_non_nullable
                      as String,
            memoryVisibility: null == memoryVisibility
                ? _value.memoryVisibility
                : memoryVisibility // ignore: cast_nullable_to_non_nullable
                      as String,
            allowShareMemories: null == allowShareMemories
                ? _value.allowShareMemories
                : allowShareMemories // ignore: cast_nullable_to_non_nullable
                      as bool,
            showMemoriesOnTimeline: null == showMemoriesOnTimeline
                ? _value.showMemoriesOnTimeline
                : showMemoriesOnTimeline // ignore: cast_nullable_to_non_nullable
                      as bool,
            showOnlineStatus: null == showOnlineStatus
                ? _value.showOnlineStatus
                : showOnlineStatus // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowFriendRequests: null == allowFriendRequests
                ? _value.allowFriendRequests
                : allowFriendRequests // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowMessagesFrom: null == allowMessagesFrom
                ? _value.allowMessagesFrom
                : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String username,
    String bio,
    String? avatarUrl,
    String location,
    String website,
    int memoriesCount,
    int friendsCount,
    int capsulesCount,
    String profileVisibility,
    String memoryVisibility,
    bool allowShareMemories,
    bool showMemoriesOnTimeline,
    bool showOnlineStatus,
    bool allowFriendRequests,
    String allowMessagesFrom,
  });
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? bio = null,
    Object? avatarUrl = freezed,
    Object? location = null,
    Object? website = null,
    Object? memoriesCount = null,
    Object? friendsCount = null,
    Object? capsulesCount = null,
    Object? profileVisibility = null,
    Object? memoryVisibility = null,
    Object? allowShareMemories = null,
    Object? showMemoriesOnTimeline = null,
    Object? showOnlineStatus = null,
    Object? allowFriendRequests = null,
    Object? allowMessagesFrom = null,
  }) {
    return _then(
      _$ProfileModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        website: null == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String,
        memoriesCount: null == memoriesCount
            ? _value.memoriesCount
            : memoriesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        friendsCount: null == friendsCount
            ? _value.friendsCount
            : friendsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        capsulesCount: null == capsulesCount
            ? _value.capsulesCount
            : capsulesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        profileVisibility: null == profileVisibility
            ? _value.profileVisibility
            : profileVisibility // ignore: cast_nullable_to_non_nullable
                  as String,
        memoryVisibility: null == memoryVisibility
            ? _value.memoryVisibility
            : memoryVisibility // ignore: cast_nullable_to_non_nullable
                  as String,
        allowShareMemories: null == allowShareMemories
            ? _value.allowShareMemories
            : allowShareMemories // ignore: cast_nullable_to_non_nullable
                  as bool,
        showMemoriesOnTimeline: null == showMemoriesOnTimeline
            ? _value.showMemoriesOnTimeline
            : showMemoriesOnTimeline // ignore: cast_nullable_to_non_nullable
                  as bool,
        showOnlineStatus: null == showOnlineStatus
            ? _value.showOnlineStatus
            : showOnlineStatus // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowFriendRequests: null == allowFriendRequests
            ? _value.allowFriendRequests
            : allowFriendRequests // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowMessagesFrom: null == allowMessagesFrom
            ? _value.allowMessagesFrom
            : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl extends _ProfileModel {
  const _$ProfileModelImpl({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    this.avatarUrl,
    required this.location,
    required this.website,
    required this.memoriesCount,
    required this.friendsCount,
    required this.capsulesCount,
    required this.profileVisibility,
    required this.memoryVisibility,
    required this.allowShareMemories,
    required this.showMemoriesOnTimeline,
    required this.showOnlineStatus,
    required this.allowFriendRequests,
    required this.allowMessagesFrom,
  }) : super._();

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String bio;
  @override
  final String? avatarUrl;
  @override
  final String location;
  @override
  final String website;
  @override
  final int memoriesCount;
  @override
  final int friendsCount;
  @override
  final int capsulesCount;
  @override
  final String profileVisibility;
  @override
  final String memoryVisibility;
  @override
  final bool allowShareMemories;
  @override
  final bool showMemoriesOnTimeline;
  @override
  final bool showOnlineStatus;
  @override
  final bool allowFriendRequests;
  @override
  final String allowMessagesFrom;

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, username: $username, bio: $bio, avatarUrl: $avatarUrl, location: $location, website: $website, memoriesCount: $memoriesCount, friendsCount: $friendsCount, capsulesCount: $capsulesCount, profileVisibility: $profileVisibility, memoryVisibility: $memoryVisibility, allowShareMemories: $allowShareMemories, showMemoriesOnTimeline: $showMemoriesOnTimeline, showOnlineStatus: $showOnlineStatus, allowFriendRequests: $allowFriendRequests, allowMessagesFrom: $allowMessagesFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.memoriesCount, memoriesCount) ||
                other.memoriesCount == memoriesCount) &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.capsulesCount, capsulesCount) ||
                other.capsulesCount == capsulesCount) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.memoryVisibility, memoryVisibility) ||
                other.memoryVisibility == memoryVisibility) &&
            (identical(other.allowShareMemories, allowShareMemories) ||
                other.allowShareMemories == allowShareMemories) &&
            (identical(other.showMemoriesOnTimeline, showMemoriesOnTimeline) ||
                other.showMemoriesOnTimeline == showMemoriesOnTimeline) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.allowFriendRequests, allowFriendRequests) ||
                other.allowFriendRequests == allowFriendRequests) &&
            (identical(other.allowMessagesFrom, allowMessagesFrom) ||
                other.allowMessagesFrom == allowMessagesFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    username,
    bio,
    avatarUrl,
    location,
    website,
    memoriesCount,
    friendsCount,
    capsulesCount,
    profileVisibility,
    memoryVisibility,
    allowShareMemories,
    showMemoriesOnTimeline,
    showOnlineStatus,
    allowFriendRequests,
    allowMessagesFrom,
  );

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel extends ProfileModel {
  const factory _ProfileModel({
    required final String id,
    required final String name,
    required final String username,
    required final String bio,
    final String? avatarUrl,
    required final String location,
    required final String website,
    required final int memoriesCount,
    required final int friendsCount,
    required final int capsulesCount,
    required final String profileVisibility,
    required final String memoryVisibility,
    required final bool allowShareMemories,
    required final bool showMemoriesOnTimeline,
    required final bool showOnlineStatus,
    required final bool allowFriendRequests,
    required final String allowMessagesFrom,
  }) = _$ProfileModelImpl;
  const _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get bio;
  @override
  String? get avatarUrl;
  @override
  String get location;
  @override
  String get website;
  @override
  int get memoriesCount;
  @override
  int get friendsCount;
  @override
  int get capsulesCount;
  @override
  String get profileVisibility;
  @override
  String get memoryVisibility;
  @override
  bool get allowShareMemories;
  @override
  bool get showMemoriesOnTimeline;
  @override
  bool get showOnlineStatus;
  @override
  bool get allowFriendRequests;
  @override
  String get allowMessagesFrom;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
