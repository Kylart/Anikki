import 'package:anilist/anilist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:anikki/helpers/mixins/loading.dart';
import 'package:anikki/news/store.dart';
import 'package:anikki/providers/anilist/anilist_client.dart';
import 'package:anikki/watch_list/store.dart';

class AnilistStore extends AnilistClient with LoadingMixin, WatchListStore, NewsStore {
  AnilistStore() {
    init();
  }

  Future<void> init() async {
    // Retrieve previous token if any
    final prefs = await SharedPreferences.getInstance();
    final anilistAccessToken =
        prefs.getString('user_preferences_anilistAccessToken');

    setupClient(anilistAccessToken);

    if (anilistAccessToken != null) {
      me = await provider.getMe();
      notifyListeners();

      await getWatchLists();
      notifyListeners();
    }
  }

  void setupClient(String? token) {
    provider = Anilist(accessToken: token);
  }

  Future<void> logout() async {
    /// Remove the stored token
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_preferences_anilistAccessToken');

    /// Remove the current user. Will set isConnected to false
    me = null;
  }
}
