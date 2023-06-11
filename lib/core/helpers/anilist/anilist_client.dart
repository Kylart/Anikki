import 'package:graphql/client.dart';
import 'package:hive/hive.dart';

import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';

GraphQLClient getAnilistClient() {
  final HttpLink httpLink = HttpLink(
    'https://graphql.anilist.co',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async {
      final box = await Hive.openBox(AnilistAuthBloc.boxName);
      final token = box.get(AnilistAuthBloc.tokenKey);

      return token == null ? null : 'Bearer $token';
    },
  );

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(
    link: link,
    // The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
  );
}
