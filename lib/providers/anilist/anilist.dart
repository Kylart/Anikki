import 'package:anilist/anilist.dart';
import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:anikki/watch_list/store.dart';

class AnilistStore extends AnilistClient with LoadingMixin, WatchListStore {
  AnilistStore({required GraphQLClient client}) {
    provider = Anilist(client: client);
    login();
  }

  Future<void> login() async {
    try {
      me = await provider.getMe();
      notifyListeners();

      await getWatchLists();
      notifyListeners();
    } on AnilistNotConnectedException {
      /// TODO: Handle if not connected
    }
  }

  Future<void> logout() async {
    /// Remove the stored token
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_preferences_anilistAccessToken');

    /// Remove the current user. Will set isConnected to false
    me = null;
  }
}
