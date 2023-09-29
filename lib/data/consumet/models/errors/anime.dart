import '../anime/anime_provider.dart';

abstract class AnimeConsumetError implements Exception {
  const AnimeConsumetError({
    this.details,
  });

  final AnimeProviderName name = AnimeProviderName.unknown;
  final String? details;
}

class ZoroError extends AnimeConsumetError {
  const ZoroError({
    super.details,
  });

  @override
  AnimeProviderName get name => AnimeProviderName.zoro;
}

class GogoanimeError extends AnimeConsumetError {
  const GogoanimeError({
    super.details,
  });

  @override
  AnimeProviderName get name => AnimeProviderName.gogoanime;
}

class AnimepaheError extends AnimeConsumetError {
  const AnimepaheError({
    super.details,
  });

  @override
  AnimeProviderName get name => AnimeProviderName.animepahe;
}

class AnimefoxError extends AnimeConsumetError {
  const AnimefoxError({
    super.details,
  });

  @override
  AnimeProviderName get name => AnimeProviderName.animefox;
}
