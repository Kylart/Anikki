class TmdbGenre {
  TmdbGenre({required this.id, required this.name});

  final int id;
  final String name;
}

/// Retrievable at https://developer.themoviedb.org/reference/genre-tv-list
final tmdbTvGenreList = <TmdbGenre>[
  TmdbGenre(id: 10759, name: 'Action & Adventure'),
  TmdbGenre(id: 16, name: 'Animation'),
  TmdbGenre(id: 35, name: 'Comedy'),
  TmdbGenre(id: 80, name: 'Crime'),
  TmdbGenre(id: 99, name: 'Documentary'),
  TmdbGenre(id: 18, name: 'Drama'),
  TmdbGenre(id: 10751, name: 'Family'),
  TmdbGenre(id: 10762, name: 'Kids'),
  TmdbGenre(id: 9648, name: 'Mystery'),
  TmdbGenre(id: 10763, name: 'News'),
  TmdbGenre(id: 10764, name: 'Reality'),
  TmdbGenre(id: 10765, name: 'Sci-Fi & Fantasy'),
  TmdbGenre(id: 10766, name: 'Soap'),
  TmdbGenre(id: 10767, name: 'Talk'),
  TmdbGenre(id: 10768, name: 'War & Politics'),
  TmdbGenre(id: 37, name: 'Western'),
];
