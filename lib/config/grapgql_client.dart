import 'package:graphql/client.dart';

GraphQLClient initGraphQLClient() {
  final HttpLink httpLink = HttpLink(
    'https://yfnaaqdhstomxncwctej.hasura.ap-south-1.nhost.run/v1/graphql',
    defaultHeaders: {
      'x-hasura-admin-secret':
          'o_A^0hsy0w!yv+Wb_q_ggrz__I8dWs5i', // Replace with your secret
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );
}
