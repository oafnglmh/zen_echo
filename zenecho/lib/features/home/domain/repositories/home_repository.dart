import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/memory_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<MemoryEntity>>> getHomeMemories();
  Future<Either<Failure, MemoryEntity>> likeMemory(String memoryId);
}
