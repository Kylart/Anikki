import 'package:anilist/anilist.dart';
import 'package:flutter/foundation.dart';

abstract class AnilistClient with ChangeNotifier {
  Query$Viewer$Viewer? me;
  late Anilist provider;

  bool get isConnected => me != null;
}
