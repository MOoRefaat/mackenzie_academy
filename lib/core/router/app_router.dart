import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/features/add_users_by_admin/presentation/register/screens/adding_users-screen.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/screens/login_screen.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/screens/register_screen.dart';
import 'package:mackenzie_academy/features/home/data/models/users_services.dart';
import 'package:mackenzie_academy/features/home/presentation/screens/home_screen.dart';



class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutesName.addAccRoute:
        return MaterialPageRoute(builder: (_) => AddingUsersScreen());
      case RoutesName.homeRoute:
        final args = settings.arguments as UsersServices?;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(usersServices: args),
        );
    }
  }
}