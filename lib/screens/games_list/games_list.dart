import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/screens/games_list/games_list_view_widget.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class GamesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink[50],
            elevation: 0.0,
            title:
                Text('Games', style: Theme.of(context).textTheme.headlineSmall),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // do something
                  }),
            ]),
        body: Consumer<GamesProvider>(builder:
            (BuildContext context, GamesProvider gamesProvider, Widget? _) {
          switch (gamesProvider.dataState) {
            case DataState.Uninitialized:
              Future(() {
                gamesProvider.fetchGames();
              });
              return GamesListViewWidget(gamesProvider.games, false);
            case DataState.Initial_Fetching:
              return const Center(
                  child: SizedBox(child: CircularProgressIndicator()));
            case DataState.More_Fetching:
            case DataState.Refreshing:
              return GamesListViewWidget(gamesProvider.games, true);
            case DataState.Fetched:
            case DataState.Error:
            case DataState.No_More_Data:
              return GamesListViewWidget(gamesProvider.games, false);
          }
        }));
  }
}
