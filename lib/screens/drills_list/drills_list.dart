import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/providers/DrillsProvider.dart';
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
                    ]))),
        body: Consumer<DrillsProvider>(builder:
            (BuildContext context, DrillsProvider drillProvider, Widget? _) {
          switch (drillProvider.dataState) {
            case DataState.Uninitialized:
              Future(() {
                drillProvider.fetchDrillsByGame(selectedGame: game);
              });
              return DrillsListViewWidget(drillProvider.drills, false);
            case DataState.Initial_Fetching:
              return const Center(
                  child: SizedBox(child: CircularProgressIndicator()));
            case DataState.More_Fetching:
            case DataState.Refreshing:
              return DrillsListViewWidget(drillProvider.drills, true);
            case DataState.Fetched:
            case DataState.Error:
            case DataState.No_More_Data:
              return DrillsListViewWidget(drillProvider.drills, false);
          }
        }));
  }
}
