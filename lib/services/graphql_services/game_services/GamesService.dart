import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/models/game_paginated_response_mode.dart';
import 'package:SportRabbit/services/graphql_services/config/grapgql_client.dart';
import 'package:SportRabbit/services/graphql_services/game_services/graphql/queries/game_queries_gql.dart';
import 'package:graphql/client.dart';

class GameGQLService {
  final GraphQLClient _client = initGraphQLClient();
  // constructor
  GameGQLService();

  // fetch list of games from graphql
  Future<GamePaginatedResponse> getAllGamesByParams(
      {required Map<String, dynamic> variables}) async {
    final QueryOptions options = QueryOptions(
      document: gql(getAllGamesByParamsQuery),
      variables: variables,
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    GamePaginatedResponse _gamePaginatedResponse =
        GamePaginatedResponse.fromJson(result.data!);
    return _gamePaginatedResponse;
  }
}
