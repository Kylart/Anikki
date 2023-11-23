import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnitomyResult extends Equatable {
  const AnitomyResult({
    this.animeSeason,
    this.animeSeasonPrefix,
    this.animeTitle,
    this.animeType,
    this.animeYear,
    this.audioTerm,
    this.deviceCompatibility,
    this.episodeNumber,
    this.episodeNumberAlt,
    this.episodePrefix,
    this.episodeTitle,
    this.fileChecksum,
    this.fileExtension,
    this.fileName,
    this.language,
    this.other,
    this.releaseGroup,
    this.releaseInformation,
    this.releaseVersion,
    this.source,
    this.subtitles,
    this.videoResolution,
    this.videoTerm,
    this.volumeNumber,
    this.volumePrefix,
    this.unknown,
  });

  final String? animeSeason;
  final String? animeSeasonPrefix;
  final String? animeTitle;
  final String? animeType;
  final String? animeYear;
  final String? audioTerm;
  final String? deviceCompatibility;
  final String? episodeNumber;
  final String? episodeNumberAlt;
  final String? episodePrefix;
  final String? episodeTitle;
  final String? fileChecksum;
  final String? fileExtension;
  final String? fileName;
  final String? language;
  final String? other;
  final String? releaseGroup;
  final String? releaseInformation;
  final String? releaseVersion;
  final String? source;
  final String? subtitles;
  final String? videoResolution;
  final String? videoTerm;
  final String? volumeNumber;
  final String? volumePrefix;
  final String? unknown;

  @override
  List<Object?> get props {
    return [
      animeSeason,
      animeSeasonPrefix,
      animeTitle,
      animeType,
      animeYear,
      audioTerm,
      deviceCompatibility,
      episodeNumber,
      episodeNumberAlt,
      episodePrefix,
      episodeTitle,
      fileChecksum,
      fileExtension,
      fileName,
      language,
      other,
      releaseGroup,
      releaseInformation,
      releaseVersion,
      source,
      subtitles,
      videoResolution,
      videoTerm,
      volumeNumber,
      volumePrefix,
      unknown,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'animeSeason': animeSeason,
      'animeSeasonPrefix': animeSeasonPrefix,
      'animeTitle': animeTitle,
      'animeType': animeType,
      'animeYear': animeYear,
      'audioTerm': audioTerm,
      'deviceCompatibility': deviceCompatibility,
      'episodeNumber': episodeNumber,
      'episodeNumberAlt': episodeNumberAlt,
      'episodePrefix': episodePrefix,
      'episodeTitle': episodeTitle,
      'fileChecksum': fileChecksum,
      'fileExtension': fileExtension,
      'fileName': fileName,
      'language': language,
      'other': other,
      'releaseGroup': releaseGroup,
      'releaseInformation': releaseInformation,
      'releaseVersion': releaseVersion,
      'source': source,
      'subtitles': subtitles,
      'videoResolution': videoResolution,
      'videoTerm': videoTerm,
      'volumeNumber': volumeNumber,
      'volumePrefix': volumePrefix,
      'unknown': unknown,
    };
  }

  factory AnitomyResult.fromMap(Map<String, dynamic> map) {
    return AnitomyResult(
      animeSeason:
          map['animeSeason'] != null ? map['animeSeason'] as String : null,
      animeSeasonPrefix: map['animeSeasonPrefix'] != null
          ? map['animeSeasonPrefix'] as String
          : null,
      animeTitle:
          map['animeTitle'] != null ? map['animeTitle'] as String : null,
      animeType: map['animeType'] != null ? map['animeType'] as String : null,
      animeYear: map['animeYear'] != null ? map['animeYear'] as String : null,
      audioTerm: map['audioTerm'] != null ? map['audioTerm'] as String : null,
      deviceCompatibility: map['deviceCompatibility'] != null
          ? map['deviceCompatibility'] as String
          : null,
      episodeNumber:
          map['episodeNumber'] != null ? map['episodeNumber'] as String : null,
      episodeNumberAlt: map['episodeNumberAlt'] != null
          ? map['episodeNumberAlt'] as String
          : null,
      episodePrefix:
          map['episodePrefix'] != null ? map['episodePrefix'] as String : null,
      episodeTitle:
          map['episodeTitle'] != null ? map['episodeTitle'] as String : null,
      fileChecksum:
          map['fileChecksum'] != null ? map['fileChecksum'] as String : null,
      fileExtension:
          map['fileExtension'] != null ? map['fileExtension'] as String : null,
      fileName: map['fileName'] != null ? map['fileName'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      other: map['other'] != null ? map['other'] as String : null,
      releaseGroup:
          map['releaseGroup'] != null ? map['releaseGroup'] as String : null,
      releaseInformation: map['releaseInformation'] != null
          ? map['releaseInformation'] as String
          : null,
      releaseVersion: map['releaseVersion'] != null
          ? map['releaseVersion'] as String
          : null,
      source: map['source'] != null ? map['source'] as String : null,
      subtitles: map['subtitles'] != null ? map['subtitles'] as String : null,
      videoResolution: map['videoResolution'] != null
          ? map['videoResolution'] as String
          : null,
      videoTerm: map['videoTerm'] != null ? map['videoTerm'] as String : null,
      volumeNumber:
          map['volumeNumber'] != null ? map['volumeNumber'] as String : null,
      volumePrefix:
          map['volumePrefix'] != null ? map['volumePrefix'] as String : null,
      unknown: map['unknown'] != null ? map['unknown'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnitomyResult.fromJson(String source) =>
      AnitomyResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  AnitomyResult copyWith({
    String? animeSeason,
    String? animeSeasonPrefix,
    String? animeTitle,
    String? animeType,
    String? animeYear,
    String? audioTerm,
    String? deviceCompatibility,
    String? episodeNumber,
    String? episodeNumberAlt,
    String? episodePrefix,
    String? episodeTitle,
    String? fileChecksum,
    String? fileExtension,
    String? fileName,
    String? language,
    String? other,
    String? releaseGroup,
    String? releaseInformation,
    String? releaseVersion,
    String? source,
    String? subtitles,
    String? videoResolution,
    String? videoTerm,
    String? volumeNumber,
    String? volumePrefix,
    String? unknown,
  }) {
    return AnitomyResult(
      animeSeason: animeSeason ?? this.animeSeason,
      animeSeasonPrefix: animeSeasonPrefix ?? this.animeSeasonPrefix,
      animeTitle: animeTitle ?? this.animeTitle,
      animeType: animeType ?? this.animeType,
      animeYear: animeYear ?? this.animeYear,
      audioTerm: audioTerm ?? this.audioTerm,
      deviceCompatibility: deviceCompatibility ?? this.deviceCompatibility,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      episodeNumberAlt: episodeNumberAlt ?? this.episodeNumberAlt,
      episodePrefix: episodePrefix ?? this.episodePrefix,
      episodeTitle: episodeTitle ?? this.episodeTitle,
      fileChecksum: fileChecksum ?? this.fileChecksum,
      fileExtension: fileExtension ?? this.fileExtension,
      fileName: fileName ?? this.fileName,
      language: language ?? this.language,
      other: other ?? this.other,
      releaseGroup: releaseGroup ?? this.releaseGroup,
      releaseInformation: releaseInformation ?? this.releaseInformation,
      releaseVersion: releaseVersion ?? this.releaseVersion,
      source: source ?? this.source,
      subtitles: subtitles ?? this.subtitles,
      videoResolution: videoResolution ?? this.videoResolution,
      videoTerm: videoTerm ?? this.videoTerm,
      volumeNumber: volumeNumber ?? this.volumeNumber,
      volumePrefix: volumePrefix ?? this.volumePrefix,
      unknown: unknown ?? this.unknown,
    );
  }
}
