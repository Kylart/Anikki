part of 'stream_handler_bloc.dart';

sealed class StreamHandlerEvent extends Equatable {
  const StreamHandlerEvent({
    required this.media,
    this.minEpisode,
  });

  final Fragment$shortMedia media;
  final int? minEpisode;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
      ];
}

class StreamHandlerShowRequested extends StreamHandlerEvent {
  const StreamHandlerShowRequested({
    required super.media,
    super.minEpisode,
    this.entry,
    this.type,
  });

  final StreamRequestType? type;
  final LibraryEntry? entry;

  @override
  List<Object?> get props => [
        media,
        entry,
        minEpisode,
        type,
      ];
}

class StreamHandlerCloseRequested extends StreamHandlerEvent {
  const StreamHandlerCloseRequested({
    required super.media,
    super.minEpisode = 0,
  });
}

class StreamHandlerRequested extends StreamHandlerEvent {
  const StreamHandlerRequested({
    required super.media,
    super.minEpisode = 0,
  });
}
