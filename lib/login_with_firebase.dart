import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  void Function()? onTap;

  LoginScreen({super.key,required this.onTap});

   TextEditingController userNameController=TextEditingController();
   TextEditingController passwordController=TextEditingController();

  void login(){}


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
            Image.asset('assets/images/logo2.png',
                height: 200.0), // Replace with your logo asset
            const SizedBox(height: 20),
            // Username TextField
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: userNameController,
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
            SizedBox(height: 20),
            // Password TextField
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
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login action
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
              onTap: onTap,
              child: const Text(
                'ليس لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Social Media Login Buttons
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
                    padding: const EdgeInsets.all(
                        12.0), // Adjust the padding as needed
                    child: ClipOval(
                      child: Image.asset('assets/images/googleLogo.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                      'assets/images/AppleLogo.png'), // Replace with your Google logo asset
                  iconSize: 50,
                  onPressed: () {
                    login();
                    },
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
