part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.currentMedia,
    this.drawerMedia,
    this.entries = const [],
    this.currentBackgroundUrl,
  });

  final Media? drawerMedia;
  final Media? currentMedia;
  final String? currentBackgroundUrl;
  final List<MediaListEntry> entries;

  MediaListEntry? get currentEntry => entries.firstWhereOrNull(
        (e) => e.media == currentMedia,
      );

  @override
  List<Object?> get props => [
        drawerMedia,
        currentMedia,
        currentBackgroundUrl,
        entries,
      ];

  @override
  String toString() => [
        'HomeState(',
        'currentMedia: ${currentMedia?.title}, ',
        'drawerMedia: ${drawerMedia?.title}, ',
        'currentBackgroundUrl: $currentBackgroundUrl, ',
        '${entries.length} entries',
        ')'
      ].join('');

  HomeState copyWith({
    Media? drawerMedia,
    Media? currentMedia,
    String? currentBackgroundUrl,
    List<MediaListEntry>? entries,
  }) {
    return HomeState(
      currentMedia: currentMedia ?? this.currentMedia,
      drawerMedia: drawerMedia ?? this.drawerMedia,
      currentBackgroundUrl: currentBackgroundUrl ?? this.currentBackgroundUrl,
      entries: entries ?? this.entries,
    );
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  const HomeLoading({
    super.entries,
    super.currentBackgroundUrl,
    super.currentMedia,
    super.drawerMedia,
  });
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    super.entries,
    super.currentBackgroundUrl,
    super.currentMedia,
    super.drawerMedia,
  });
}

final class HomeError extends HomeState {
  const HomeError({
    super.entries,
    super.currentMedia,
    super.drawerMedia,
    super.currentBackgroundUrl,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        entries,
        message,
        currentBackgroundUrl,
      ];
}
