// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';
// import 'package:ytadmin/model/user_model.dart';
// import 'package:ytadmin/model/video_model.dart';
// import 'package:ytadmin/providers/UserProvider.dart';

// import '../config/nhost_config.dart';

// class UserService {
//   static Future<UserModel?> signIn(
//       dynamic context,
//       TextEditingController emailController,
//       TextEditingController passwordController) async {
//     final auth = NhostAuthProvider.of(context)!;
//     UserModel? userResult;
//     try {
//       await auth
//           .signInEmailPassword(
//               email: emailController.text, password: passwordController.text)
//           .then((value) {
//         var userData = value.session!.user;
//         Map<String, dynamic> userInfo = {
//           "id": userData!.id.toString(),
//           "accessToken": value.session!.accessToken,
//           "avatarUrl": userData.avatarUrl.toString(),
//           "createdAt": userData.createdAt.toString(),
//           "displayName": userData.displayName.toString(),
//           "email": userData.email.toString(),
//           "locale": userData.locale.toString(),
//           "roles": userData.roles.toString(),
//           "metadata": userData.metadata.toString(),
//           "isAnonymous": userData.isAnonymous,
//           "defaultRole": userData.defaultRole.toString(),
//         };
//         userResult = UserModel.fromJson(userInfo);

//         //return userResult;
//       });
//     } on ApiException {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Sign in Failed'),
//         ),
//       );
//     } on SocketException {
//       // ignore: avoid_print
//       // print(e);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Network Failed'),
//         ),
//       );
//     }
//     return userResult;
//   }
// }

// class UserModel {
//   static UserModel? fromJson(Map<String, dynamic> userInfo) {}
// }
