part of 'downloader_bloc.dart';

abstract class DownloaderEvent extends Equatable {
  const DownloaderEvent();

  @override
  List<Object?> get props => [];
}

class DownloaderClosed extends DownloaderEvent {
  const DownloaderClosed();
}

class DownloaderRequested extends DownloaderEvent {
  const DownloaderRequested({
    required this.media,
    this.entry,
    this.episode,
    this.title,
    this.isStreaming = false,
  });

  final Fragment$shortMedia? media;
  final LibraryEntry? entry;
  final int? episode;
  final String? title;
  final bool isStreaming;

  @override
  List<Object?> get props => [
        media,
        entry,
        episode,
        title,
        isStreaming,
      ];
}

class DownloaderFiltered extends DownloaderEvent {
  const DownloaderFiltered(this.filter);

  final DownloaderFilter filter;

  @override
  List<Object?> get props => [
        filter,
      ];
}
