part of 'keyword.dart';

class KeywordManager {
  KeywordManager() {
    add(
      ElementCategory.animeSeasonPrefix,
      optionsUnidentifiable,
      [
        'S',
        'SAISON',
        'SEASON',
      ],
    );

    add(ElementCategory.animeType, optionsUnidentifiable, [
      'GEKIJOUBAN',
      'MOVIE',
      'OAD',
      'OAV',
      'ONA',
      'OVA',
      'SPECIAL',
      'SPECIALS',
      'TV',
    ]);

    add(ElementCategory.animeType, optionsUnidentifiableUnsearchable,
        ['SP']); // e.g. "Yumeiro Patissiere SP Professional"

    add(ElementCategory.animeType, optionsUnidentifiableInvalid,
        ['ED', 'ENDING', 'NCED', 'NCOP', 'OP', 'OPENING', 'PREVIEW', 'PV']);

    add(ElementCategory.audioTerm, optionsDefault, [
      // Audio channels
      '2.0CH', '2CH', '5.1', '5.1CH', 'DTS', 'DTS-ES', 'DTS5.1',
      'TRUEHD5.1',
      // Audio codec
      'AAC', 'AACX2', 'AACX3', 'AACX4', 'AC3', 'EAC3', 'E-AC-3',
      'FLAC', 'FLACX2', 'FLACX3', 'FLACX4', 'LOSSLESS', 'MP3', 'OGG',
      'VORBIS',
      // Audio language
      'DUALAUDIO', 'DUAL AUDIO', 'DUAL-AUDIO',
      'MULTIAUDIO', 'MULTI AUDIO', 'MULTI-AUDIO'
    ]);

    add(ElementCategory.deviceCompatibility, optionsDefault,
        ['IPAD3', 'IPHONE5', 'IPOD', 'PS3', 'XBOX', 'XBOX360']);

    add(ElementCategory.deviceCompatibility, optionsUnidentifiable,
        ['ANDROID']);

    add(ElementCategory.episodePrefix, optionsDefault, [
      'EP',
      'EP.',
      'EPS',
      'EPS.',
      'EPISODE',
      'EPISODE.',
      'EPISODES',
      'CAPITULO',
      'EPISODIO',
      'FOLGE'
    ]);

    add(
      ElementCategory.episodePrefix,
      optionsInvalid,
      // single-letter episode keywords are not valid
      ['E', '\x7B2C'],
    );

    add(ElementCategory.fileExtension, optionsDefault, [
      '3GP',
      'AVI',
      'DIVX',
      'FLV',
      'M2TS',
      'MKV',
      'MOV',
      'MP4',
      'MPG',
      'OGM',
      'RM',
      'RMVB',
      'TS',
      'WEBM',
      'WMV'
    ]);

    add(ElementCategory.fileExtension, optionsInvalid, [
      'AAC',
      'AIFF',
      'FLAC',
      'M4A',
      'MP3',
      'MKA',
      'OGG',
      'WAV',
      'WMA',
      '7Z',
      'RAR',
      'ZIP',
      'ASS',
      'SRT'
    ]);

    add(ElementCategory.language, optionsDefault,
        ['ENG', 'ENGLISH', 'ESPANOL', 'JAP', 'PT-BR', 'SPANISH', 'VOSTFR']);

    add(ElementCategory.language, optionsUnidentifiable,
        ['ESP', 'ITA']); // e.g. "Tokyo ESP", "Bokura ga Ita"

    add(ElementCategory.other, optionsDefault, [
      'REMASTER',
      'REMASTERED',
      'UNCENSORED',
      'UNCUT',
      'TS',
      'VFR',
      'WIDESCREEN',
      'WS'
    ]);

    add(ElementCategory.releaseGroup, optionsDefault, ['THORA']);

    add(ElementCategory.releaseInformation, optionsDefault,
        ['BATCH', 'COMPLETE', 'PATCH', 'REMUX']);

    add(ElementCategory.releaseInformation, optionsUnidentifiable,
        ['END', 'FINAL']); // e.g. "The End of Evangelion", "Final Approach"

    add(ElementCategory.releaseVersion, optionsDefault,
        ['V0', 'V1', 'V2', 'V3', 'V4']);

    add(ElementCategory.source, optionsDefault, [
      'BD',
      'BDRIP',
      'BLURAY',
      'BLU-RAY',
      'DVD',
      'DVD5',
      'DVD9',
      'DVD-R2J',
      'DVDRIP',
      'DVD-RIP',
      'R2DVD',
      'R2J',
      'R2JDVD',
      'R2JDVDRIP',
      'HDTV',
      'HDTVRIP',
      'TVRIP',
      'TV-RIP',
      'WEBCAST',
      'WEBRIP'
    ]);

    add(ElementCategory.subtitles, optionsDefault, [
      'ASS',
      'BIG5',
      'DUB',
      'DUBBED',
      'HARDSUB',
      'HARDSUBS',
      'RAW',
      'SOFTSUB',
      'SOFTSUBS',
      'SUB',
      'SUBBED',
      'SUBTITLED',
      'MULTIPLE SUBTITLE',
      'MULTI SUBS',
      'MULTI-SUBS'
    ]);

    add(ElementCategory.videoTerm, optionsDefault, [
      // Frame rate
      '23.976FPS', '24FPS', '29.97FPS', '30FPS', '60FPS', '120FPS',
      // Video codec
      '8BIT', '8-BIT', '10BIT', '10BITS', '10-BIT', '10-BITS',
      'HI10', 'HI10P', 'HI444', 'HI444P', 'HI444PP',
      'H264', 'H265', 'H.264', 'H.265', 'X264', 'X265', 'X.264',
      'AVC', 'HEVC', 'HEVC2', 'DIVX', 'DIVX5', 'DIVX6', 'XVID',
      // Video format
      'AVI', 'RMVB', 'WMV', 'WMV3', 'WMV9',
      // Video quality
      'HQ', 'LQ',
      // Video resolution
      'HD', 'SD'
    ]);

    add(ElementCategory.volumePrefix, optionsDefault,
        ['VOL', 'VOL.', 'VOLUME']);
  }

  final Map<String, Keyword> _keys = const {};

  final optionsDefault = const KeywordOptions();
  final optionsInvalid = const KeywordOptions(valid: false);
  final optionsUnidentifiable = const KeywordOptions(identifiable: false);
  final optionsUnidentifiableInvalid = const KeywordOptions(
    identifiable: false,
    valid: false,
  );
  final optionsUnidentifiableUnsearchable = const KeywordOptions(
    identifiable: false,
    searchable: false,
  );

  void add(
    ElementCategory category,
    KeywordOptions options,
    List<String?> keywords,
  ) {
    for (final keyword in keywords) {
      if (keyword == null || _keys.keys.contains(keyword)) continue;

      _keys[keyword] = Keyword(
        category: category,
        options: options,
      );
    }
  }

  Keyword? find(
    String string, [
    ElementCategory category = ElementCategory.unknown,
  ]) {
    if (!_keys.keys.contains(string)) return null;

    final keyword = _keys[string] as Keyword;

    if (category != ElementCategory.unknown && keyword.category != category) {
      return null;
    }

    return keyword;
  }

  List<(int, int)> peek(Elements elements, String string) {
    final result = [] as List<(int, int)>;
    final entries = [
      (ElementCategory.audioTerm, ['Dual Audio', 'Multi Audio']),
      (ElementCategory.videoTerm, ['H264', 'H.264', 'h264', 'h.264']),
      (ElementCategory.videoResolution, ['480p', '720p', '1080p']),
      (ElementCategory.subtitles, ['Multiple Subtitle', 'Multi Subs']),
      (ElementCategory.source, ['Blu-Ray']),
    ];

    for (final (category, keywords) in entries) {
      for (final keyword in keywords) {
        final beginPos = string.indexOf(keyword);

        if (beginPos == -1) continue;

        elements.insert(category, keyword);
        final endPos = beginPos + keyword.length;
        result.add((beginPos, endPos));
      }
    }

    result.sort(
      (a, b) => a.$1.compareTo(b.$1) != 0
          ? a.$1.compareTo(b.$1)
          : a.$2.compareTo(b.$2),
    );

    return result;
  }

  String normalize(String input) {
    /// TODO when internet available
    ///
    // def normalize(string):
    //     // Remove accents and other special symbols
    //     nfkd = ud.normalize('NFKD', string)
    //     without_accents = ''.join([c for c in nfkd if not ud.combining(c)])

    //     return without_accents.upper()
    return input;
  }
}
