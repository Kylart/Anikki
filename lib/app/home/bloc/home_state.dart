part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.bannerMedia,
    this.drawerMedia,
    this.drawerLibraryEntry,
  });

  final Media? bannerMedia;

  final Media? drawerMedia;
  final LibraryEntry? drawerLibraryEntry;

  @override
  List<Object?> get props => [
        bannerMedia,
        drawerMedia,
        drawerLibraryEntry,
      ];

  HomeState copyWith({
    Media? bannerMedia,
    Media? drawerMedia,
    LibraryEntry? drawerLibraryEntry,
  }) {
    return HomeState(
      bannerMedia: bannerMedia ?? this.bannerMedia,
      drawerMedia: drawerMedia ?? this.drawerMedia,
      drawerLibraryEntry: drawerLibraryEntry ?? this.drawerLibraryEntry,
    );
  }
}
