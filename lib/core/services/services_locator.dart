import 'package:get_it/get_it.dart';
import 'package:mackenzie_academy/core/shared_preference/shared_preference_manager.dart';
import 'package:mackenzie_academy/features/auth/data/datasource/remote/login_remote_data_source.dart';
import 'package:mackenzie_academy/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_login.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_register.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:mackenzie_academy/features/home/presentation/bloc/home_bloc.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    servicesLocator.registerLazySingleton(
            () => LoginBloc(servicesLocator(),servicesLocator()));
    servicesLocator.registerLazySingleton(() => RegisterBloc());
    servicesLocator.registerLazySingleton(() => HomeBloc());

    /// Remote Use Cases
    servicesLocator.registerLazySingleton(
            () => PostLoginByEmailUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(
            () => PostRegisterUseCase(servicesLocator()));


    // Local Use Cases


    /// Repository
    servicesLocator.registerLazySingleton<AuthRepository>(
            () => AuthRepositoryImpl(servicesLocator()));


    /// DATA SOURCE
    servicesLocator.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());

    servicesLocator.registerFactory<SharedPreferenceManager>(() => SharedPreferenceManager());
  }
}