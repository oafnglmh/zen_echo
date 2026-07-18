import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/check_session_use_case.dart';
import '../../features/auth/domain/usecases/get_me_use_case.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/logout_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth/auth_event.dart';
import '../../features/auth/presentation/bloc/login/login_bloc.dart';
import '../../features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import '../network/api_endpoints.dart';
import '../network/dio_client.dart';
import '../storage/secure_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ==========================================
  // Core & External
  // ==========================================
  
  // Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    ),
  );
  
  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorage(storage: sl<FlutterSecureStorage>()),
  );

  // Dio Client with lazy token expired callback resolution to prevent circular dependency
  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      baseUrl: ApiEndpoints.baseUrl,
      secureStorage: sl<SecureStorage>(),
      onTokenExpired: () {
        if (sl.isRegistered<AuthBloc>()) {
          sl<AuthBloc>().add(const AuthEvent.logoutRequested());
        }
      },
    ),
  );

  sl.registerLazySingleton(() => sl<DioClient>().dio);

  // ==========================================
  // Features - Auth
  // ==========================================

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetMeUseCase(sl()));
  sl.registerLazySingleton(() => CheckSessionUseCase(sl()));

  // BloCs / Cubits
  sl.registerLazySingleton(
    () => AuthBloc(
      checkSessionUseCase: sl(),
      getMeUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => SignUpBloc(sl()));
}
