import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        submitted: (email, password) => _onSubmitted(email, password, emit),
      );
    });
  }

  Future<void> _onSubmitted(
    String email,
    String password,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase(email: email, password: password);
    result.fold(
      (failure) => emit(LoginState.failure(failure.message)),
      (user) => emit(LoginState.success(user)),
    );
  }
}
