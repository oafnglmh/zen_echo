import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class CheckSessionUseCase {
  final AuthRepository _repository;

  CheckSessionUseCase(this._repository);

  Future<Either<Failure, bool>> call() {
    return _repository.checkSession();
  }
}
