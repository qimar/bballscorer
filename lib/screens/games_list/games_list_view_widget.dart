import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/screens/games_list/game_list_item_widet.dart';
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
        child: _scrollNotificationListener());
  }

  Widget _scrollNotificationListener() {
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
                        return GameListItemWidet(game: _data[index]);
                      })))),
      if (_dataState == DataState.More_Fetching)
        const Center(child: CircularProgressIndicator())
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
