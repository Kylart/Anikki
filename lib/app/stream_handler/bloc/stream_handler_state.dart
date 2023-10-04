part of 'stream_handler_bloc.dart';

sealed class StreamHandlerState extends Equatable {
  const StreamHandlerState({
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

final class StreamHandlerInitial extends StreamHandlerState {
  const StreamHandlerInitial({
    required super.media,
    super.minEpisode,
  });
}

final class StreamHandlerClosed extends StreamHandlerState {
  const StreamHandlerClosed({
    required super.media,
    super.minEpisode,
  });
}

final class StreamHandlerShowed extends StreamHandlerState {
  const StreamHandlerShowed({
    required super.media,
    super.minEpisode,
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

class StreamHandlerLoading extends StreamHandlerState {
  const StreamHandlerLoading({
    required super.media,
    super.minEpisode = 0,
  });
}

class StreamHandlerSuccess extends StreamHandlerState {
  const StreamHandlerSuccess({
    required super.media,
    super.minEpisode = 0,
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

class StreamHandlerError extends StreamHandlerState {
  const StreamHandlerError({
    required super.media,
    required this.error,
    super.minEpisode = 0,
  });

  final String error;

  @override
  List<Object?> get props => [
        media,
        minEpisode,
        error,
      ];
}
