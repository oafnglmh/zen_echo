import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/memory_entity.dart';
import '../repositories/home_repository.dart';

class GetHomeMemories {
  final HomeRepository repository;

  GetHomeMemories(this.repository);

  Future<Either<Failure, List<MemoryEntity>>> call() async {
    return await repository.getHomeMemories();
  }
}
