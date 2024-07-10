import 'package:flutter/material.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/screens/login_screen.dart';

const String initialRoute = "login-screen";

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login-screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
    // case 'home-screen':
    //   return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}