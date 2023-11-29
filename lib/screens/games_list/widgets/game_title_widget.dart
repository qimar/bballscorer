import 'package:SportRabbit/models/game_model.dart';
import 'package:flutter/material.dart';

class GameTitleWidget extends StatelessWidget {
  final GameModel game;
  const GameTitleWidget({Key? key, required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double leftAndRightPadding = 12;

    return Padding(
        padding: EdgeInsets.only(
            right: leftAndRightPadding, left: 16, top: 8, bottom: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // 0 index has column
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // game duration and difficulty
            Text(
              game.difficultyAndDuration,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            // game title
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8),
              child: Text("${game.title!} - ${game.id}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )
          ]),
          // text button written join program
          TextButton(
              child: Text('Join Program',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary)),
              onPressed: () {
                print('Join Program Pressed');
                // navigate to drills list
                // Navigator.pushNamed(context, '/drills_list',
                //     arguments: {'game': game, 'index': index});
              })
        ]));
  }
}
