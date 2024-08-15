part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.currentMedia,
    this.entries = const [],
    this.medias = const [],
  });

  final Media? currentMedia;
  final List<MediaListEntry> entries;
  final List<Media> medias;

  @override
  List<Object?> get props => [
        currentMedia,
        entries,
        medias,
      ];

  @override
  String toString() => [
        'HomeState(',
        'currentMedia: ${currentMedia?.title}, ',
        '${entries.length} entries, ',
        '${medias.length} medias',
        ')'
      ].join('');

  HomeState copyWith({
    Media? currentMedia,
    List<MediaListEntry>? entries,
    List<Media>? medias,
  }) {
    return HomeState(
      currentMedia: currentMedia ?? this.currentMedia,
      entries: entries ?? this.entries,
      medias: medias ?? this.medias,
    );
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  const HomeLoading({
    super.entries,
    super.medias,
  });
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    super.entries,
    super.medias,
  });
}

final class HomeError extends HomeState {
  const HomeError({
    super.entries,
    super.medias,
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [
        entries,
        message,
        medias,
      ];
}
