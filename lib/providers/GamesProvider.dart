import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:SportRabbit/services/graphql_services/game_services/GamesService.dart';
import 'package:flutter/material.dart';

class GamesProvider extends ChangeNotifier {
  GameGQLService _gameGQLService = GameGQLService();
  final int _pageOffset = 10;
  int _currentPageNumber = 0;

  // set search keyword
  String _searchKeyword = "";
  String get searchKeyword => _searchKeyword;

  // setter
  set setCurrentPageNumber(int pageNumber) {
    _currentPageNumber = pageNumber;
    notifyListeners();
  }

  DataState _dataState = DataState.Uninitialized;

  List<GameModel> _games = [];
  List<GameModel> get games => _games;
  // setter
  // set games(List<GameModel> games) {
  //   _games = games;
  //   notifyListeners();
  // }
  int _gamesCount = 0;
  int get gamesCount => _gamesCount;
  // setter
  set gamesCount(int gamesCount) {
    _gamesCount = gamesCount;
    notifyListeners();
  }

  // fetch games from api
  Future<void> fetchGames({String search = "", bool isRefresh = false}) async {
    Map<String, dynamic> _whereParams = {
      "whereGameFilter": {
        "ispublished": {"_eq": true}
      }
    };
    GamePaginatedResponse _gamePaginatedResponse =
        await _gameGQLService.getAllGamesByParams(variables: _whereParams);
    gamesCount = _gamePaginatedResponse.totalCount;
    _games.addAll(_gamePaginatedResponse.games);
    notifyListeners();
  }
}
