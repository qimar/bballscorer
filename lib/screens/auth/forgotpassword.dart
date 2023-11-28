import 'package:SportRabbit/common/widgets/app_title.dart';

import 'package:SportRabbit/screens/auth/signup.dart';
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
            child: ListView(children: <Widget>[
              const AppTitle(),
              const AppSubTitle(title: 'Forgot Password'),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address'))),
              // cutom elevated button
              // AppElevatedButton(
              //     onTap: navigatToSignUp(context), title: 'Submit'),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // todo: forgot password logic
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  )),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                        child: const Text('Sign Up',
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.pop(context);
                          //signup screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        })
                  ])
            ])));
  }
}
