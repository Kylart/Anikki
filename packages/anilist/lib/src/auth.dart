import 'package:anilist/src/anilist_client.dart';
import 'package:anilist/src/exceptions/exceptions.dart';
import 'package:anilist/src/models/anilist_user/anilist_user.dart';
import 'package:anilist/src/queries/viewer.dart';

import 'package:graphql/client.dart';

mixin AnilistAuth on AnilistClient {
  Future<AnilistUser> getMe() async {
    final QueryOptions options = QueryOptions(
      document: gql(viewerQuery),
    );

    final QueryResult result = await client.query(options);

    if (result.data?['Viewer'] == null) throw AnilistNotConnectedException();

    return AnilistUser.fromMap(result.data?['Viewer']);
  }
}
