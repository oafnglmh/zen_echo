import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_account_use_case.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase _deleteAccountUseCase;

  DeleteAccountCubit(this._deleteAccountUseCase)
      : super(const DeleteAccountState.initial());

  void showWarning() {
    emit(const DeleteAccountState.warning());
  }

  void showConfirm() {
    emit(const DeleteAccountState.confirming());
  }

  Future<void> confirmDeletion() async {
    emit(const DeleteAccountState.deleting());
    final result = await _deleteAccountUseCase();
    result.fold(
      (failure) => emit(DeleteAccountState.failure(failure.message)),
      (_) => emit(const DeleteAccountState.success()),
    );
  }

  void reset() {
    emit(const DeleteAccountState.initial());
  }
}
