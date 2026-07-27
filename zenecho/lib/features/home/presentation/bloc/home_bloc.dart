import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_home_memories.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeMemories getHomeMemories;

  HomeBloc({
    required this.getHomeMemories,
  }) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        loadFeedRequested: () => _onLoadFeedRequested(emit),
        likeMemoryRequested: (memoryId) => _onLikeMemoryRequested(memoryId, emit),
      );
    });
  }

  Future<void> _onLoadFeedRequested(Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final result = await getHomeMemories();
    result.fold(
      (failure) => emit(HomeState.error(failure.message)),
      (memories) => emit(HomeState.loaded(memories: memories)),
    );
  }

  Future<void> _onLikeMemoryRequested(String memoryId, Emitter<HomeState> emit) async {}
}
