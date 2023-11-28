import 'package:SportRabbit/common/colors.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/screens/games_list/widgets/games_list_view_widget.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class DrillsListView extends StatelessWidget {
  final GameModel game;

  const DrillsListView({super.key, required this.game});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: game.difficultyAndDuration,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n${game.title}',
                        style: const TextStyle(fontSize: 28))
                  ])),

          // Text(game.title!,
          //     style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Consumer<GamesProvider>(builder:
            (BuildContext context, GamesProvider gamesProvider, Widget? _) {
          switch (gamesProvider.dataState) {
            case DataState.Uninitialized:
              Future(() {
                gamesProvider.fetchGames();
              });
              return DrillsListViewWidget(gamesProvider.games, false);
            case DataState.Initial_Fetching:
              return const Center(
                  child: SizedBox(child: CircularProgressIndicator()));
            case DataState.More_Fetching:
            case DataState.Refreshing:
              return DrillsListViewWidget(gamesProvider.games, true);
            case DataState.Fetched:
            case DataState.Error:
            case DataState.No_More_Data:
              return DrillsListViewWidget(gamesProvider.games, false);
          }
        }));
  }
}
