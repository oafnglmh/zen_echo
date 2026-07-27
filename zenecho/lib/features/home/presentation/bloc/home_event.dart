import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadFeedRequested() = _LoadFeedRequested;
  const factory HomeEvent.likeMemoryRequested(String memoryId) = _LikeMemoryRequested;
}
