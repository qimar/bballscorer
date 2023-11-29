import 'package:SportRabbit/models/game_model.dart';
import 'package:flutter/material.dart';

class DrillTitleWidget extends StatelessWidget {
  final GameModel game;
  final int index;
  const DrillTitleWidget({Key? key, required this.game, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double leftAndRightPadding = 12;

    return Padding(
        padding: EdgeInsets.only(
            right: leftAndRightPadding, left: 20, top: 8, bottom: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // 0 index has column
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // game duration and difficulty
            Text(
              game.difficultyAndDuration,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            // game title
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8),
              child: Text(game.title!,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )
          ]),
          // text button written join program
          TextButton(
              child: Text('Join Program',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary)),
              onPressed: () {
                print('Join Program Pressed');
              })
        ]));
  }
}
