part of 'models.dart';

abstract class Extractor {
  Future<List<VideoSource>> extract(Uri uri);
}
