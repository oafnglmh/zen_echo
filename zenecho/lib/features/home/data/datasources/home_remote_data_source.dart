import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/memory_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<MemoryModel>> getHomeMemories();
  Future<MemoryModel> likeMemory(String memoryId);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<List<MemoryModel>> getHomeMemories() async {
    final response = await _dio.get(ApiEndpoints.memoriesFeed);
    final List list = response.data['data'] as List;
    return list.map((e) => MemoryModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<MemoryModel> likeMemory(String memoryId) async {
    final response = await _dio.post('${ApiEndpoints.memories}/$memoryId/like');
    return MemoryModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
