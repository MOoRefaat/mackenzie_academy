// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mackenzie_academy/core/router/routes_name.dart';
// import 'package:mackenzie_academy/core/widgets/component/custom_dialog.dart';
// import 'package:mackenzie_academy/features/auth/presentation/login/auth.dart';
//
// class RegisterScreen extends StatefulWidget {
//   // void Function()? onTap;
//   RegisterScreen({super.key,
//     // required this.onTap
//   });
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController userNameController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   TextEditingController emailController = TextEditingController();
//
//   Future<void> createUserDocument(UserCredential? userCredential) async {
//     if (userCredential != null && userCredential.user != null) {
//       try {
//         await FirebaseFirestore.instance
//             .collection("Users")
//             .doc(userCredential.user!.uid)
//             .set({
//           "email": userCredential.user!.email,
//           'userName': userNameController.text,
//           'role': 'User'
//         });
//         print("User document created successfully");
//       } catch (e) {
//         print("Failed to create user document: $e");
//       }
//     }
//   }
//
//   void register() async {
//     showDialog(
//         context: context,
//         builder: (context) => const Center(
//           child: CircularProgressIndicator(),
//         ));
//     if (passwordController.text != confirmPasswordController.text) {
//       Navigator.pop(context);
//       displayMessageToUser("Passwords Don't Match", context);
//     } else {
//       try {
//         UserCredential? userCredentials = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//             email: emailController.text, password: passwordController.text);
//         createUserDocument(userCredentials);
//         Navigator.pop(context);
//         Navigator.of(context).pushReplacementNamed(RoutesName.loginRoute);
//       } on FirebaseAuthException catch (e) {
//         Navigator.pop(context);
//         displayMessageToUser(e.code, context);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF0A155A),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             // Logo
//             Image.asset('assets/images/logo2.png', height: 200.0),
//             const SizedBox(height: 20),
//             // Username TextField
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: TextField(
//                 controller: userNameController,
//                 decoration: InputDecoration(
//                   hintText: 'اسم المستخدم',
//                   hintStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.person, color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: 'البريد الإلكتروني',
//                   hintStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.person, color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Password TextField
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'كلمة المرور',
//                   hintStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.lock, color: Colors.white),
//                   suffixIcon: Icon(Icons.visibility, color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//             Directionality(
//               textDirection: TextDirection.rtl,
//               child: TextField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'تأكيد كلمة المرور',
//                   hintStyle: TextStyle(color: Colors.white),
//                   prefixIcon: Icon(Icons.lock, color: Colors.white),
//                   suffixIcon: Icon(Icons.visibility, color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Login Button
//             ElevatedButton(
//               onPressed: () {
//                 register();
//               },
//               // onPressed: () async {
//               //   if (emailController.text.isEmpty ||
//               //       passwordController.text.isEmpty) {
//               //     AlertDialog(title: Text("Email and password cannot be empty"));
//               //     return;
//               //   }
//               //   if (confirmPasswordController.text.isEmpty ||
//               //       passwordController.text != confirmPasswordController.text) {
//               //     AlertDialog(title: Text("confirm password does not match"));
//               //     return;
//               //   }
//               //   try {
//               //     final user = await AuthHelper.signupWithEmail(
//               //         email: emailController.text,
//               //         password: passwordController.text);
//               //     createUserDocument(user);
//               //     if (user != null) {
//               //       AlertDialog(title: Text("signup successful"));
//               //       Navigator.pop(context);
//               //     }
//               //   } catch (e) {
//               //     print(e);
//               //   }
//               // },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Color(0xFF0A155A),
//                 backgroundColor: Colors.white, // foreground
//                 minimumSize: Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               child: const Text('تسجيل الدخول'),
//             ),
//             SizedBox(height: 20),
//
//             // Sign up text
//             GestureDetector(
//               // onTap: widget.onTap,
//               child: const Text(
//                 'لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Social Media Login Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 52.0,
//                   height: 52.0,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color(0xFFECE9EC),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(
//                         12.0), // Adjust the padding as needed
//                     child: ClipOval(
//                       child: Image.asset('assets/images/googleLogo.png',
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Image.asset(
//                       'assets/images/AppleLogo.png'), // Replace with your Google logo asset
//                   iconSize: 50,
//                   onPressed: () {
//                     // Handle Apple login
//                   },
//                 ),
//                 Container(
//                   width: 52.0,
//                   height: 52.0,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color(0xFFECE9EC),
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.phone, color: Colors.black87, size: 28),
//                     onPressed: () {
//                       // Handle Phone login
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_dialog.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/router/routes_name.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_dialog.dart';
import 'package:mackenzie_academy/core/widgets/component/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      try {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          "email": userCredential.user!.email,
          'userName': userNameController.text,
          'role': 'User'
        });
        print("User document created successfully");
      } catch (e) {
        print("Failed to create user document: $e");
      }
    }
  }

  void register() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessageToUser("Passwords Don't Match", context);
    } else {
      try {
        UserCredential? userCredentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        createUserDocument(userCredentials);
        Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed(RoutesName.loginRoute);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue20,
        iconTheme: IconThemeData(color: AppColors.white), // Set back button color to white
      ),
      backgroundColor: AppColors.blue20,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            _buildLogo(),
            const SizedBox(height: 20),
            // Username TextField
            _buildUsernameTextField(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            // Password TextField
            _buildConfirmPasswordTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: 20),
            // Register Button
            ElevatedButton(
              onPressed: () {
                register();
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
            const SizedBox(height: 20),
            // Sign up text
            GestureDetector(
              // onTap: widget.onTap,
              child: const Text(
                'لديك حساب ؟ انضم إلينا أو المتابعه كزائر',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            // Social Media Login Buttons
            _buildSocialMediaLoginButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/images/logo2.png', height: 200.0);
  }

  Widget _buildUsernameTextField() {
    return CustomTextField(
      controller: userNameController,
      hintText: 'اسم المستخدم',
      prefixIcon: Icons.person,
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      hintText: 'البريد الالكتروني',
      prefixIcon: Icons.email,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      hintText: 'كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
    );

  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: confirmPasswordController,
      hintText: 'تأكيد كلمة المرور',
      prefixIcon: Icons.lock,
      isPasswordField: true,
    );

  }

  Widget _buildSocialMediaLoginButtons() {
    return Row(
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
              child: Image.asset('assets/images/googleLogo.png', fit: BoxFit.cover),
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
    );
  }

}

