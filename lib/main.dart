import 'package:SportRabbit/screens/login.dart';
import 'package:flutter/material.dart';

// this entry point of flutter
void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 68, 9, 9)),
            useMaterial3: true),
        home: const LoginScreen(title: 'Login Page'));
  }
}
