import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mackenzie_academy/core/router/app_router.dart';
import 'package:mackenzie_academy/core/services/services_locator.dart';
import 'package:mackenzie_academy/core/utils/bloc_observer.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}