import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/app_router.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/bloc_observer.dart';
import 'package:mackenzie_academy/features/add_users_by_admin/presentation/register/bloc/adding_users_bloc.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:mackenzie_academy/features/home/presentation/bloc/home_bloc.dart';
import 'package:mackenzie_academy/features/splash/presentation/screens/splash_screen.dart';
import 'features/auth/presentation/login/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        servicesLocator<LoginBloc>()
        ),
        BlocProvider(create: (context) =>
            servicesLocator<RegisterBloc>()
        ),
        BlocProvider(create: (context) =>
        servicesLocator<HomeBloc>()
        ),
        BlocProvider(create: (context) =>
            servicesLocator<AddingUsersBloc>()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
