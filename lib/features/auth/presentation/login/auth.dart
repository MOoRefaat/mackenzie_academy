import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/features/auth/presentation/login/screens/login_screen.dart';
import 'package:mackenzie_academy/features/home/admin/presentation/screens/admin_home_screen.dart';
import 'package:mackenzie_academy/features/home/user/presentation/screens/user_home_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print("Error fetching user document: ${snapshot.error}");
                  return Center(
                    child: Text('Something went wrong'),
                  );
                } else {
                  final userDoc = snapshot.data;
                  print("User document fetched: ${userDoc!.data()}");
                  if (userDoc.data() != null) {
                    final Map<String, dynamic> user =
                        userDoc.data() as Map<String, dynamic>;
                    if (user['role'] == 'Admin') {
                      return AdminHomeScreen(); // Change this to your Admin home page
                    } else {
                      return UserHomeScreen();
                    }
                  } else {
                    print("User data is null");
                    return Center(
                      child: Text("User data is null"),
                    );
                  }
                }
              },
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
