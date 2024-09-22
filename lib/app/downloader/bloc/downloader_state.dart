part of 'downloader_bloc.dart';

sealed class DownloaderState extends Equatable {
  const DownloaderState();

  @override
  List<Object> get props => [];
}

final class DownloaderClose extends DownloaderState {
  const DownloaderClose();
}

final class DownloaderShow extends DownloaderState {
  const DownloaderShow(this.term, [this.alreadyShow = false]);

  final String term;
  final bool alreadyShow;

  @override
  List<Object> get props => [
        term,
        alreadyShow,
      ];
}

final class DownloaderLoading extends DownloaderState {
  const DownloaderLoading(this.term);

  final String term;

  @override
  List<Object> get props => [
        term,
      ];
}

final class DownloaderError extends DownloaderState {
  const DownloaderError({required this.term, required this.message});

  final String message;
  final String term;

  @override
  List<Object> get props => [
        message,
        term,
      ];
}

final class DownloaderSuccess extends DownloaderState {
  const DownloaderSuccess({
    required this.term,
    required this.torrents,
    required this.filteredTorrents,
    required this.filter,
    this.media,
    this.entry,
    this.episode,
    this.isStreaming = false,
  });

  /// Term used for research on Nyaa.
  final String term;

  /// All torrents found with `term`.
  final List<NyaaTorrent> torrents;

  /// [DownloaderFilter] to keep track of what filters are used for this state.
  final DownloaderFilter filter;

  /// Filtered `torrents`.
  final List<NyaaTorrent> filteredTorrents;

  /// [Fragment$media] used for this state. Used for data.
  final Fragment$media? media;

  /// [LibraryEntry] used for this state. Used for data.
  final LibraryEntry? entry;

  /// Episode number used for this state. Used for smart filtering.
  final int? episode;

  /// Whether the torrent results will be used for download or streaming.
  final bool isStreaming;

  @override
  List<Object> get props => [
        term,
        torrents,
        filteredTorrents,
        filter,
        if (media != null) media!,
        if (entry != null) entry!,
        if (episode != null) episode!,
        isStreaming,
      ];

  @override
  String toString() {
    return [
      'DownloaderSuccess(',
      term,
      torrents.length,
      filteredTorrents.length,
      filter,
      media?.id,
      if (entry != null) entry!,
      if (episode != null) episode!,
      isStreaming,
      ')',
    ].join(', ');
  }

  DownloaderSuccess copyWith({
    String? term,
    List<NyaaTorrent>? torrents,
    List<NyaaTorrent>? filteredTorrents,
    DownloaderFilter? filter,
    Fragment$media? media,
    LibraryEntry? entry,
    int? episode,
    bool? isStreaming,
  }) {
    return DownloaderSuccess(
      term: term ?? this.term,
      torrents: torrents ?? this.torrents,
      filteredTorrents: filteredTorrents ?? this.filteredTorrents,
      filter: filter ?? this.filter,
      media: media ?? this.media,
      entry: entry ?? this.entry,
      episode: episode ?? this.episode,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }
}
