// // import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// // class AuthHelper {
// //   Future<void> createUserDocument(UserCredential? usercredential) async {
// //     if(usercredential!=null && usercredential.user!=null) {
// //       await FirebaseFirestore.instance.collection("Users").doc(usercredential.user!.uid).set(
// //           {"email":usercredential.user!.email,
// //             'userName':usercredential.user!.displayName,
// //             'role':'User'
// //           });
// //     }
// //   }
// // }
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:mackenzie_academy/helper_function.dart';
// // import 'package:package_info_plus/package_info_plus.dart';
// //
// // class AuthHelper {
// //   static FirebaseAuth _auth = FirebaseAuth.instance;
// //
// //   static signInWithEmail({required String email, required String password,required BuildContext context}) async {
// //     showDialog(
// //         context: context,
// //         builder: (context) =>
// //         const Center(
// //           child: CircularProgressIndicator(),
// //         ));
// //     try {
// //       UserCredential? userCredentials = await FirebaseAuth.instance
// //           .signInWithEmailAndPassword(
// //           email: email, password: password);
// //       if (context.mounted) Navigator.pop(context);
// //
// //     } on FirebaseAuthException catch (e) {
// //       Navigator.pop(context);
// //       displayMessageToUser(e.code, context);
// //     }
// //   }
// //
// //   static signupWithEmail({required String email, required String password}) async {
// //     final res = await _auth.createUserWithEmailAndPassword(
// //         email: email, password: password);
// //     final User? user = res.user;
// //     return user;
// //   }
// //   static displayMessageToUser(String message, BuildContext context) {
// //     final snackBar = SnackBar(content: Text(message));
// //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
// //   }
// //
// // }
// //
// class UserHelper {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   Future<void> addUserDetails(String userId, String name, String email,
//       String role) async {
//     await _db.collection('users').doc(userId).set({
//       'name': name,
//       'email': email,
//       'role': role,
//     });
//   }
// }
// //
// static saveUser(User user) async {
//     Map<String, dynamic> userData = {
//       "name": user.displayName,
//       "email": user.email,
//       "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
//       "created_at": user.metadata.creationTime?.millisecondsSinceEpoch,
//       "role": "user",
//     };
//
//     final userRef = _db.collection("users").doc(user.uid);
//     await _db.collection("users").doc(user.uid).set(userData);
//
//     // if ((await userRef.get()).exists) {
//     //   await userRef.update({
//     //     "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
//     //   });
//     // } else {
//     //   await _db.collection("users").doc(user.uid).set(userData);
//     // }
//    // await _saveDevice(user);
//   }
//
// //   // static _saveDevice(User user) async {
// //   //   DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
// //   //   String deviceId;
// //   //   Map<String, dynamic> deviceData;
// //   //   if (Platform.isAndroid) {
// //   //     final deviceInfo = await devicePlugin.androidInfo;
// //   //     deviceId = deviceInfo.;
// //   //     deviceData = {
// //   //       "os_version": deviceInfo.version.sdkInt.toString(),
// //   //       "platform": 'android',
// //   //       "model": deviceInfo.model,
// //   //       "device": deviceInfo.device,
// //   //     };
// //   //   }
// //   //   if (Platform.isIOS) {
// //   //     final deviceInfo = await devicePlugin.iosInfo;
// //   //     deviceId = deviceInfo.identifierForVendor;
// //   //     deviceData = {
// //   //       "os_version": deviceInfo.systemVersion,
// //   //       "device": deviceInfo.name,
// //   //       "model": deviceInfo.utsname.machine,
// //   //       "platform": 'ios',
// //   //     };
// //   //   }
// //   //   final nowMS = DateTime.now().toUtc().millisecondsSinceEpoch;
// //   //   final deviceRef = _db
// //   //       .collection("users")
// //   //       .doc(user.uid)
// //   //       .collection("devices")
// //   //       .doc(deviceId);
// //   //   if ((await deviceRef.get()).exists) {
// //   //     await deviceRef.update({
// //   //       "updated_at": nowMS,
// //   //       "uninstalled": false,
// //   //     });
// //   //   } else {
// //   //     await deviceRef.set({
// //   //       "updated_at": nowMS,
// //   //       "uninstalled": false,
// //   //       "id": deviceId,
// //   //       "created_at": nowMS,
// //   //       "device_info": deviceData,
// //   //     });
// //   //   }
// //   // }
