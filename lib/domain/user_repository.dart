import 'package:anikki/data/data.dart';

typedef AnilistUser = Query$Viewer$Viewer;

class UserRepository {
  const UserRepository(this.anilist);

  /// The [Anilist] API to use for this repository
  final Anilist anilist;

  /// The key used to store the auth token given from the provider
  static const tokenKey = 'user_preferences_anilistAccessToken';

  /// The box name to use to store informations
  static const boxName = 'anilist_auth';

  /// Returns the current user if any
  Future<AnilistUser> getCurrentUser() async {
    return await anilist.getMe();
  }
}
