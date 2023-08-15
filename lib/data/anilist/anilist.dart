import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'models/models.dart';
import 'exceptions/exceptions.dart';
import 'utils/hash.dart';

export 'models/models.dart';
export 'exceptions/exceptions.dart';

part 'anilist_client.dart';
part 'auth.dart';
part 'info.dart';
part 'list.dart';
part 'schedule.dart';
part 'search.dart';
part 'trending.dart';
part 'recommandations.dart';

class Anilist extends AnilistClient
    with
        AnilistAuth,
        AnilistInfo,
        AnilistList,
        AnilistSearch,
        AnilistSchedule,
        AnilistTrending,
        AnilistRecommandations {
  Anilist({required super.client});
}
