import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/auth.dart';

import 'features/auth/presentation/login/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
