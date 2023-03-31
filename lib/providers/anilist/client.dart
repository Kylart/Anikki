import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

GraphQLClient getAnilistClient() {
  final HttpLink httpLink = HttpLink(
    'https://graphql.anilist.co',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('user_preferences_anilistAccessToken');

      return 'Bearer $token';
    },
  );

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(
    link: link,
    // The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(store: HiveStore()),
  );
}
