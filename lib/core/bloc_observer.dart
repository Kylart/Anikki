import 'package:anikki/app/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/app/video_player/bloc/video_player_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

final observer = TalkerBlocObserver(
  settings: TalkerBlocLoggerSettings(
    eventFilter: (bloc, event) {
      return ![
        VideoPlayerResetShowTimer,
        TorrentDataRequested,
      ].contains(event.runtimeType);
    },
  ),
);
