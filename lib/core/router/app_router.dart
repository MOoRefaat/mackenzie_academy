import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/auth.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/screens/login_screen.dart';
import 'package:mackenzie_academy/features/auth/presentation/register/screens/register_screen.dart';
import 'package:mackenzie_academy/features/home/presentation/screens/home_screen.dart';
import 'package:mackenzie_academy/features/home/t/admin/presentation/screens/admin_home_screen.dart';
import 'package:mackenzie_academy/features/home/t/coach/presentation/screens/coach_home_screen.dart';
import 'package:mackenzie_academy/features/home/t/user/presentation/screens/user_home_screen.dart';



class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutesName.adminHomeRoute:
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      case RoutesName.coachHomeRoute:
        return MaterialPageRoute(builder: (_) => CoachHomeScreen());
      case RoutesName.userHomeRoute:
        return MaterialPageRoute(builder: (_) => UserHomeScreen());
      case RoutesName.authPageRoute:
        return MaterialPageRoute(builder: (_) => AuthPage());
      case RoutesName.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}