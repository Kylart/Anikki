import 'package:graphql/client.dart';
import 'package:kawanime/services/externals/anilist/schedule.dart';

import './trendings.dart';
import './info.dart';

class Anilist {
  final String baseUrl = 'https://graphql.anilist.co';
  late GraphQLClient client;
  late AnilistTrendings trendings;
  late AnilistAiringSchedule airingSchedule;
  late AnilistInfo info;

  Anilist() {
    final httpLink = HttpLink(baseUrl);

    client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: httpLink,
    );

    airingSchedule = AnilistAiringSchedule(client: client);
    trendings = AnilistTrendings(client: client);
    info = AnilistInfo(client: client);
  }
}
