import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/services/graphql_services/config/grapgql_client.dart';
import 'package:SportRabbit/services/graphql_services/game_services/graphql/queries/game_queries_gql.dart';
import 'package:graphql/client.dart';

class GameGQLService {
  final GraphQLClient _client = initGraphQLClient();
  // constructor
  GameGQLService();

  // fetch list of games from graphql
  Future<GamePaginatedResponse> getAllGamesByParams(
      Map<String, dynamic> variables) async {
    final QueryOptions options = QueryOptions(
      document: gql(getAllGamesByParamsQuery),
      variables: variables,
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return GamePaginatedResponse.fromJson(result.data!);
  }
}

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
