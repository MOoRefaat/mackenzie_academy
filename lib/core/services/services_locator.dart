import 'package:get_it/get_it.dart';
import 'package:mackenzie_academy/features/login/presentation/bloc/login_bloc.dart';

final servicesLocator = GetIt.instance;

class ServicesLocator {
  void init() {

    // Bloc
     //servicesLocator.registerFactory(() => SignUpBloc(servicesLocator()));
    // servicesLocator.registerFactory(() => LoginBloc(servicesLocator()));

  }
}