import 'package:SportRabbit/services/graphql_services/config/nhost_config.dart';
import 'package:graphql/client.dart';

GraphQLClient initGraphQLClient() {
  final HttpLink httpLink = HttpLink(NHOST_GRAPHQL_URL,
      defaultHeaders: {'x-hasura-admin-secret': NHOST_GRAPHQL_SECRET});

  return GraphQLClient(cache: GraphQLCache(), link: httpLink);
}
