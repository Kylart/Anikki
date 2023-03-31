import 'package:graphql/client.dart';

import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/auth.dart';
import 'package:anilist/src/info.dart';
import 'package:anilist/src/list.dart';
import 'package:anilist/src/search.dart';

class Anilist extends AnilistClient
    with AnilistAuth, AnilistInfo, AnilistList, AnilistSearch {
  Anilist({required GraphQLClient client}) : super(client: client);
}
