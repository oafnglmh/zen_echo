// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFeedRequested,
    required TResult Function(String memoryId) likeMemoryRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFeedRequested,
    TResult? Function(String memoryId)? likeMemoryRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFeedRequested,
    TResult Function(String memoryId)? likeMemoryRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFeedRequested value) loadFeedRequested,
    required TResult Function(_LikeMemoryRequested value) likeMemoryRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult? Function(_LikeMemoryRequested value)? likeMemoryRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult Function(_LikeMemoryRequested value)? likeMemoryRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadFeedRequestedImplCopyWith<$Res> {
  factory _$$LoadFeedRequestedImplCopyWith(
    _$LoadFeedRequestedImpl value,
    $Res Function(_$LoadFeedRequestedImpl) then,
  ) = __$$LoadFeedRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFeedRequestedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadFeedRequestedImpl>
    implements _$$LoadFeedRequestedImplCopyWith<$Res> {
  __$$LoadFeedRequestedImplCopyWithImpl(
    _$LoadFeedRequestedImpl _value,
    $Res Function(_$LoadFeedRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadFeedRequestedImpl implements _LoadFeedRequested {
  const _$LoadFeedRequestedImpl();

  @override
  String toString() {
    return 'HomeEvent.loadFeedRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFeedRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFeedRequested,
    required TResult Function(String memoryId) likeMemoryRequested,
  }) {
    return loadFeedRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFeedRequested,
    TResult? Function(String memoryId)? likeMemoryRequested,
  }) {
    return loadFeedRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFeedRequested,
    TResult Function(String memoryId)? likeMemoryRequested,
    required TResult orElse(),
  }) {
    if (loadFeedRequested != null) {
      return loadFeedRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFeedRequested value) loadFeedRequested,
    required TResult Function(_LikeMemoryRequested value) likeMemoryRequested,
  }) {
    return loadFeedRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult? Function(_LikeMemoryRequested value)? likeMemoryRequested,
  }) {
    return loadFeedRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult Function(_LikeMemoryRequested value)? likeMemoryRequested,
    required TResult orElse(),
  }) {
    if (loadFeedRequested != null) {
      return loadFeedRequested(this);
    }
    return orElse();
  }
}

abstract class _LoadFeedRequested implements HomeEvent {
  const factory _LoadFeedRequested() = _$LoadFeedRequestedImpl;
}

/// @nodoc
abstract class _$$LikeMemoryRequestedImplCopyWith<$Res> {
  factory _$$LikeMemoryRequestedImplCopyWith(
    _$LikeMemoryRequestedImpl value,
    $Res Function(_$LikeMemoryRequestedImpl) then,
  ) = __$$LikeMemoryRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String memoryId});
}

/// @nodoc
class __$$LikeMemoryRequestedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LikeMemoryRequestedImpl>
    implements _$$LikeMemoryRequestedImplCopyWith<$Res> {
  __$$LikeMemoryRequestedImplCopyWithImpl(
    _$LikeMemoryRequestedImpl _value,
    $Res Function(_$LikeMemoryRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? memoryId = null}) {
    return _then(
      _$LikeMemoryRequestedImpl(
        null == memoryId
            ? _value.memoryId
            : memoryId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LikeMemoryRequestedImpl implements _LikeMemoryRequested {
  const _$LikeMemoryRequestedImpl(this.memoryId);

  @override
  final String memoryId;

  @override
  String toString() {
    return 'HomeEvent.likeMemoryRequested(memoryId: $memoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeMemoryRequestedImpl &&
            (identical(other.memoryId, memoryId) ||
                other.memoryId == memoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memoryId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeMemoryRequestedImplCopyWith<_$LikeMemoryRequestedImpl> get copyWith =>
      __$$LikeMemoryRequestedImplCopyWithImpl<_$LikeMemoryRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFeedRequested,
    required TResult Function(String memoryId) likeMemoryRequested,
  }) {
    return likeMemoryRequested(memoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFeedRequested,
    TResult? Function(String memoryId)? likeMemoryRequested,
  }) {
    return likeMemoryRequested?.call(memoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFeedRequested,
    TResult Function(String memoryId)? likeMemoryRequested,
    required TResult orElse(),
  }) {
    if (likeMemoryRequested != null) {
      return likeMemoryRequested(memoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFeedRequested value) loadFeedRequested,
    required TResult Function(_LikeMemoryRequested value) likeMemoryRequested,
  }) {
    return likeMemoryRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult? Function(_LikeMemoryRequested value)? likeMemoryRequested,
  }) {
    return likeMemoryRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFeedRequested value)? loadFeedRequested,
    TResult Function(_LikeMemoryRequested value)? likeMemoryRequested,
    required TResult orElse(),
  }) {
    if (likeMemoryRequested != null) {
      return likeMemoryRequested(this);
    }
    return orElse();
  }
}

abstract class _LikeMemoryRequested implements HomeEvent {
  const factory _LikeMemoryRequested(final String memoryId) =
      _$LikeMemoryRequestedImpl;

  String get memoryId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeMemoryRequestedImplCopyWith<_$LikeMemoryRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
