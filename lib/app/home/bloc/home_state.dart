part of 'home_bloc.dart';

enum HomeMediaType {
  following('currently following animes'),
  toStart('planned animes'),
  trending('trending animes'),
  recommendations('recommended animes');

  final String title;

  const HomeMediaType(this.title);
}

final class HomeState extends Equatable {
  const HomeState({
    this.currentMedia,
    this.entries = const [],
    this.currentBackgroundUrl,
    this.type = HomeMediaType.following,
  });

  final Media? currentMedia;
  final String? currentBackgroundUrl;
  final List<MediaListEntry> entries;
  final HomeMediaType type;

  MediaListEntry? get currentEntry => entries.firstWhereOrNull(
        (e) => e.media == currentMedia,
      );

  @override
  List<Object?> get props => [
        currentMedia,
        currentBackgroundUrl,
        entries,
        type,
      ];

  @override
  String toString() => [
        'HomeState(',
        'type: ${type.title}, ',
        'currentMedia: ${currentMedia?.title}, ',
        'currentBackgroundUrl: $currentBackgroundUrl, ',
        '${entries.length} entries',
        ')'
      ].join('');

  HomeState copyWith({
    Media? currentMedia,
    String? currentBackgroundUrl,
    List<MediaListEntry>? entries,
    HomeMediaType? type,
  }) {
    return HomeState(
      currentMedia: currentMedia ?? this.currentMedia,
      currentBackgroundUrl: currentBackgroundUrl ?? this.currentBackgroundUrl,
      entries: entries ?? this.entries,
      type: type ?? this.type,
    );
  }
}

final class HomeInitial extends HomeState {
  const HomeInitial({
    super.entries,
    super.currentBackgroundUrl,
    super.currentMedia,
    super.type = HomeMediaType.following,
  });
}

final class HomeLoading extends HomeState {
  const HomeLoading({
    super.entries,
    super.currentBackgroundUrl,
    super.currentMedia,
    super.type,
  });
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    super.entries,
    super.currentBackgroundUrl,
    super.currentMedia,
    super.type,
  });
}

final class HomeError extends HomeState {
  const HomeError({
    super.entries,
    super.currentMedia,
    super.type,
    super.currentBackgroundUrl,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        entries,
        message,
        type,
        currentBackgroundUrl,
      ];
}
