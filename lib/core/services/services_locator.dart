import 'package:get_it/get_it.dart';
import 'package:mackenzie_academy/core/shared_preference/shared_preference_manager.dart';
import 'package:mackenzie_academy/features/auth/data/datasource/remote/login_remote_data_source.dart';
import 'package:mackenzie_academy/features/auth/domain/repositories/auth_repository.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_login.dart';
import 'package:mackenzie_academy/features/auth/domain/usecases/remote/post_register.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc


    /// Remote Use Cases
    // servicesLocator.registerLazySingleton(
    //         () => (servicesLocator()));
    servicesLocator.registerLazySingleton(
            () => PostLoginByEmailUseCase(servicesLocator()));
    servicesLocator.registerLazySingleton(
            () => PostRegisterUseCase(servicesLocator()));


    // Local Use Cases


    /// Repository
    // servicesLocator.registerLazySingleton<AuthRepositorysitory>(() => AuthRepository());


    /// DATA SOURCE
    servicesLocator.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl());


    servicesLocator.registerFactory<SharedPreferenceManager>(() => SharedPreferenceManager());
  }
}