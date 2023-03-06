import 'package:anilist/anilist.dart';
import 'package:flutter/foundation.dart';

abstract class AnilistClient with ChangeNotifier {
  AnilistUser? me;
  late Anilist provider;

  bool get isConnected => me != null;
}
