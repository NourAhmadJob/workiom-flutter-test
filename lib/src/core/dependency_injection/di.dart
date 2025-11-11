import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/feature/auth/data/datasource/auth_datasource.dart';

import '../../feature/auth/data/repository/auth_repository_impl.dart';
import '../../feature/auth/domain/repository/auth_repository.dart';
import '../../feature/auth/domain/usecase/auth_usecase.dart';
import '../../feature/auth/presentation/bloc/auth_bloc.dart';
import '../network/dio_helper.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(DioHelper().dio),
  );
  
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: getIt<AuthDataSource>()),
  );
  
  getIt.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(repository: getIt<AuthRepository>()),
  );
  
  getIt.registerFactory(() => AuthBloc(useCase: getIt<AuthUseCase>()));
}