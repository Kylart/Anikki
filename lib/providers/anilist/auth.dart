import 'package:graphql/client.dart';

import 'package:anikki/helpers/errors/anilist_not_connected_exception.dart';
import 'package:anikki/providers/anilist/types/anilist_user/anilist_user.dart';
import 'package:anikki/providers/anilist/queries/viewer.dart';

class AnilistAuth {
  AnilistAuth({required this.client});

  final GraphQLClient client;

  Future<AnilistUser> getMe() async {
    final QueryOptions options = QueryOptions(
      document: gql(viewerQuery),
    );

    final QueryResult result = await client.query(options);

    if (result.data?['Viewer'] == null) throw AnilistNotConnectedException;

    return AnilistUser.fromMap(result.data?['Viewer']);
  }
}