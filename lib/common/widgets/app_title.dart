import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: const Text('TutorialKart',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 30)));
  }
}

class AppSubTitle extends StatelessWidget {
  const AppSubTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ));
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key, required this.onPressedCallback, required this.title});
  final Function onPressedCallback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          onPressed: onPressedCallback as void Function()?,
          child: Text(title),
        ));
  }
}
