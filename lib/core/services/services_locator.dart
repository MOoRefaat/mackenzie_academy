import 'package:get_it/get_it.dart';
import 'package:mackenzie_academy/core/shared_preference/shared_preference_manager.dart';
import 'package:mackenzie_academy/features/add_users_by_admin/presentation/register/bloc/adding_users_bloc.dart';
import 'package:mackenzie_academy/features/app_settings/presentation/bloc/app_settings_bloc.dart';
import 'package:mackenzie_academy/features/auth/data/datasource/remote/login_remote_data_source.dart';
import 'package:mackenzie_academy/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_login.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_register.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:mackenzie_academy/features/home/presentation/bloc/home_bloc.dart';
import 'package:mackenzie_academy/core/shared_preference/shered_prefrence_utlis.dart';


final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc: Factory
    servicesLocator.registerFactory(
            () => LoginBloc(servicesLocator(),servicesLocator()));
    servicesLocator.registerFactory(() => RegisterBloc());
    servicesLocator.registerFactory(() => HomeBloc());
    servicesLocator.registerFactory(() => AddingUsersBloc());
    servicesLocator.registerFactory(() => AppSettingsBloc());

    /// Remote Use Cases: Singleton
    servicesLocator.registerLazySingleton(
            () => PostLoginByEmailUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(
            () => PostRegisterUseCase(servicesLocator()));


    // Local Use Cases


    /// Repository: Singleton
    servicesLocator.registerLazySingleton<AuthRepository>(
            () => AuthRepositoryImpl(servicesLocator()));


    /// DATA SOURCE: Singleton
    servicesLocator.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());
    /// DATA SOURCE: Factory
    servicesLocator.registerFactory<SharedPreferenceManager>(() => SharedPreferenceManager(sharedPreferencesUtils: servicesLocator()));
    servicesLocator.registerFactory<SharedPreferencesUtils>(() => SharedPreferencesUtils());
  }
}