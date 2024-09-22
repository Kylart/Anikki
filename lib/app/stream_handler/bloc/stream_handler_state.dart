part of 'stream_handler_bloc.dart';

sealed class StreamHandlerState extends Equatable {
  const StreamHandlerState({
    required this.media,
    this.minEpisode,
    this.videoType,
  });

  final Fragment$media media;
  final int? minEpisode;
  final SubOrDub? videoType;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
        videoType,
      ];
}

final class StreamHandlerInitial extends StreamHandlerState {
  const StreamHandlerInitial({
    required super.media,
    super.minEpisode,
    super.videoType,
  });
}

final class StreamHandlerClosed extends StreamHandlerState {
  const StreamHandlerClosed({
    required super.media,
    super.minEpisode,
    super.videoType,
  });
}

final class StreamHandlerShowed extends StreamHandlerState {
  const StreamHandlerShowed({
    required super.media,
    super.minEpisode,
    super.videoType,
    this.entry,
    this.type,
  });

  final LibraryEntry? entry;
  final StreamRequestType? type;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
        type,
        entry,
      ];
}

final class StreamHandlerLoading extends StreamHandlerState {
  const StreamHandlerLoading({
    required super.media,
    super.minEpisode = 0,
    super.videoType,
  });
}

final class StreamHandlerSuccess extends StreamHandlerState {
  const StreamHandlerSuccess({
    required super.media,
    super.minEpisode = 0,
    super.videoType,
    required this.sources,
  });

  final List<ConsumetEpisode> sources;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
        sources,
      ];
}

final class StreamHandlerError extends StreamHandlerState {
  const StreamHandlerError({
    required super.media,
    required this.error,
    super.minEpisode = 0,
    super.videoType,
  });

  final String error;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
        error,
      ];
}
