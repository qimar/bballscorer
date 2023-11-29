import 'package:SportRabbit/common/colors.dart';
import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/screens/games_list/widgets/games_list_view_widget.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class GamesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: appMainColor,
            elevation: 0.0,
            centerTitle: true,
            title:
                Text('Games', style: Theme.of(context).textTheme.headlineSmall),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.notifications_active_outlined,
                      color: Colors.black87, size: 30),
                  onPressed: () {
                    // do something
                  }),
            ]),
        body: Consumer<GameProvider>(builder:
            (BuildContext context, GameProvider gamesProvider, Widget? _) {
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
