import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/register_use_case.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final RegisterUseCase _registerUseCase;

  SignUpBloc(this._registerUseCase) : super(const SignUpState.initial()) {
    on<SignUpEvent>((event, emit) async {
      await event.when(
        submitted: (email, password, name) =>
            _onSubmitted(email, password, name, emit),
      );
    });
  }

  Future<void> _onSubmitted(
    String email,
    String password,
    String name,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpState.loading());
    final result = await _registerUseCase(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpState.failure(failure.message)),
      (user) => emit(SignUpState.success(user)),
    );
  }
}
