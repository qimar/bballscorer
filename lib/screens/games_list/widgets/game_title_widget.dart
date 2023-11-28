import 'package:SportRabbit/models/game_model.dart';
import 'package:flutter/material.dart';

class GameTitleWidget extends StatelessWidget {
  final GameModel game;
  final int index;
  const GameTitleWidget({Key? key, required this.game, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double leftAndRightPadding = 12;

    return Padding(
        padding: EdgeInsets.only(
            right: leftAndRightPadding,
            left: leftAndRightPadding,
            top: 8,
            bottom: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(game.difficultyAndDuration),
            Text("${game.title!} - $index",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))
          ]),
          // text button written join program
          TextButton(
              child: Text('Join Program',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary)),
              onPressed: () {
                print('Join Program Pressed');
              })
        ]));
  }
}
