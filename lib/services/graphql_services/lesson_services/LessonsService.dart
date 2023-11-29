import 'package:SportRabbit/models/lesson_model.dart';
import 'package:SportRabbit/services/graphql_services/config/grapgql_client.dart';
import 'package:SportRabbit/services/graphql_services/drills_services/graphql/queries/drill_queries_gql.dart';
import 'package:graphql/client.dart';

class LessonsGQLService {
  final GraphQLClient _client = initGraphQLClient();
  // constructor
  LessonsGQLService();

  // fetch list of games from graphql
  Future<LessonsPaginatedResponse> getAllDrillsByParams(
      Map<String, dynamic> variables) async {
    final QueryOptions options = QueryOptions(
      document: gql(getAllDrillsByParamsQuery),
      variables: variables,
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return LessonsPaginatedResponse.fromJson(result.data!);
  }
}

class LessonsPaginatedResponse {
  final List<LessonModel> lessons;
  final int totalCount;

  LessonsPaginatedResponse({
    required this.lessons,
    required this.totalCount,
  });

  // from json
  factory LessonsPaginatedResponse.fromJson(Map<String, dynamic> json) {
    return LessonsPaginatedResponse(
        lessons: (json['lesson'] as List<dynamic>)
            .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCount: json['lesson_aggregate']['aggregate']['count'] as int);
  }
}
