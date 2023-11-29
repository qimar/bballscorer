import 'package:SportRabbit/models/game_model.dart';

class GamePaginatedResponse {
  final List<GameModel> games;
  final int totalCount;

  GamePaginatedResponse({
    required this.games,
    required this.totalCount,
  });

  // from json
  factory GamePaginatedResponse.fromJson(Map<String, dynamic> json) {
    return GamePaginatedResponse(
      games: (json['game'] as List<dynamic>)
          .map((e) => GameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['game_aggregate']['aggregate']['count'] as int,
    );
  }
}
