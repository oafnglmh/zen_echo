import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.warning() = _Warning;
  const factory DeleteAccountState.confirming() = _Confirming;
  const factory DeleteAccountState.deleting() = _Deleting;
  const factory DeleteAccountState.success() = _Success;
  const factory DeleteAccountState.failure(String message) = _Failure;
}
