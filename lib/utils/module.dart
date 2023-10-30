import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api/api_client.dart';
import '../datasource/datasources.dart';
import '../repository/auth_repo.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt
    ..registerLazySingleton<ApiClient>(() => ApiClient(getIt()))
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSource(getIt()))
  ..registerLazySingleton<AuthRepository>(
      () => AuthRepository(getIt()));
}
