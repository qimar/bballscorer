import 'package:SportRabbit/common/widgets/search_field_mock.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/screens/games_list/widgets/game_list_item_widet.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GamesListViewWidget extends StatelessWidget {
  final List<GameModel> _data;
  bool _isLoading;
  GamesListViewWidget(this._data, this._isLoading, {super.key});

  late DataState _dataState;
  late BuildContext _buildContext;
  late double leftAndRightPadding = 15;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _dataState = Provider.of<GamesProvider>(_buildContext).dataState;
    return Padding(
        padding:
            EdgeInsets.fromLTRB(leftAndRightPadding, 0, leftAndRightPadding, 0),
        child: _scrollNotificationListener(context));
  }

  Widget _scrollNotificationListener(BuildContext context) {
    return Column(children: [
      Expanded(
          child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                return _scrollNotification(scrollInfo);
              },
              child: RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh();
                  },
                  child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        // show seach field on 0 index
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(4, 10, 4, 6),
                            child: Center(
                              child: Text(
                                  "Choose one, you can change it anytime",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          );
                        } else if (index == 1) {
                          return SearchFieldModel(
                              searchHintText: "Search for games...",
                              onSearchTap: () {
                                print("GAMES SEARCH FIELD IS CLICKED");
                              });
                        } else {
                          return GameListItemWidet(
                              game: _data[index], index: index);
                        }
                      })))),
      if (_dataState == DataState.More_Fetching)
        Center(
            child: SizedBox(
          height: 15,
          width: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
                strokeWidth: 0.6, color: Theme.of(context).primaryColor),
          ),
        )),
      if (_dataState == DataState.No_More_Data)
        Center(
            child: Text("No more games",
                style: Theme.of(context).textTheme.bodySmall))
    ]);
  }

  // when list veiw scroll will reach at bottom, we will call next page api
  bool _scrollNotification(ScrollNotification scrollInfo) {
    if (!_isLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      _isLoading = true;
      Provider.of<GamesProvider>(_buildContext, listen: false).fetchGames();
    }
    return true;
  }

  // when user pull down list view, we will call refresh api
  _onRefresh() async {
    if (!_isLoading) {
      _isLoading = true;

      Provider.of<GamesProvider>(_buildContext, listen: false)
          .fetchGames(search: "", isRefresh: true);
    }
  }
}
