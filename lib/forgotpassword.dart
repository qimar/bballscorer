import 'package:counterapp/common/widgets/app_title.dart';
import 'package:counterapp/home.dart';
import 'package:counterapp/login.dart';
import 'package:counterapp/signup.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                const AppTitle(),
                const AppSubTitle(title: 'Forgot Password'),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address'))),
                AppElevatedButton(
                    onPressedCallback: navigatToHome, title: 'Submit'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                          child: const Text('Sign Up',
                              style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            //signup screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          })
                    ])
              ],
            )));
  }

  Future navigatToHome() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
