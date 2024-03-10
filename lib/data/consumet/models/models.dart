import 'package:anikki/core/core.dart';
import 'package:equatable/equatable.dart';

export 'exceptions/exceptions.dart';

part 'anime_episode.dart';
part 'anime_result.dart';
part 'anime_source.dart';
part 'extractor.dart';
part 'anime_provider.dart';
part 'video_source.dart';
part 'video_subtitle.dart';

enum StreamingServers {
  asianload,
  gogocdn,
  streamsb,
  mixdrop,
  mp4upload,
  upcloud,
  vidcloud,
  streamtape,
  vizcloud,

  // same as vizcloud
  mycloud,
  filemoon,
  vidstreaming,
  smashystream,
  streamhub,
  streamwish,
  vidmoly,
}
