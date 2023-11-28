import 'package:SportRabbit/models/program_type.dart';
import 'package:flutter/material.dart';

class ProgramTypeLabelWidget extends StatelessWidget {
  final ProgramType programType;
  const ProgramTypeLabelWidget({super.key, required this.programType});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    // countainer with rounded corners and row inside
    return Container(
        width: 75,
        margin: const EdgeInsets.fromLTRB(15, 20, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(children: [
          // icon
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.green[900]),
          ),
          // text
          Text(programType.title!,
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
