import 'package:graphql/client.dart';
import 'package:hive/hive.dart';

import 'package:anikki/domain/domain.dart';

GraphQLClient getAnilistClient() {
  final httpLink = HttpLink(
    'https://graphql.anilist.co',
  );

  final authLink = AuthLink(
    getToken: () async {
      final box = await Hive.openBox(UserRepository.boxName);
      final token = box.get(UserRepository.tokenKey);

      return token == null ? null : 'Bearer $token';
    },
  );

  final link = authLink.concat(httpLink);

  return GraphQLClient(
    link: link,
    // The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
  );
}
