import 'package:anilist/anilist.dart';

abstract class AnilistClient {
  AnilistUser? me;
  late Anilist provider;

  bool get isConnected => me != null;
}
