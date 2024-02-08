import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'package:anikki/core/core.dart';

import 'exceptions/exceptions.dart';
import 'models/models.dart';
import 'utils/hash.dart';

export 'exceptions/exceptions.dart';
export 'models/models.dart';

part 'anilist_client.dart';
part 'auth.dart';
part 'info.dart';
part 'list.dart';
part 'recommandations.dart';
part 'schedule.dart';
part 'search.dart';
part 'trending.dart';

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
