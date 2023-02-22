import 'package:graphql/client.dart';

import 'package:anikki/providers/anilist/auth.dart';
import 'package:anikki/providers/anilist/info.dart';
import 'package:anikki/providers/anilist/schedule.dart';

class AnilistStandalone {
  final String baseUrl = 'https://graphql.anilist.co';
  late GraphQLClient client;
  late AnilistAiringSchedule airingSchedule;
  late AnilistInfo info;
  late AnilistAuth auth;

  AnilistStandalone({Map<String, String>? headers}) {
    final httpLink = HttpLink(
      baseUrl,
      defaultHeaders: headers ?? {},
    );

    client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: httpLink,
    );

    airingSchedule = AnilistAiringSchedule(client: client);
    info = AnilistInfo(client: client);
    auth = AnilistAuth(client: client);
  }
}
