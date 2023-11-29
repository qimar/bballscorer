import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:SportRabbit/services/graphql_services/game_services/GamesService.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  GameGQLService _gameGQLService = GameGQLService();
  final int _pageSize = 4;
  int _currentPageNumber = 0;
  // set search keyword
  String _searchKeyword = "";
  String get searchKeyword => _searchKeyword;
  DataState _dataState = DataState.Uninitialized;
  // getter
  DataState get dataState => _dataState;
  List<GameModel> _games = [];
  List<GameModel> get games => _games;
  int _gamesCount = 0;
  int get gamesCount => _gamesCount;
  // setter
  set gamesCount(int gamesCount) {
    _gamesCount = gamesCount;
    notifyListeners();
  }

  int _totalPages = 1;
  bool get _didLastLoad => _currentPageNumber >= _totalPages;
  // fetch games from api
  Future<void> fetchGames({String search = "", bool isRefresh = false}) async {
    Map<String, dynamic> _whereParams = {
      "whereGameFilter": {
        "ispublished": {"_eq": true}
      },
      "limit": _pageSize,
      "offset": _currentPageNumber
    };
    GamePaginatedResponse _gamePaginatedResponse =
        GamePaginatedResponse(games: [], totalCount: 0);
    if (!isRefresh) {
      _dataState = (_dataState == DataState.Uninitialized)
          ? DataState.Initial_Fetching
          : DataState.More_Fetching;
    } else {
      _games.clear();
      _currentPageNumber = 0;
      _dataState = DataState.Refreshing;
    }
    notifyListeners();
    try {
      if (_didLastLoad) {
        _dataState = DataState.No_More_Data;
      } else {
        print("fetching games ${_whereParams.toString()}}");
        _gamePaginatedResponse =
            await _gameGQLService.getAllGamesByParams(variables: _whereParams);
        // if (_dataState == DataState.Refreshing) {
        //   _games.clear();
        // }
        _games += _gamePaginatedResponse.games;
        gamesCount = _gamePaginatedResponse.totalCount;
        _totalPages = (_gamePaginatedResponse.totalCount / _pageSize).ceil();

        _dataState = DataState.Fetched;
        _currentPageNumber += 1;
      }

      notifyListeners();
    } catch (e) {
      print("error in fetching games ${e.toString()}");
      _dataState = DataState.Error;
      notifyListeners();
    }
  }
}
