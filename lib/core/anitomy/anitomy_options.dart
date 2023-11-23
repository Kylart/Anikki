import 'dart:convert';
import 'package:equatable/equatable.dart';

class AnitomyOptions extends Equatable {
  const AnitomyOptions({
    required this.allowedDelimiters,
    required this.ignoredStrings,
    required this.parseEpisodeNumber,
    required this.parseEpisodeTitle,
    required this.parseFileExtension,
    required this.parseReleaseGroup,
  });

  final String allowedDelimiters;
  final List<String> ignoredStrings;
  final bool parseEpisodeNumber;
  final bool parseEpisodeTitle;
  final bool parseFileExtension;
  final bool parseReleaseGroup;

  @override
  List<Object> get props {
    return [
      allowedDelimiters,
      ignoredStrings,
      parseEpisodeNumber,
      parseEpisodeTitle,
      parseFileExtension,
      parseReleaseGroup,
    ];
  }

  @override
  bool get stringify => true;

  static const defaults = AnitomyOptions(
    allowedDelimiters: '_.&+,|',
    ignoredStrings: [],
    parseEpisodeNumber: true,
    parseEpisodeTitle: true,
    parseFileExtension: true,
    parseReleaseGroup: true,
  );

  AnitomyOptions copyWith({
    String? allowedDelimiters,
    List<String>? ignoredStrings,
    bool? parseEpisodeNumber,
    bool? parseEpisodeTitle,
    bool? parseFileExtension,
    bool? parseReleaseGroup,
  }) {
    return AnitomyOptions(
      allowedDelimiters: allowedDelimiters ?? this.allowedDelimiters,
      ignoredStrings: ignoredStrings ?? this.ignoredStrings,
      parseEpisodeNumber: parseEpisodeNumber ?? this.parseEpisodeNumber,
      parseEpisodeTitle: parseEpisodeTitle ?? this.parseEpisodeTitle,
      parseFileExtension: parseFileExtension ?? this.parseFileExtension,
      parseReleaseGroup: parseReleaseGroup ?? this.parseReleaseGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allowedDelimiters': allowedDelimiters,
      'ignoredStrings': ignoredStrings,
      'parseEpisodeNumber': parseEpisodeNumber,
      'parseEpisodeTitle': parseEpisodeTitle,
      'parseFileExtension': parseFileExtension,
      'parseReleaseGroup': parseReleaseGroup,
    };
  }

  factory AnitomyOptions.fromMap(Map<String, dynamic> map) {
    return AnitomyOptions(
      allowedDelimiters: map['allowedDelimiters'] as String,
      ignoredStrings: List<String>.from(
        (map['ignoredStrings'] as List<String>),
      ),
      parseEpisodeNumber: map['parseEpisodeNumber'] as bool,
      parseEpisodeTitle: map['parseEpisodeTitle'] as bool,
      parseFileExtension: map['parseFileExtension'] as bool,
      parseReleaseGroup: map['parseReleaseGroup'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnitomyOptions.fromJson(String source) =>
      AnitomyOptions.fromMap(json.decode(source) as Map<String, dynamic>);
}
