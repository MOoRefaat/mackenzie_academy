import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Admin Page"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  logout();
                },
                child:
                    const Text("Log OUT", style: TextStyle(color: Colors.red))),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.addingUsersRoute);
                },
                child:
                const Text("Go to add users", style: TextStyle(color: Colors.blue)))
          ],
        ),
      ),
    );
  }
}
