enum ElementCategory {
  animeSeason('anime_season', searchable: false, singular: true),
  animeSeasonPrefix('anime_season_prefix', searchable: true, singular: false),
  animeTitle('anime_title', searchable: false, singular: false),
  animeType('anime_type', searchable: true, singular: true),
  animeYear('anime_year', searchable: false, singular: false),
  audioTerm('audio_term', searchable: true, singular: true),
  deviceCompatibility(
    'device_compatibility',
    searchable: true,
    singular: true,
  ),
  episodeNumber('episode_number', searchable: false, singular: true),
  episodeNumberAlt('episode_number_alt', searchable: false, singular: false),
  episodePrefix('episode_prefix', searchable: true, singular: false),
  episodeTitle('episode_title', searchable: false, singular: false),
  fileChecksum('file_checksum', searchable: true, singular: false),
  fileExtension('file_extension', searchable: false, singular: false),
  filename('file_name', searchable: false, singular: false),
  language('language', searchable: true, singular: true),
  other('other', searchable: true, singular: true),
  releaseGroup('release_group', searchable: true, singular: false),
  releaseInformation('release_information', searchable: true, singular: true),
  releaseVersion('release_version', searchable: true, singular: false),
  source('source', searchable: true, singular: true),
  subtitles('subtitles', searchable: true, singular: false),
  videoResolution('video_resolution', searchable: true, singular: false),
  videoTerm('video_term', searchable: true, singular: true),
  volumeNumber('volume_number', searchable: false, singular: false),
  volumePrefix('volume_prefix', searchable: true, singular: false),
  unknown('unknown', searchable: false, singular: false);

  const ElementCategory(
    this.title, {
    this.searchable = false,
    this.singular = false,
  });

  final String title;
  final bool searchable;
  final bool singular;
}
