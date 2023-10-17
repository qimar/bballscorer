import 'package:counterapp/login.dart';
import 'package:flutter/material.dart';

navigatToHome(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
}

navigatToSignUp(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
}

// navigatTo(BuildContext context, Widget screen) {
//   final MaterialPageRoute<Widget> route =
//       MaterialPageRoute<Widget>(builder: (context) => screen);
//   return Navigator.push(context, route);
// }
