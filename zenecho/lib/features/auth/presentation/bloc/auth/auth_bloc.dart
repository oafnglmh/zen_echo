import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/check_session_use_case.dart';
import '../../../domain/usecases/get_me_use_case.dart';
import '../../../domain/usecases/logout_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckSessionUseCase _checkSessionUseCase;
  final GetMeUseCase _getMeUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required CheckSessionUseCase checkSessionUseCase,
    required GetMeUseCase getMeUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _checkSessionUseCase = checkSessionUseCase,
        _getMeUseCase = getMeUseCase,
        _logoutUseCase = logoutUseCase,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        checkRequested: () async => await _onCheckRequested(emit),
        userChanged: (user) async => _onUserChanged(user, emit),
        logoutRequested: () async => await _onLogoutRequested(emit),
      );
    });
  }

  Future<void> _onCheckRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    print('DEBUG: AuthBloc: Starting check session...');
    final sessionResult = await _checkSessionUseCase();
    print('DEBUG: AuthBloc: Check session completed: $sessionResult');
    
    await sessionResult.fold(
      (failure) async {
        emit(const AuthState.unauthenticated());
      },
      (hasSession) async {
        if (hasSession) {
          final userResult = await _getMeUseCase();
          userResult.fold(
            (failure) => emit(const AuthState.unauthenticated()),
            (user) => emit(AuthState.authenticated(user)),
          );
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  void _onUserChanged(User user, Emitter<AuthState> emit) {
    emit(AuthState.authenticated(user));
  }

  Future<void> _onLogoutRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await _logoutUseCase();
    emit(const AuthState.unauthenticated());
  }
}
