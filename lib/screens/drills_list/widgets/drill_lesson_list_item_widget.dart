import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/providers/DrillsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrillLessonListItemWidget extends StatelessWidget {
  const DrillLessonListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrillModel> _drills = Provider.of<DrillsProvider>(context).drills;
    return SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const Text("Exrcise Liet"),
          Text("1/${_drills.length} Completed")
        ]));
  }
}
