// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemoryModel _$MemoryModelFromJson(Map<String, dynamic> json) {
  return _MemoryModel.fromJson(json);
}

/// @nodoc
mixin _$MemoryModel {
  String get id => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String get authorAvatarUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get videoDuration => throw _privateConstructorUsedError;
  String? get moodEmoji => throw _privateConstructorUsedError;
  String? get moodLabel => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  /// Serializes this MemoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoryModelCopyWith<MemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryModelCopyWith<$Res> {
  factory $MemoryModelCopyWith(
    MemoryModel value,
    $Res Function(MemoryModel) then,
  ) = _$MemoryModelCopyWithImpl<$Res, MemoryModel>;
  @useResult
  $Res call({
    String id,
    String authorName,
    String authorAvatarUrl,
    DateTime createdAt,
    String mediaType,
    String mediaUrl,
    String? videoDuration,
    String? moodEmoji,
    String? moodLabel,
    String? location,
    String? caption,
    int likeCount,
    bool isLiked,
  });
}

/// @nodoc
class _$MemoryModelCopyWithImpl<$Res, $Val extends MemoryModel>
    implements $MemoryModelCopyWith<$Res> {
  _$MemoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorName = null,
    Object? authorAvatarUrl = null,
    Object? createdAt = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? videoDuration = freezed,
    Object? moodEmoji = freezed,
    Object? moodLabel = freezed,
    Object? location = freezed,
    Object? caption = freezed,
    Object? likeCount = null,
    Object? isLiked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            authorAvatarUrl: null == authorAvatarUrl
                ? _value.authorAvatarUrl
                : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            mediaType: null == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as String,
            mediaUrl: null == mediaUrl
                ? _value.mediaUrl
                : mediaUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            videoDuration: freezed == videoDuration
                ? _value.videoDuration
                : videoDuration // ignore: cast_nullable_to_non_nullable
                      as String?,
            moodEmoji: freezed == moodEmoji
                ? _value.moodEmoji
                : moodEmoji // ignore: cast_nullable_to_non_nullable
                      as String?,
            moodLabel: freezed == moodLabel
                ? _value.moodLabel
                : moodLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemoryModelImplCopyWith<$Res>
    implements $MemoryModelCopyWith<$Res> {
  factory _$$MemoryModelImplCopyWith(
    _$MemoryModelImpl value,
    $Res Function(_$MemoryModelImpl) then,
  ) = __$$MemoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authorName,
    String authorAvatarUrl,
    DateTime createdAt,
    String mediaType,
    String mediaUrl,
    String? videoDuration,
    String? moodEmoji,
    String? moodLabel,
    String? location,
    String? caption,
    int likeCount,
    bool isLiked,
  });
}

/// @nodoc
class __$$MemoryModelImplCopyWithImpl<$Res>
    extends _$MemoryModelCopyWithImpl<$Res, _$MemoryModelImpl>
    implements _$$MemoryModelImplCopyWith<$Res> {
  __$$MemoryModelImplCopyWithImpl(
    _$MemoryModelImpl _value,
    $Res Function(_$MemoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorName = null,
    Object? authorAvatarUrl = null,
    Object? createdAt = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? videoDuration = freezed,
    Object? moodEmoji = freezed,
    Object? moodLabel = freezed,
    Object? location = freezed,
    Object? caption = freezed,
    Object? likeCount = null,
    Object? isLiked = null,
  }) {
    return _then(
      _$MemoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        authorAvatarUrl: null == authorAvatarUrl
            ? _value.authorAvatarUrl
            : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        mediaType: null == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaUrl: null == mediaUrl
            ? _value.mediaUrl
            : mediaUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        videoDuration: freezed == videoDuration
            ? _value.videoDuration
            : videoDuration // ignore: cast_nullable_to_non_nullable
                  as String?,
        moodEmoji: freezed == moodEmoji
            ? _value.moodEmoji
            : moodEmoji // ignore: cast_nullable_to_non_nullable
                  as String?,
        moodLabel: freezed == moodLabel
            ? _value.moodLabel
            : moodLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoryModelImpl extends _MemoryModel {
  const _$MemoryModelImpl({
    required this.id,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.createdAt,
    required this.mediaType,
    required this.mediaUrl,
    this.videoDuration,
    this.moodEmoji,
    this.moodLabel,
    this.location,
    this.caption,
    this.likeCount = 0,
    this.isLiked = false,
  }) : super._();

  factory _$MemoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String authorName;
  @override
  final String authorAvatarUrl;
  @override
  final DateTime createdAt;
  @override
  final String mediaType;
  @override
  final String mediaUrl;
  @override
  final String? videoDuration;
  @override
  final String? moodEmoji;
  @override
  final String? moodLabel;
  @override
  final String? location;
  @override
  final String? caption;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final bool isLiked;

  @override
  String toString() {
    return 'MemoryModel(id: $id, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, createdAt: $createdAt, mediaType: $mediaType, mediaUrl: $mediaUrl, videoDuration: $videoDuration, moodEmoji: $moodEmoji, moodLabel: $moodLabel, location: $location, caption: $caption, likeCount: $likeCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorAvatarUrl, authorAvatarUrl) ||
                other.authorAvatarUrl == authorAvatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.videoDuration, videoDuration) ||
                other.videoDuration == videoDuration) &&
            (identical(other.moodEmoji, moodEmoji) ||
                other.moodEmoji == moodEmoji) &&
            (identical(other.moodLabel, moodLabel) ||
                other.moodLabel == moodLabel) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authorName,
    authorAvatarUrl,
    createdAt,
    mediaType,
    mediaUrl,
    videoDuration,
    moodEmoji,
    moodLabel,
    location,
    caption,
    likeCount,
    isLiked,
  );

  /// Create a copy of MemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryModelImplCopyWith<_$MemoryModelImpl> get copyWith =>
      __$$MemoryModelImplCopyWithImpl<_$MemoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoryModelImplToJson(this);
  }
}

abstract class _MemoryModel extends MemoryModel {
  const factory _MemoryModel({
    required final String id,
    required final String authorName,
    required final String authorAvatarUrl,
    required final DateTime createdAt,
    required final String mediaType,
    required final String mediaUrl,
    final String? videoDuration,
    final String? moodEmoji,
    final String? moodLabel,
    final String? location,
    final String? caption,
    final int likeCount,
    final bool isLiked,
  }) = _$MemoryModelImpl;
  const _MemoryModel._() : super._();

  factory _MemoryModel.fromJson(Map<String, dynamic> json) =
      _$MemoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get authorName;
  @override
  String get authorAvatarUrl;
  @override
  DateTime get createdAt;
  @override
  String get mediaType;
  @override
  String get mediaUrl;
  @override
  String? get videoDuration;
  @override
  String? get moodEmoji;
  @override
  String? get moodLabel;
  @override
  String? get location;
  @override
  String? get caption;
  @override
  int get likeCount;
  @override
  bool get isLiked;

  /// Create a copy of MemoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoryModelImplCopyWith<_$MemoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
