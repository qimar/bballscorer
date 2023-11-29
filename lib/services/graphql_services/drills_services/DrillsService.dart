import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/services/graphql_services/config/grapgql_client.dart';
import 'package:SportRabbit/services/graphql_services/drills_services/graphql/queries/drill_queries_gql.dart';
import 'package:graphql/client.dart';

class DrillsGQLService {
  final GraphQLClient _client = initGraphQLClient();
  // constructor
  DrillsGQLService();

  // fetch list of games from graphql
  Future<DrillsPaginatedResponse> getAllDrillsByParams(
      Map<String, dynamic> variables) async {
    final QueryOptions options = QueryOptions(
      document: gql(getAllDrillsByParamsQuery),
      variables: variables,
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return DrillsPaginatedResponse.fromJson(result.data!);
  }
}

class DrillsPaginatedResponse {
  final List<DrillModel> drills;
  final int totalCount;

  DrillsPaginatedResponse({
    required this.drills,
    required this.totalCount,
  });

  // from json
  factory DrillsPaginatedResponse.fromJson(Map<String, dynamic> json) {
    return DrillsPaginatedResponse(
        drills: (json['drill'] as List<dynamic>)
            .map((e) => DrillModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCount: json['drill_aggregate']['aggregate']['count'] as int);
  }
}
