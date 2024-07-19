import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_dialog.dart';

class LoginScreen extends StatefulWidget {
  // void Function()? onTap;
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) =>
        const Center(
          child: CircularProgressIndicator(),
        ));
    try {
      UserCredential? userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A155A),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            Image.asset('assets/images/logo2.png', height: 200.0),
            const SizedBox(height: 20),
            // Username TextField
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'اسم المستخدم',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  suffixIcon: Icon(Icons.visibility, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  AlertDialog(
                      title: Text("Email and password cannot be empty"));
                  return;
                }
                login();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF0A155A),
                backgroundColor: Colors.white, // foreground
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('تسجيل الدخول'),
            ),
            SizedBox(height: 20),
            // Sign up text
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    RoutesName.registerRoute);
                },
              child: const Text(
                'ليس لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 52.0,
                  height: 52.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFECE9EC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipOval(
                      child: Image.asset('assets/images/googleLogo.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/AppleLogo.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
                Container(
                  width: 52.0,
                  height: 52.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFECE9EC),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.phone, color: Colors.black87, size: 28),
                    onPressed: () {
                      // Handle Phone login
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
