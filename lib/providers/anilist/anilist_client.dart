import 'package:graphql/client.dart';

abstract class AnilistClient {
  final String baseUrl = 'https://graphql.anilist.co';

  late GraphQLClient client;

  void initClient({Map<String, String>? headers}) {
    final httpLink = HttpLink(
      baseUrl,
      defaultHeaders: headers ?? {},
    );

    client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  Map<String, String> getDefaultHeaders({required String accessToken}) {
    return {
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }
}
