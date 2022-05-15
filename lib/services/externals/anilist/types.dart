class Title {
  Title({
    this.userPreferred,
    this.japanese,
    this.romaji,
    this.en,
  });

  String? userPreferred;
  String? japanese;
  String? romaji;
  String? en;

  factory Title.fromJson(Map<String, dynamic>? json) {
    return Title(
      userPreferred: json?['userPreferred'],
      japanese: json?['japanese'],
      romaji: json?['romaji'],
      en: json?['en'],
    );
  }
}

class Date {
  Date({
    required this.year,
    required this.month,
    required this.day,
  });

  int? year = 0000;
  int? month = 00;
  int? day = 00;

  String get formated => '$year-$month-$day';
  bool get isOk => year != null && month != null && day != null;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      year: json['year'],
      month: json['month'],
      day: json['day'],
    );
  }
}

class NextAiringEpisode {
  NextAiringEpisode({
    this.airingAt,
    this.timeUntilAiring,
    this.episode,
  });

  int? airingAt;
  int? timeUntilAiring;
  int? episode;

  factory NextAiringEpisode.fromJson(Map<String, dynamic>? json) {
    return NextAiringEpisode(
      airingAt: json?['airingAt'],
      timeUntilAiring: json?['timeUntilAiring'],
      episode: json?['episode'],
    );
  }
}

class Studio {
  Studio({
    this.isMain,
    this.id,
    this.name,
  });

  bool? isMain;
  int? id;
  String? name;

  factory Studio.fromJson(Map<String, dynamic>? json) {
    return Studio(
      isMain: json?['isMain'],
      id: json?['node']['id'],
      name: json?['node']['name'],
    );
  }
}

enum Season { WINTER, SPRING, SUMMER, FALL, UNKNOWN }

enum Type { ANIME, MANGA, UNKNOWN }

enum Format { TV, ONA, OVA, MOVIE, UNKNOWN }

enum Status { RELEASING, NOT_YET_RELEASED, FINISHED, UNKNOWN }

String getBestImage(image) {
  if (image['extraLarge'] != null) return image['extraLarge'];
  if (image['large'] != null) return image['large'];
  if (image['medium'] != null) return image['medium'];

  return 'None';
}

class Media {
  Media({
    required this.id,
    this.title,
    this.type,
    this.format,
    this.episodes,
    this.duration,
    this.genres,
    this.isAdult,
    this.status,
    this.averageScore,
    this.popularity,
    this.nextAiringEpisode,
    this.studios,
    this.season,
    this.description,
    this.endDate,
    this.startDate,
    this.coverImage,
    this.bannerImage,
  });

  int id;
  Title? title;
  Type? type = Type.UNKNOWN;
  Format? format = Format.UNKNOWN;
  int? episodes = 0;
  int? duration = 0;
  List<Object?>? genres = [];
  bool? isAdult = false;
  Status? status = Status.UNKNOWN;

  int? averageScore = -1;
  int? popularity = -1;

  NextAiringEpisode? nextAiringEpisode;

  List<Studio>? studios = [];

  Season? season = Season.UNKNOWN;

  String? description = 'No description supplied.';

  Date? endDate = Date(year: 0000, month: 00, day: 00);
  Date? startDate = Date(year: 0000, month: 00, day: 00);

  String? coverImage;
  String? bannerImage;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      title: Title.fromJson(json['title']),
      type: Type.values.firstWhere(
          (e) => e.toString() == 'Type.' + json['type'],
          orElse: () => Type.UNKNOWN),
      format: Format.values.firstWhere(
          (e) => e.toString() == 'Format.' + json['format'],
          orElse: () => Format.UNKNOWN),
      episodes: json['episodes'],
      duration: json['duration'],
      genres: (json['genres'] as List<dynamic>)
          .map((genre) => genre.toString())
          .toList(),
      isAdult: json['isAdult'],
      status: Status.values.firstWhere(
          (e) => e.toString() == 'Status.' + json['status'],
          orElse: () => Status.UNKNOWN),
      averageScore: json['averageScore'],
      popularity: json['popularity'],
      nextAiringEpisode: NextAiringEpisode.fromJson(json['nextAiringEpisode']),
      studios: json['studios'] == null
          ? []
          : (json['studios']['edges'] as List<dynamic>)
              .map((studio) => Studio.fromJson(studio))
              .toList(),
      season: json['season'] == null
          ? Season.UNKNOWN
          : Season.values.firstWhere(
              (e) => e.toString() == 'Season.' + json['season'],
              orElse: () => Season.UNKNOWN),
      description: json['description'],
      endDate: json['endDate'] == null
          ? Date(year: 0, month: 0, day: 0)
          : Date.fromJson(json['endDate']),
      startDate: json['startDate'] == null
          ? Date(year: 0, month: 0, day: 0)
          : Date.fromJson(json['startDate']),
      coverImage: getBestImage(json['coverImage']),
      bannerImage: json['bannerImage'],
    );
  }
}
