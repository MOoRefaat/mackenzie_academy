import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});

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
                    const Text("Log OUT", style: TextStyle(color: Colors.red)))
          ],
        ),
      ),
    );
  }
}
