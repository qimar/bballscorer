import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:SportRabbit/services/graphql_services/drills_services/DrillsService.dart';
import 'package:SportRabbit/services/graphql_services/game_services/GamesService.dart';
import 'package:flutter/material.dart';

class DrillsProvider extends ChangeNotifier {
  DrillsGQLService _drillGQLService = DrillsGQLService();
  final int _pageSize = 4;
  int _currentPageNumber = 0;
  // set search keyword
  String _searchKeyword = "";
  String get searchKeyword => _searchKeyword;
  DataState _dataState = DataState.Uninitialized;
  // getter
  DataState get dataState => _dataState;
  List<DrillModel> _drills = [];
  List<DrillModel> get drills => _drills;
  int _drillsCount = 0;
  int get drillsCount => _drillsCount;
  // setter
  set drillsCount(int gamesCount) {
    _drillsCount = gamesCount;
    notifyListeners();
  }

  int _totalPages = 1;
  bool get _didLastLoad => _currentPageNumber >= _totalPages;
  // fetch games from api
  Future<void> fetchDrillsByGame(
      {required GameModel selectedGame,
      String search = "",
      bool isRefresh = false}) async {
    Map<String, dynamic> _whereParams = {
      "whereDrillFilter": {
        "game_id": {"_eq": selectedGame.id},
        "ispublished": {"_eq": true}
      },
    };
    DrillsPaginatedResponse _drillPaginatedResponse =
        DrillsPaginatedResponse(drills: [], totalCount: 0);
    if (!isRefresh) {
      _dataState = (_dataState == DataState.Uninitialized)
          ? DataState.Initial_Fetching
          : DataState.More_Fetching;
    } else {
      _drills.clear();
      _currentPageNumber = 0;
      _dataState = DataState.Refreshing;
    }
    notifyListeners();
    try {
      if (_didLastLoad) {
        _dataState = DataState.No_More_Data;
      } else {
        print("fetching games ${_whereParams.toString()}}");
        _drillPaginatedResponse =
            await _drillGQLService.getAllDrillsByParams(_whereParams);
        // if (_dataState == DataState.Refreshing) {
        //   _drills.clear();
        // }
        _drills += _drillPaginatedResponse.drills.cast<DrillModel>();
        drillsCount = _drillPaginatedResponse.totalCount;
        _totalPages = (_drillPaginatedResponse.totalCount / _pageSize).ceil();

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
