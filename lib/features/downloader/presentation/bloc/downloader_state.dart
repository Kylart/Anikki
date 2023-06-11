part of 'downloader_bloc.dart';

abstract class DownloaderState extends Equatable {
  const DownloaderState();

  @override
  List<Object> get props => [];
}

class DownloaderClose extends DownloaderState {
  const DownloaderClose();
}

class DownloaderLoading extends DownloaderState {
  const DownloaderLoading({required this.term});

  final String term;

  @override
  List<Object> get props => [
        term,
      ];
}

class DownloaderError extends DownloaderState {
  const DownloaderError({required this.term, required this.message});

  final String message;
  final String term;

  @override
  List<Object> get props => [
        message,
        term,
      ];
}

class DownloaderSuccess extends DownloaderState {
  const DownloaderSuccess({
    required this.term,
    required this.torrents,
    required this.filteredTorrents,
    required this.filter,
    this.media,
    this.entry,
    this.episode,
  });

  /// Term used for research on Nyaa.
  final String term;

  /// All torrents found with `term`.
  final List<Torrent> torrents;

  /// [DownloaderFilter] to keep track of what filters are used for this state.
  final DownloaderFilter filter;

  /// Filtered `torrents`.
  final List<Torrent> filteredTorrents;

  /// [Fragment$shortMedia] used for this state. Used for data.
  final Fragment$shortMedia? media;

  /// [LibraryEntry] used for this state. Used for data.
  final LibraryEntry? entry;

  /// Episode number used for this state. Used for smart filtering.
  final int? episode;

  @override
  List<Object> get props => [
        term,
        torrents,
        filteredTorrents,
        filter,
        if (media != null) media!,
        if (entry != null) entry!,
        if (episode != null) episode!,
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
      ')',
    ].join(', ');
  }

  DownloaderSuccess copyWith({
    String? term,
    List<Torrent>? torrents,
    List<Torrent>? filteredTorrents,
    DownloaderFilter? filter,
    Fragment$shortMedia? media,
    LibraryEntry? entry,
    int? episode,
  }) {
    return DownloaderSuccess(
      term: term ?? this.term,
      torrents: torrents ?? this.torrents,
      filteredTorrents: filteredTorrents ?? this.filteredTorrents,
      filter: filter ?? this.filter,
      media: media ?? this.media,
      entry: entry ?? this.entry,
      episode: episode ?? this.episode,
    );
  }
}
