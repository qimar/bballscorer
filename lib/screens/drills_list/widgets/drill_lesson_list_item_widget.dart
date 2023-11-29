import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/providers/DrillsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrillLessonListItemWidget extends StatelessWidget {
  const DrillLessonListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrillModel> _drills = Provider.of<DrillsProvider>(context).drills;
    return Container(
        // color: Colors.grey,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 5),
        height: 65,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text("Exrcise List",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              Text("1/${_drills.length} Completed")
            ]));
  }
}
