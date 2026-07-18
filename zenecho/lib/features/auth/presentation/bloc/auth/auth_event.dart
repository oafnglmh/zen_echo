import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkRequested() = _CheckRequested;
  const factory AuthEvent.userChanged(User user) = _UserChanged;
  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}
