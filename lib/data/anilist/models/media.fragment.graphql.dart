import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.graphql.dart';

class Fragment$media {
  Fragment$media({
    this.siteUrl,
    required this.id,
    this.season,
    this.seasonYear,
    this.status,
    this.title,
    this.coverImage,
    this.startDate,
    this.endDate,
    this.bannerImage,
    this.description,
    this.type,
    this.format,
    this.episodes,
    this.duration,
    this.chapters,
    this.volumes,
    this.genres,
    this.isAdult,
    this.synonyms,
    this.averageScore,
    this.popularity,
    this.countryOfOrigin,
    this.mediaListEntry,
    this.nextAiringEpisode,
    this.studios,
    this.relations,
    this.$__typename = 'Media',
  });

  factory Fragment$media.fromJson(Map<String, dynamic> json) {
    final l$siteUrl = json['siteUrl'];
    final l$id = json['id'];
    final l$season = json['season'];
    final l$seasonYear = json['seasonYear'];
    final l$status = json['status'];
    final l$title = json['title'];
    final l$coverImage = json['coverImage'];
    final l$startDate = json['startDate'];
    final l$endDate = json['endDate'];
    final l$bannerImage = json['bannerImage'];
    final l$description = json['description'];
    final l$type = json['type'];
    final l$format = json['format'];
    final l$episodes = json['episodes'];
    final l$duration = json['duration'];
    final l$chapters = json['chapters'];
    final l$volumes = json['volumes'];
    final l$genres = json['genres'];
    final l$isAdult = json['isAdult'];
    final l$synonyms = json['synonyms'];
    final l$averageScore = json['averageScore'];
    final l$popularity = json['popularity'];
    final l$countryOfOrigin = json['countryOfOrigin'];
    final l$mediaListEntry = json['mediaListEntry'];
    final l$nextAiringEpisode = json['nextAiringEpisode'];
    final l$studios = json['studios'];
    final l$relations = json['relations'];
    final l$$__typename = json['__typename'];
    return Fragment$media(
      siteUrl: (l$siteUrl as String?),
      id: (l$id as int),
      season: l$season == null
          ? null
          : fromJson$Enum$MediaSeason((l$season as String)),
      seasonYear: (l$seasonYear as int?),
      status: l$status == null
          ? null
          : fromJson$Enum$MediaStatus((l$status as String)),
      title: l$title == null
          ? null
          : Fragment$media$title.fromJson((l$title as Map<String, dynamic>)),
      coverImage: l$coverImage == null
          ? null
          : Fragment$media$coverImage.fromJson(
              (l$coverImage as Map<String, dynamic>)),
      startDate: l$startDate == null
          ? null
          : Fragment$media$startDate.fromJson(
              (l$startDate as Map<String, dynamic>)),
      endDate: l$endDate == null
          ? null
          : Fragment$media$endDate.fromJson(
              (l$endDate as Map<String, dynamic>)),
      bannerImage: (l$bannerImage as String?),
      description: (l$description as String?),
      type: l$type == null ? null : fromJson$Enum$MediaType((l$type as String)),
      format: l$format == null
          ? null
          : fromJson$Enum$MediaFormat((l$format as String)),
      episodes: (l$episodes as int?),
      duration: (l$duration as int?),
      chapters: (l$chapters as int?),
      volumes: (l$volumes as int?),
      genres: (l$genres as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      isAdult: (l$isAdult as bool?),
      synonyms:
          (l$synonyms as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      averageScore: (l$averageScore as int?),
      popularity: (l$popularity as int?),
      countryOfOrigin: (l$countryOfOrigin as String?),
      mediaListEntry: l$mediaListEntry == null
          ? null
          : Fragment$media$mediaListEntry.fromJson(
              (l$mediaListEntry as Map<String, dynamic>)),
      nextAiringEpisode: l$nextAiringEpisode == null
          ? null
          : Fragment$media$nextAiringEpisode.fromJson(
              (l$nextAiringEpisode as Map<String, dynamic>)),
      studios: l$studios == null
          ? null
          : Fragment$media$studios.fromJson(
              (l$studios as Map<String, dynamic>)),
      relations: l$relations == null
          ? null
          : Fragment$media$relations.fromJson(
              (l$relations as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? siteUrl;

  final int id;

  final Enum$MediaSeason? season;

  final int? seasonYear;

  final Enum$MediaStatus? status;

  final Fragment$media$title? title;

  final Fragment$media$coverImage? coverImage;

  final Fragment$media$startDate? startDate;

  final Fragment$media$endDate? endDate;

  final String? bannerImage;

  final String? description;

  final Enum$MediaType? type;

  final Enum$MediaFormat? format;

  final int? episodes;

  final int? duration;

  final int? chapters;

  final int? volumes;

  final List<String?>? genres;

  final bool? isAdult;

  final List<String?>? synonyms;

  final int? averageScore;

  final int? popularity;

  final String? countryOfOrigin;

  final Fragment$media$mediaListEntry? mediaListEntry;

  final Fragment$media$nextAiringEpisode? nextAiringEpisode;

  final Fragment$media$studios? studios;

  final Fragment$media$relations? relations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$siteUrl = siteUrl;
    _resultData['siteUrl'] = l$siteUrl;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$season = season;
    _resultData['season'] =
        l$season == null ? null : toJson$Enum$MediaSeason(l$season);
    final l$seasonYear = seasonYear;
    _resultData['seasonYear'] = l$seasonYear;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$MediaStatus(l$status);
    final l$title = title;
    _resultData['title'] = l$title?.toJson();
    final l$coverImage = coverImage;
    _resultData['coverImage'] = l$coverImage?.toJson();
    final l$startDate = startDate;
    _resultData['startDate'] = l$startDate?.toJson();
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate?.toJson();
    final l$bannerImage = bannerImage;
    _resultData['bannerImage'] = l$bannerImage;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$type = type;
    _resultData['type'] = l$type == null ? null : toJson$Enum$MediaType(l$type);
    final l$format = format;
    _resultData['format'] =
        l$format == null ? null : toJson$Enum$MediaFormat(l$format);
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes;
    final l$duration = duration;
    _resultData['duration'] = l$duration;
    final l$chapters = chapters;
    _resultData['chapters'] = l$chapters;
    final l$volumes = volumes;
    _resultData['volumes'] = l$volumes;
    final l$genres = genres;
    _resultData['genres'] = l$genres?.map((e) => e).toList();
    final l$isAdult = isAdult;
    _resultData['isAdult'] = l$isAdult;
    final l$synonyms = synonyms;
    _resultData['synonyms'] = l$synonyms?.map((e) => e).toList();
    final l$averageScore = averageScore;
    _resultData['averageScore'] = l$averageScore;
    final l$popularity = popularity;
    _resultData['popularity'] = l$popularity;
    final l$countryOfOrigin = countryOfOrigin;
    _resultData['countryOfOrigin'] = l$countryOfOrigin;
    final l$mediaListEntry = mediaListEntry;
    _resultData['mediaListEntry'] = l$mediaListEntry?.toJson();
    final l$nextAiringEpisode = nextAiringEpisode;
    _resultData['nextAiringEpisode'] = l$nextAiringEpisode?.toJson();
    final l$studios = studios;
    _resultData['studios'] = l$studios?.toJson();
    final l$relations = relations;
    _resultData['relations'] = l$relations?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$siteUrl = siteUrl;
    final l$id = id;
    final l$season = season;
    final l$seasonYear = seasonYear;
    final l$status = status;
    final l$title = title;
    final l$coverImage = coverImage;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$bannerImage = bannerImage;
    final l$description = description;
    final l$type = type;
    final l$format = format;
    final l$episodes = episodes;
    final l$duration = duration;
    final l$chapters = chapters;
    final l$volumes = volumes;
    final l$genres = genres;
    final l$isAdult = isAdult;
    final l$synonyms = synonyms;
    final l$averageScore = averageScore;
    final l$popularity = popularity;
    final l$countryOfOrigin = countryOfOrigin;
    final l$mediaListEntry = mediaListEntry;
    final l$nextAiringEpisode = nextAiringEpisode;
    final l$studios = studios;
    final l$relations = relations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$siteUrl,
      l$id,
      l$season,
      l$seasonYear,
      l$status,
      l$title,
      l$coverImage,
      l$startDate,
      l$endDate,
      l$bannerImage,
      l$description,
      l$type,
      l$format,
      l$episodes,
      l$duration,
      l$chapters,
      l$volumes,
      l$genres == null ? null : Object.hashAll(l$genres.map((v) => v)),
      l$isAdult,
      l$synonyms == null ? null : Object.hashAll(l$synonyms.map((v) => v)),
      l$averageScore,
      l$popularity,
      l$countryOfOrigin,
      l$mediaListEntry,
      l$nextAiringEpisode,
      l$studios,
      l$relations,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$siteUrl = siteUrl;
    final lOther$siteUrl = other.siteUrl;
    if (l$siteUrl != lOther$siteUrl) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    final l$seasonYear = seasonYear;
    final lOther$seasonYear = other.seasonYear;
    if (l$seasonYear != lOther$seasonYear) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$coverImage = coverImage;
    final lOther$coverImage = other.coverImage;
    if (l$coverImage != lOther$coverImage) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$bannerImage = bannerImage;
    final lOther$bannerImage = other.bannerImage;
    if (l$bannerImage != lOther$bannerImage) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$format = format;
    final lOther$format = other.format;
    if (l$format != lOther$format) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
      return false;
    }
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) {
      return false;
    }
    final l$chapters = chapters;
    final lOther$chapters = other.chapters;
    if (l$chapters != lOther$chapters) {
      return false;
    }
    final l$volumes = volumes;
    final lOther$volumes = other.volumes;
    if (l$volumes != lOther$volumes) {
      return false;
    }
    final l$genres = genres;
    final lOther$genres = other.genres;
    if (l$genres != null && lOther$genres != null) {
      if (l$genres.length != lOther$genres.length) {
        return false;
      }
      for (int i = 0; i < l$genres.length; i++) {
        final l$genres$entry = l$genres[i];
        final lOther$genres$entry = lOther$genres[i];
        if (l$genres$entry != lOther$genres$entry) {
          return false;
        }
      }
    } else if (l$genres != lOther$genres) {
      return false;
    }
    final l$isAdult = isAdult;
    final lOther$isAdult = other.isAdult;
    if (l$isAdult != lOther$isAdult) {
      return false;
    }
    final l$synonyms = synonyms;
    final lOther$synonyms = other.synonyms;
    if (l$synonyms != null && lOther$synonyms != null) {
      if (l$synonyms.length != lOther$synonyms.length) {
        return false;
      }
      for (int i = 0; i < l$synonyms.length; i++) {
        final l$synonyms$entry = l$synonyms[i];
        final lOther$synonyms$entry = lOther$synonyms[i];
        if (l$synonyms$entry != lOther$synonyms$entry) {
          return false;
        }
      }
    } else if (l$synonyms != lOther$synonyms) {
      return false;
    }
    final l$averageScore = averageScore;
    final lOther$averageScore = other.averageScore;
    if (l$averageScore != lOther$averageScore) {
      return false;
    }
    final l$popularity = popularity;
    final lOther$popularity = other.popularity;
    if (l$popularity != lOther$popularity) {
      return false;
    }
    final l$countryOfOrigin = countryOfOrigin;
    final lOther$countryOfOrigin = other.countryOfOrigin;
    if (l$countryOfOrigin != lOther$countryOfOrigin) {
      return false;
    }
    final l$mediaListEntry = mediaListEntry;
    final lOther$mediaListEntry = other.mediaListEntry;
    if (l$mediaListEntry != lOther$mediaListEntry) {
      return false;
    }
    final l$nextAiringEpisode = nextAiringEpisode;
    final lOther$nextAiringEpisode = other.nextAiringEpisode;
    if (l$nextAiringEpisode != lOther$nextAiringEpisode) {
      return false;
    }
    final l$studios = studios;
    final lOther$studios = other.studios;
    if (l$studios != lOther$studios) {
      return false;
    }
    final l$relations = relations;
    final lOther$relations = other.relations;
    if (l$relations != lOther$relations) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media on Fragment$media {
  CopyWith$Fragment$media<Fragment$media> get copyWith =>
      CopyWith$Fragment$media(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media<TRes> {
  factory CopyWith$Fragment$media(
    Fragment$media instance,
    TRes Function(Fragment$media) then,
  ) = _CopyWithImpl$Fragment$media;

  factory CopyWith$Fragment$media.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media;

  TRes call({
    String? siteUrl,
    int? id,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    Fragment$media$title? title,
    Fragment$media$coverImage? coverImage,
    Fragment$media$startDate? startDate,
    Fragment$media$endDate? endDate,
    String? bannerImage,
    String? description,
    Enum$MediaType? type,
    Enum$MediaFormat? format,
    int? episodes,
    int? duration,
    int? chapters,
    int? volumes,
    List<String?>? genres,
    bool? isAdult,
    List<String?>? synonyms,
    int? averageScore,
    int? popularity,
    String? countryOfOrigin,
    Fragment$media$mediaListEntry? mediaListEntry,
    Fragment$media$nextAiringEpisode? nextAiringEpisode,
    Fragment$media$studios? studios,
    Fragment$media$relations? relations,
    String? $__typename,
  });
  CopyWith$Fragment$media$title<TRes> get title;
  CopyWith$Fragment$media$coverImage<TRes> get coverImage;
  CopyWith$Fragment$media$startDate<TRes> get startDate;
  CopyWith$Fragment$media$endDate<TRes> get endDate;
  CopyWith$Fragment$media$mediaListEntry<TRes> get mediaListEntry;
  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode;
  CopyWith$Fragment$media$studios<TRes> get studios;
  CopyWith$Fragment$media$relations<TRes> get relations;
}

class _CopyWithImpl$Fragment$media<TRes>
    implements CopyWith$Fragment$media<TRes> {
  _CopyWithImpl$Fragment$media(
    this._instance,
    this._then,
  );

  final Fragment$media _instance;

  final TRes Function(Fragment$media) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? siteUrl = _undefined,
    Object? id = _undefined,
    Object? season = _undefined,
    Object? seasonYear = _undefined,
    Object? status = _undefined,
    Object? title = _undefined,
    Object? coverImage = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? bannerImage = _undefined,
    Object? description = _undefined,
    Object? type = _undefined,
    Object? format = _undefined,
    Object? episodes = _undefined,
    Object? duration = _undefined,
    Object? chapters = _undefined,
    Object? volumes = _undefined,
    Object? genres = _undefined,
    Object? isAdult = _undefined,
    Object? synonyms = _undefined,
    Object? averageScore = _undefined,
    Object? popularity = _undefined,
    Object? countryOfOrigin = _undefined,
    Object? mediaListEntry = _undefined,
    Object? nextAiringEpisode = _undefined,
    Object? studios = _undefined,
    Object? relations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media(
        siteUrl:
            siteUrl == _undefined ? _instance.siteUrl : (siteUrl as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        season: season == _undefined
            ? _instance.season
            : (season as Enum$MediaSeason?),
        seasonYear: seasonYear == _undefined
            ? _instance.seasonYear
            : (seasonYear as int?),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$MediaStatus?),
        title: title == _undefined
            ? _instance.title
            : (title as Fragment$media$title?),
        coverImage: coverImage == _undefined
            ? _instance.coverImage
            : (coverImage as Fragment$media$coverImage?),
        startDate: startDate == _undefined
            ? _instance.startDate
            : (startDate as Fragment$media$startDate?),
        endDate: endDate == _undefined
            ? _instance.endDate
            : (endDate as Fragment$media$endDate?),
        bannerImage: bannerImage == _undefined
            ? _instance.bannerImage
            : (bannerImage as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        type: type == _undefined ? _instance.type : (type as Enum$MediaType?),
        format: format == _undefined
            ? _instance.format
            : (format as Enum$MediaFormat?),
        episodes:
            episodes == _undefined ? _instance.episodes : (episodes as int?),
        duration:
            duration == _undefined ? _instance.duration : (duration as int?),
        chapters:
            chapters == _undefined ? _instance.chapters : (chapters as int?),
        volumes: volumes == _undefined ? _instance.volumes : (volumes as int?),
        genres: genres == _undefined
            ? _instance.genres
            : (genres as List<String?>?),
        isAdult: isAdult == _undefined ? _instance.isAdult : (isAdult as bool?),
        synonyms: synonyms == _undefined
            ? _instance.synonyms
            : (synonyms as List<String?>?),
        averageScore: averageScore == _undefined
            ? _instance.averageScore
            : (averageScore as int?),
        popularity: popularity == _undefined
            ? _instance.popularity
            : (popularity as int?),
        countryOfOrigin: countryOfOrigin == _undefined
            ? _instance.countryOfOrigin
            : (countryOfOrigin as String?),
        mediaListEntry: mediaListEntry == _undefined
            ? _instance.mediaListEntry
            : (mediaListEntry as Fragment$media$mediaListEntry?),
        nextAiringEpisode: nextAiringEpisode == _undefined
            ? _instance.nextAiringEpisode
            : (nextAiringEpisode as Fragment$media$nextAiringEpisode?),
        studios: studios == _undefined
            ? _instance.studios
            : (studios as Fragment$media$studios?),
        relations: relations == _undefined
            ? _instance.relations
            : (relations as Fragment$media$relations?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$media$title<TRes> get title {
    final local$title = _instance.title;
    return local$title == null
        ? CopyWith$Fragment$media$title.stub(_then(_instance))
        : CopyWith$Fragment$media$title(local$title, (e) => call(title: e));
  }

  CopyWith$Fragment$media$coverImage<TRes> get coverImage {
    final local$coverImage = _instance.coverImage;
    return local$coverImage == null
        ? CopyWith$Fragment$media$coverImage.stub(_then(_instance))
        : CopyWith$Fragment$media$coverImage(
            local$coverImage, (e) => call(coverImage: e));
  }

  CopyWith$Fragment$media$startDate<TRes> get startDate {
    final local$startDate = _instance.startDate;
    return local$startDate == null
        ? CopyWith$Fragment$media$startDate.stub(_then(_instance))
        : CopyWith$Fragment$media$startDate(
            local$startDate, (e) => call(startDate: e));
  }

  CopyWith$Fragment$media$endDate<TRes> get endDate {
    final local$endDate = _instance.endDate;
    return local$endDate == null
        ? CopyWith$Fragment$media$endDate.stub(_then(_instance))
        : CopyWith$Fragment$media$endDate(
            local$endDate, (e) => call(endDate: e));
  }

  CopyWith$Fragment$media$mediaListEntry<TRes> get mediaListEntry {
    final local$mediaListEntry = _instance.mediaListEntry;
    return local$mediaListEntry == null
        ? CopyWith$Fragment$media$mediaListEntry.stub(_then(_instance))
        : CopyWith$Fragment$media$mediaListEntry(
            local$mediaListEntry, (e) => call(mediaListEntry: e));
  }

  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode {
    final local$nextAiringEpisode = _instance.nextAiringEpisode;
    return local$nextAiringEpisode == null
        ? CopyWith$Fragment$media$nextAiringEpisode.stub(_then(_instance))
        : CopyWith$Fragment$media$nextAiringEpisode(
            local$nextAiringEpisode, (e) => call(nextAiringEpisode: e));
  }

  CopyWith$Fragment$media$studios<TRes> get studios {
    final local$studios = _instance.studios;
    return local$studios == null
        ? CopyWith$Fragment$media$studios.stub(_then(_instance))
        : CopyWith$Fragment$media$studios(
            local$studios, (e) => call(studios: e));
  }

  CopyWith$Fragment$media$relations<TRes> get relations {
    final local$relations = _instance.relations;
    return local$relations == null
        ? CopyWith$Fragment$media$relations.stub(_then(_instance))
        : CopyWith$Fragment$media$relations(
            local$relations, (e) => call(relations: e));
  }
}

class _CopyWithStubImpl$Fragment$media<TRes>
    implements CopyWith$Fragment$media<TRes> {
  _CopyWithStubImpl$Fragment$media(this._res);

  TRes _res;

  call({
    String? siteUrl,
    int? id,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    Fragment$media$title? title,
    Fragment$media$coverImage? coverImage,
    Fragment$media$startDate? startDate,
    Fragment$media$endDate? endDate,
    String? bannerImage,
    String? description,
    Enum$MediaType? type,
    Enum$MediaFormat? format,
    int? episodes,
    int? duration,
    int? chapters,
    int? volumes,
    List<String?>? genres,
    bool? isAdult,
    List<String?>? synonyms,
    int? averageScore,
    int? popularity,
    String? countryOfOrigin,
    Fragment$media$mediaListEntry? mediaListEntry,
    Fragment$media$nextAiringEpisode? nextAiringEpisode,
    Fragment$media$studios? studios,
    Fragment$media$relations? relations,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$media$title<TRes> get title =>
      CopyWith$Fragment$media$title.stub(_res);

  CopyWith$Fragment$media$coverImage<TRes> get coverImage =>
      CopyWith$Fragment$media$coverImage.stub(_res);

  CopyWith$Fragment$media$startDate<TRes> get startDate =>
      CopyWith$Fragment$media$startDate.stub(_res);

  CopyWith$Fragment$media$endDate<TRes> get endDate =>
      CopyWith$Fragment$media$endDate.stub(_res);

  CopyWith$Fragment$media$mediaListEntry<TRes> get mediaListEntry =>
      CopyWith$Fragment$media$mediaListEntry.stub(_res);

  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode =>
      CopyWith$Fragment$media$nextAiringEpisode.stub(_res);

  CopyWith$Fragment$media$studios<TRes> get studios =>
      CopyWith$Fragment$media$studios.stub(_res);

  CopyWith$Fragment$media$relations<TRes> get relations =>
      CopyWith$Fragment$media$relations.stub(_res);
}

const fragmentDefinitionmedia = FragmentDefinitionNode(
  name: NameNode(value: 'media'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Media'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'siteUrl'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'season'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'seasonYear'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'userPreferred'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'romaji'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'english'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'native'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'coverImage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'extraLarge'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'large'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'medium'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'color'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'startDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'year'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'month'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'day'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'endDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'year'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'month'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'day'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'bannerImage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'season'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'format'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'version'),
          value: IntValueNode(value: '2'),
        )
      ],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'episodes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'duration'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'chapters'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'volumes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'genres'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isAdult'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'synonyms'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'averageScore'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'popularity'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'countryOfOrigin'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'mediaListEntry'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'status'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'nextAiringEpisode'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'airingAt'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'timeUntilAiring'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'episode'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'studios'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'isMain'),
          value: BooleanValueNode(value: true),
        )
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'edges'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'isMain'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'node'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'relations'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'edges'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'relationType'),
              alias: null,
              arguments: [
                ArgumentNode(
                  name: NameNode(value: 'version'),
                  value: IntValueNode(value: '2'),
                )
              ],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'node'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                      name: NameNode(value: 'romaji'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'native'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: 'english'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    FieldNode(
                      name: NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                  ]),
                ),
                FieldNode(
                  name: NameNode(value: 'siteUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentmedia = DocumentNode(definitions: [
  fragmentDefinitionmedia,
]);

extension ClientExtension$Fragment$media on graphql.GraphQLClient {
  void writeFragment$media({
    required Fragment$media data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'media',
            document: documentNodeFragmentmedia,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$media? readFragment$media({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'media',
          document: documentNodeFragmentmedia,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$media.fromJson(result);
  }
}

class Fragment$media$title {
  Fragment$media$title({
    this.userPreferred,
    this.romaji,
    this.english,
    this.native,
    this.$__typename = 'MediaTitle',
  });

  factory Fragment$media$title.fromJson(Map<String, dynamic> json) {
    final l$userPreferred = json['userPreferred'];
    final l$romaji = json['romaji'];
    final l$english = json['english'];
    final l$native = json['native'];
    final l$$__typename = json['__typename'];
    return Fragment$media$title(
      userPreferred: (l$userPreferred as String?),
      romaji: (l$romaji as String?),
      english: (l$english as String?),
      native: (l$native as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? userPreferred;

  final String? romaji;

  final String? english;

  final String? native;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userPreferred = userPreferred;
    _resultData['userPreferred'] = l$userPreferred;
    final l$romaji = romaji;
    _resultData['romaji'] = l$romaji;
    final l$english = english;
    _resultData['english'] = l$english;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userPreferred = userPreferred;
    final l$romaji = romaji;
    final l$english = english;
    final l$native = native;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userPreferred,
      l$romaji,
      l$english,
      l$native,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$title) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userPreferred = userPreferred;
    final lOther$userPreferred = other.userPreferred;
    if (l$userPreferred != lOther$userPreferred) {
      return false;
    }
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) {
      return false;
    }
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$title on Fragment$media$title {
  CopyWith$Fragment$media$title<Fragment$media$title> get copyWith =>
      CopyWith$Fragment$media$title(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$title<TRes> {
  factory CopyWith$Fragment$media$title(
    Fragment$media$title instance,
    TRes Function(Fragment$media$title) then,
  ) = _CopyWithImpl$Fragment$media$title;

  factory CopyWith$Fragment$media$title.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$title;

  TRes call({
    String? userPreferred,
    String? romaji,
    String? english,
    String? native,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$title<TRes>
    implements CopyWith$Fragment$media$title<TRes> {
  _CopyWithImpl$Fragment$media$title(
    this._instance,
    this._then,
  );

  final Fragment$media$title _instance;

  final TRes Function(Fragment$media$title) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userPreferred = _undefined,
    Object? romaji = _undefined,
    Object? english = _undefined,
    Object? native = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$title(
        userPreferred: userPreferred == _undefined
            ? _instance.userPreferred
            : (userPreferred as String?),
        romaji: romaji == _undefined ? _instance.romaji : (romaji as String?),
        english:
            english == _undefined ? _instance.english : (english as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$title<TRes>
    implements CopyWith$Fragment$media$title<TRes> {
  _CopyWithStubImpl$Fragment$media$title(this._res);

  TRes _res;

  call({
    String? userPreferred,
    String? romaji,
    String? english,
    String? native,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$coverImage {
  Fragment$media$coverImage({
    this.extraLarge,
    this.large,
    this.medium,
    this.color,
    this.$__typename = 'MediaCoverImage',
  });

  factory Fragment$media$coverImage.fromJson(Map<String, dynamic> json) {
    final l$extraLarge = json['extraLarge'];
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$media$coverImage(
      extraLarge: (l$extraLarge as String?),
      large: (l$large as String?),
      medium: (l$medium as String?),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? extraLarge;

  final String? large;

  final String? medium;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$extraLarge = extraLarge;
    _resultData['extraLarge'] = l$extraLarge;
    final l$large = large;
    _resultData['large'] = l$large;
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$extraLarge = extraLarge;
    final l$large = large;
    final l$medium = medium;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$extraLarge,
      l$large,
      l$medium,
      l$color,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$coverImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$extraLarge = extraLarge;
    final lOther$extraLarge = other.extraLarge;
    if (l$extraLarge != lOther$extraLarge) {
      return false;
    }
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$coverImage
    on Fragment$media$coverImage {
  CopyWith$Fragment$media$coverImage<Fragment$media$coverImage> get copyWith =>
      CopyWith$Fragment$media$coverImage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$coverImage<TRes> {
  factory CopyWith$Fragment$media$coverImage(
    Fragment$media$coverImage instance,
    TRes Function(Fragment$media$coverImage) then,
  ) = _CopyWithImpl$Fragment$media$coverImage;

  factory CopyWith$Fragment$media$coverImage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$coverImage;

  TRes call({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$coverImage<TRes>
    implements CopyWith$Fragment$media$coverImage<TRes> {
  _CopyWithImpl$Fragment$media$coverImage(
    this._instance,
    this._then,
  );

  final Fragment$media$coverImage _instance;

  final TRes Function(Fragment$media$coverImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? extraLarge = _undefined,
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$coverImage(
        extraLarge: extraLarge == _undefined
            ? _instance.extraLarge
            : (extraLarge as String?),
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        color: color == _undefined ? _instance.color : (color as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$coverImage<TRes>
    implements CopyWith$Fragment$media$coverImage<TRes> {
  _CopyWithStubImpl$Fragment$media$coverImage(this._res);

  TRes _res;

  call({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$startDate {
  Fragment$media$startDate({
    this.year,
    this.month,
    this.day,
    this.$__typename = 'FuzzyDate',
  });

  factory Fragment$media$startDate.fromJson(Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Fragment$media$startDate(
      year: (l$year as int?),
      month: (l$month as int?),
      day: (l$day as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? year;

  final int? month;

  final int? day;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$year = year;
    _resultData['year'] = l$year;
    final l$month = month;
    _resultData['month'] = l$month;
    final l$day = day;
    _resultData['day'] = l$day;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$year,
      l$month,
      l$day,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$startDate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$startDate
    on Fragment$media$startDate {
  CopyWith$Fragment$media$startDate<Fragment$media$startDate> get copyWith =>
      CopyWith$Fragment$media$startDate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$startDate<TRes> {
  factory CopyWith$Fragment$media$startDate(
    Fragment$media$startDate instance,
    TRes Function(Fragment$media$startDate) then,
  ) = _CopyWithImpl$Fragment$media$startDate;

  factory CopyWith$Fragment$media$startDate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$startDate;

  TRes call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$startDate<TRes>
    implements CopyWith$Fragment$media$startDate<TRes> {
  _CopyWithImpl$Fragment$media$startDate(
    this._instance,
    this._then,
  );

  final Fragment$media$startDate _instance;

  final TRes Function(Fragment$media$startDate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$startDate(
        year: year == _undefined ? _instance.year : (year as int?),
        month: month == _undefined ? _instance.month : (month as int?),
        day: day == _undefined ? _instance.day : (day as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$startDate<TRes>
    implements CopyWith$Fragment$media$startDate<TRes> {
  _CopyWithStubImpl$Fragment$media$startDate(this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$endDate {
  Fragment$media$endDate({
    this.year,
    this.month,
    this.day,
    this.$__typename = 'FuzzyDate',
  });

  factory Fragment$media$endDate.fromJson(Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Fragment$media$endDate(
      year: (l$year as int?),
      month: (l$month as int?),
      day: (l$day as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? year;

  final int? month;

  final int? day;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$year = year;
    _resultData['year'] = l$year;
    final l$month = month;
    _resultData['month'] = l$month;
    final l$day = day;
    _resultData['day'] = l$day;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$year,
      l$month,
      l$day,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$endDate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$endDate on Fragment$media$endDate {
  CopyWith$Fragment$media$endDate<Fragment$media$endDate> get copyWith =>
      CopyWith$Fragment$media$endDate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$endDate<TRes> {
  factory CopyWith$Fragment$media$endDate(
    Fragment$media$endDate instance,
    TRes Function(Fragment$media$endDate) then,
  ) = _CopyWithImpl$Fragment$media$endDate;

  factory CopyWith$Fragment$media$endDate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$endDate;

  TRes call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$endDate<TRes>
    implements CopyWith$Fragment$media$endDate<TRes> {
  _CopyWithImpl$Fragment$media$endDate(
    this._instance,
    this._then,
  );

  final Fragment$media$endDate _instance;

  final TRes Function(Fragment$media$endDate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$endDate(
        year: year == _undefined ? _instance.year : (year as int?),
        month: month == _undefined ? _instance.month : (month as int?),
        day: day == _undefined ? _instance.day : (day as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$endDate<TRes>
    implements CopyWith$Fragment$media$endDate<TRes> {
  _CopyWithStubImpl$Fragment$media$endDate(this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$mediaListEntry {
  Fragment$media$mediaListEntry({
    required this.id,
    this.status,
    this.$__typename = 'MediaList',
  });

  factory Fragment$media$mediaListEntry.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Fragment$media$mediaListEntry(
      id: (l$id as int),
      status: l$status == null
          ? null
          : fromJson$Enum$MediaListStatus((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Enum$MediaListStatus? status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$MediaListStatus(l$status);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$mediaListEntry) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$mediaListEntry
    on Fragment$media$mediaListEntry {
  CopyWith$Fragment$media$mediaListEntry<Fragment$media$mediaListEntry>
      get copyWith => CopyWith$Fragment$media$mediaListEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$mediaListEntry<TRes> {
  factory CopyWith$Fragment$media$mediaListEntry(
    Fragment$media$mediaListEntry instance,
    TRes Function(Fragment$media$mediaListEntry) then,
  ) = _CopyWithImpl$Fragment$media$mediaListEntry;

  factory CopyWith$Fragment$media$mediaListEntry.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$mediaListEntry;

  TRes call({
    int? id,
    Enum$MediaListStatus? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$mediaListEntry<TRes>
    implements CopyWith$Fragment$media$mediaListEntry<TRes> {
  _CopyWithImpl$Fragment$media$mediaListEntry(
    this._instance,
    this._then,
  );

  final Fragment$media$mediaListEntry _instance;

  final TRes Function(Fragment$media$mediaListEntry) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$mediaListEntry(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$MediaListStatus?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$mediaListEntry<TRes>
    implements CopyWith$Fragment$media$mediaListEntry<TRes> {
  _CopyWithStubImpl$Fragment$media$mediaListEntry(this._res);

  TRes _res;

  call({
    int? id,
    Enum$MediaListStatus? status,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$nextAiringEpisode {
  Fragment$media$nextAiringEpisode({
    required this.airingAt,
    required this.timeUntilAiring,
    required this.episode,
    this.$__typename = 'AiringSchedule',
  });

  factory Fragment$media$nextAiringEpisode.fromJson(Map<String, dynamic> json) {
    final l$airingAt = json['airingAt'];
    final l$timeUntilAiring = json['timeUntilAiring'];
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Fragment$media$nextAiringEpisode(
      airingAt: (l$airingAt as int),
      timeUntilAiring: (l$timeUntilAiring as int),
      episode: (l$episode as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int airingAt;

  final int timeUntilAiring;

  final int episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$airingAt = airingAt;
    _resultData['airingAt'] = l$airingAt;
    final l$timeUntilAiring = timeUntilAiring;
    _resultData['timeUntilAiring'] = l$timeUntilAiring;
    final l$episode = episode;
    _resultData['episode'] = l$episode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$airingAt = airingAt;
    final l$timeUntilAiring = timeUntilAiring;
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$airingAt,
      l$timeUntilAiring,
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$nextAiringEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$airingAt = airingAt;
    final lOther$airingAt = other.airingAt;
    if (l$airingAt != lOther$airingAt) {
      return false;
    }
    final l$timeUntilAiring = timeUntilAiring;
    final lOther$timeUntilAiring = other.timeUntilAiring;
    if (l$timeUntilAiring != lOther$timeUntilAiring) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$nextAiringEpisode
    on Fragment$media$nextAiringEpisode {
  CopyWith$Fragment$media$nextAiringEpisode<Fragment$media$nextAiringEpisode>
      get copyWith => CopyWith$Fragment$media$nextAiringEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$nextAiringEpisode<TRes> {
  factory CopyWith$Fragment$media$nextAiringEpisode(
    Fragment$media$nextAiringEpisode instance,
    TRes Function(Fragment$media$nextAiringEpisode) then,
  ) = _CopyWithImpl$Fragment$media$nextAiringEpisode;

  factory CopyWith$Fragment$media$nextAiringEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$nextAiringEpisode;

  TRes call({
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$nextAiringEpisode<TRes>
    implements CopyWith$Fragment$media$nextAiringEpisode<TRes> {
  _CopyWithImpl$Fragment$media$nextAiringEpisode(
    this._instance,
    this._then,
  );

  final Fragment$media$nextAiringEpisode _instance;

  final TRes Function(Fragment$media$nextAiringEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? airingAt = _undefined,
    Object? timeUntilAiring = _undefined,
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$nextAiringEpisode(
        airingAt: airingAt == _undefined || airingAt == null
            ? _instance.airingAt
            : (airingAt as int),
        timeUntilAiring:
            timeUntilAiring == _undefined || timeUntilAiring == null
                ? _instance.timeUntilAiring
                : (timeUntilAiring as int),
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$nextAiringEpisode<TRes>
    implements CopyWith$Fragment$media$nextAiringEpisode<TRes> {
  _CopyWithStubImpl$Fragment$media$nextAiringEpisode(this._res);

  TRes _res;

  call({
    int? airingAt,
    int? timeUntilAiring,
    int? episode,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$studios {
  Fragment$media$studios({
    this.edges,
    this.$__typename = 'StudioConnection',
  });

  factory Fragment$media$studios.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$media$studios(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$media$studios$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$media$studios$edges?>? edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$studios) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$studios on Fragment$media$studios {
  CopyWith$Fragment$media$studios<Fragment$media$studios> get copyWith =>
      CopyWith$Fragment$media$studios(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$studios<TRes> {
  factory CopyWith$Fragment$media$studios(
    Fragment$media$studios instance,
    TRes Function(Fragment$media$studios) then,
  ) = _CopyWithImpl$Fragment$media$studios;

  factory CopyWith$Fragment$media$studios.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$studios;

  TRes call({
    List<Fragment$media$studios$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$media$studios$edges?>? Function(
              Iterable<
                  CopyWith$Fragment$media$studios$edges<
                      Fragment$media$studios$edges>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$media$studios<TRes>
    implements CopyWith$Fragment$media$studios<TRes> {
  _CopyWithImpl$Fragment$media$studios(
    this._instance,
    this._then,
  );

  final Fragment$media$studios _instance;

  final TRes Function(Fragment$media$studios) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$studios(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<Fragment$media$studios$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$media$studios$edges?>? Function(
                  Iterable<
                      CopyWith$Fragment$media$studios$edges<
                          Fragment$media$studios$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Fragment$media$studios$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$media$studios<TRes>
    implements CopyWith$Fragment$media$studios<TRes> {
  _CopyWithStubImpl$Fragment$media$studios(this._res);

  TRes _res;

  call({
    List<Fragment$media$studios$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$media$studios$edges {
  Fragment$media$studios$edges({
    required this.isMain,
    this.node,
    this.$__typename = 'StudioEdge',
  });

  factory Fragment$media$studios$edges.fromJson(Map<String, dynamic> json) {
    final l$isMain = json['isMain'];
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$media$studios$edges(
      isMain: (l$isMain as bool),
      node: l$node == null
          ? null
          : Fragment$media$studios$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool isMain;

  final Fragment$media$studios$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$isMain = isMain;
    _resultData['isMain'] = l$isMain;
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$isMain = isMain;
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$isMain,
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$studios$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$isMain = isMain;
    final lOther$isMain = other.isMain;
    if (l$isMain != lOther$isMain) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$studios$edges
    on Fragment$media$studios$edges {
  CopyWith$Fragment$media$studios$edges<Fragment$media$studios$edges>
      get copyWith => CopyWith$Fragment$media$studios$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$studios$edges<TRes> {
  factory CopyWith$Fragment$media$studios$edges(
    Fragment$media$studios$edges instance,
    TRes Function(Fragment$media$studios$edges) then,
  ) = _CopyWithImpl$Fragment$media$studios$edges;

  factory CopyWith$Fragment$media$studios$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$studios$edges;

  TRes call({
    bool? isMain,
    Fragment$media$studios$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$media$studios$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$media$studios$edges<TRes>
    implements CopyWith$Fragment$media$studios$edges<TRes> {
  _CopyWithImpl$Fragment$media$studios$edges(
    this._instance,
    this._then,
  );

  final Fragment$media$studios$edges _instance;

  final TRes Function(Fragment$media$studios$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? isMain = _undefined,
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$studios$edges(
        isMain: isMain == _undefined || isMain == null
            ? _instance.isMain
            : (isMain as bool),
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$media$studios$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$media$studios$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$media$studios$edges$node.stub(_then(_instance))
        : CopyWith$Fragment$media$studios$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$media$studios$edges<TRes>
    implements CopyWith$Fragment$media$studios$edges<TRes> {
  _CopyWithStubImpl$Fragment$media$studios$edges(this._res);

  TRes _res;

  call({
    bool? isMain,
    Fragment$media$studios$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$media$studios$edges$node<TRes> get node =>
      CopyWith$Fragment$media$studios$edges$node.stub(_res);
}

class Fragment$media$studios$edges$node {
  Fragment$media$studios$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'Studio',
  });

  factory Fragment$media$studios$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$media$studios$edges$node(
      id: (l$id as int),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$studios$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$studios$edges$node
    on Fragment$media$studios$edges$node {
  CopyWith$Fragment$media$studios$edges$node<Fragment$media$studios$edges$node>
      get copyWith => CopyWith$Fragment$media$studios$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$studios$edges$node<TRes> {
  factory CopyWith$Fragment$media$studios$edges$node(
    Fragment$media$studios$edges$node instance,
    TRes Function(Fragment$media$studios$edges$node) then,
  ) = _CopyWithImpl$Fragment$media$studios$edges$node;

  factory CopyWith$Fragment$media$studios$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$studios$edges$node;

  TRes call({
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$studios$edges$node<TRes>
    implements CopyWith$Fragment$media$studios$edges$node<TRes> {
  _CopyWithImpl$Fragment$media$studios$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$media$studios$edges$node _instance;

  final TRes Function(Fragment$media$studios$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$studios$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$studios$edges$node<TRes>
    implements CopyWith$Fragment$media$studios$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$media$studios$edges$node(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$relations {
  Fragment$media$relations({
    this.edges,
    this.$__typename = 'MediaConnection',
  });

  factory Fragment$media$relations.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$media$relations(
      edges: (l$edges as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$media$relations$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$media$relations$edges?>? edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$relations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$relations
    on Fragment$media$relations {
  CopyWith$Fragment$media$relations<Fragment$media$relations> get copyWith =>
      CopyWith$Fragment$media$relations(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$relations<TRes> {
  factory CopyWith$Fragment$media$relations(
    Fragment$media$relations instance,
    TRes Function(Fragment$media$relations) then,
  ) = _CopyWithImpl$Fragment$media$relations;

  factory CopyWith$Fragment$media$relations.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$relations;

  TRes call({
    List<Fragment$media$relations$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Fragment$media$relations$edges?>? Function(
              Iterable<
                  CopyWith$Fragment$media$relations$edges<
                      Fragment$media$relations$edges>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$media$relations<TRes>
    implements CopyWith$Fragment$media$relations<TRes> {
  _CopyWithImpl$Fragment$media$relations(
    this._instance,
    this._then,
  );

  final Fragment$media$relations _instance;

  final TRes Function(Fragment$media$relations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$relations(
        edges: edges == _undefined
            ? _instance.edges
            : (edges as List<Fragment$media$relations$edges?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Fragment$media$relations$edges?>? Function(
                  Iterable<
                      CopyWith$Fragment$media$relations$edges<
                          Fragment$media$relations$edges>?>?)
              _fn) =>
      call(
          edges: _fn(_instance.edges?.map((e) => e == null
              ? null
              : CopyWith$Fragment$media$relations$edges(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$media$relations<TRes>
    implements CopyWith$Fragment$media$relations<TRes> {
  _CopyWithStubImpl$Fragment$media$relations(this._res);

  TRes _res;

  call({
    List<Fragment$media$relations$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Fragment$media$relations$edges {
  Fragment$media$relations$edges({
    this.relationType,
    this.node,
    this.$__typename = 'MediaEdge',
  });

  factory Fragment$media$relations$edges.fromJson(Map<String, dynamic> json) {
    final l$relationType = json['relationType'];
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$media$relations$edges(
      relationType: l$relationType == null
          ? null
          : fromJson$Enum$MediaRelation((l$relationType as String)),
      node: l$node == null
          ? null
          : Fragment$media$relations$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MediaRelation? relationType;

  final Fragment$media$relations$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$relationType = relationType;
    _resultData['relationType'] = l$relationType == null
        ? null
        : toJson$Enum$MediaRelation(l$relationType);
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$relationType = relationType;
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$relationType,
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$relations$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$relationType = relationType;
    final lOther$relationType = other.relationType;
    if (l$relationType != lOther$relationType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$relations$edges
    on Fragment$media$relations$edges {
  CopyWith$Fragment$media$relations$edges<Fragment$media$relations$edges>
      get copyWith => CopyWith$Fragment$media$relations$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$relations$edges<TRes> {
  factory CopyWith$Fragment$media$relations$edges(
    Fragment$media$relations$edges instance,
    TRes Function(Fragment$media$relations$edges) then,
  ) = _CopyWithImpl$Fragment$media$relations$edges;

  factory CopyWith$Fragment$media$relations$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$relations$edges;

  TRes call({
    Enum$MediaRelation? relationType,
    Fragment$media$relations$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$media$relations$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$media$relations$edges<TRes>
    implements CopyWith$Fragment$media$relations$edges<TRes> {
  _CopyWithImpl$Fragment$media$relations$edges(
    this._instance,
    this._then,
  );

  final Fragment$media$relations$edges _instance;

  final TRes Function(Fragment$media$relations$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? relationType = _undefined,
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$relations$edges(
        relationType: relationType == _undefined
            ? _instance.relationType
            : (relationType as Enum$MediaRelation?),
        node: node == _undefined
            ? _instance.node
            : (node as Fragment$media$relations$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$media$relations$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$media$relations$edges$node.stub(_then(_instance))
        : CopyWith$Fragment$media$relations$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$media$relations$edges<TRes>
    implements CopyWith$Fragment$media$relations$edges<TRes> {
  _CopyWithStubImpl$Fragment$media$relations$edges(this._res);

  TRes _res;

  call({
    Enum$MediaRelation? relationType,
    Fragment$media$relations$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$media$relations$edges$node<TRes> get node =>
      CopyWith$Fragment$media$relations$edges$node.stub(_res);
}

class Fragment$media$relations$edges$node {
  Fragment$media$relations$edges$node({
    required this.id,
    this.title,
    this.siteUrl,
    this.$__typename = 'Media',
  });

  factory Fragment$media$relations$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$siteUrl = json['siteUrl'];
    final l$$__typename = json['__typename'];
    return Fragment$media$relations$edges$node(
      id: (l$id as int),
      title: l$title == null
          ? null
          : Fragment$media$relations$edges$node$title.fromJson(
              (l$title as Map<String, dynamic>)),
      siteUrl: (l$siteUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Fragment$media$relations$edges$node$title? title;

  final String? siteUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title?.toJson();
    final l$siteUrl = siteUrl;
    _resultData['siteUrl'] = l$siteUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$siteUrl = siteUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$siteUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$relations$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$siteUrl = siteUrl;
    final lOther$siteUrl = other.siteUrl;
    if (l$siteUrl != lOther$siteUrl) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$relations$edges$node
    on Fragment$media$relations$edges$node {
  CopyWith$Fragment$media$relations$edges$node<
          Fragment$media$relations$edges$node>
      get copyWith => CopyWith$Fragment$media$relations$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$relations$edges$node<TRes> {
  factory CopyWith$Fragment$media$relations$edges$node(
    Fragment$media$relations$edges$node instance,
    TRes Function(Fragment$media$relations$edges$node) then,
  ) = _CopyWithImpl$Fragment$media$relations$edges$node;

  factory CopyWith$Fragment$media$relations$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$relations$edges$node;

  TRes call({
    int? id,
    Fragment$media$relations$edges$node$title? title,
    String? siteUrl,
    String? $__typename,
  });
  CopyWith$Fragment$media$relations$edges$node$title<TRes> get title;
}

class _CopyWithImpl$Fragment$media$relations$edges$node<TRes>
    implements CopyWith$Fragment$media$relations$edges$node<TRes> {
  _CopyWithImpl$Fragment$media$relations$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$media$relations$edges$node _instance;

  final TRes Function(Fragment$media$relations$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? siteUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$relations$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        title: title == _undefined
            ? _instance.title
            : (title as Fragment$media$relations$edges$node$title?),
        siteUrl:
            siteUrl == _undefined ? _instance.siteUrl : (siteUrl as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$media$relations$edges$node$title<TRes> get title {
    final local$title = _instance.title;
    return local$title == null
        ? CopyWith$Fragment$media$relations$edges$node$title.stub(
            _then(_instance))
        : CopyWith$Fragment$media$relations$edges$node$title(
            local$title, (e) => call(title: e));
  }
}

class _CopyWithStubImpl$Fragment$media$relations$edges$node<TRes>
    implements CopyWith$Fragment$media$relations$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$media$relations$edges$node(this._res);

  TRes _res;

  call({
    int? id,
    Fragment$media$relations$edges$node$title? title,
    String? siteUrl,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$media$relations$edges$node$title<TRes> get title =>
      CopyWith$Fragment$media$relations$edges$node$title.stub(_res);
}

class Fragment$media$relations$edges$node$title {
  Fragment$media$relations$edges$node$title({
    this.romaji,
    this.native,
    this.english,
    this.$__typename = 'MediaTitle',
  });

  factory Fragment$media$relations$edges$node$title.fromJson(
      Map<String, dynamic> json) {
    final l$romaji = json['romaji'];
    final l$native = json['native'];
    final l$english = json['english'];
    final l$$__typename = json['__typename'];
    return Fragment$media$relations$edges$node$title(
      romaji: (l$romaji as String?),
      native: (l$native as String?),
      english: (l$english as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? romaji;

  final String? native;

  final String? english;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$romaji = romaji;
    _resultData['romaji'] = l$romaji;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$english = english;
    _resultData['english'] = l$english;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$romaji = romaji;
    final l$native = native;
    final l$english = english;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$romaji,
      l$native,
      l$english,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$media$relations$edges$node$title) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) {
      return false;
    }
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$media$relations$edges$node$title
    on Fragment$media$relations$edges$node$title {
  CopyWith$Fragment$media$relations$edges$node$title<
          Fragment$media$relations$edges$node$title>
      get copyWith => CopyWith$Fragment$media$relations$edges$node$title(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$relations$edges$node$title<TRes> {
  factory CopyWith$Fragment$media$relations$edges$node$title(
    Fragment$media$relations$edges$node$title instance,
    TRes Function(Fragment$media$relations$edges$node$title) then,
  ) = _CopyWithImpl$Fragment$media$relations$edges$node$title;

  factory CopyWith$Fragment$media$relations$edges$node$title.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$relations$edges$node$title;

  TRes call({
    String? romaji,
    String? native,
    String? english,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$relations$edges$node$title<TRes>
    implements CopyWith$Fragment$media$relations$edges$node$title<TRes> {
  _CopyWithImpl$Fragment$media$relations$edges$node$title(
    this._instance,
    this._then,
  );

  final Fragment$media$relations$edges$node$title _instance;

  final TRes Function(Fragment$media$relations$edges$node$title) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? romaji = _undefined,
    Object? native = _undefined,
    Object? english = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$relations$edges$node$title(
        romaji: romaji == _undefined ? _instance.romaji : (romaji as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        english:
            english == _undefined ? _instance.english : (english as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$media$relations$edges$node$title<TRes>
    implements CopyWith$Fragment$media$relations$edges$node$title<TRes> {
  _CopyWithStubImpl$Fragment$media$relations$edges$node$title(this._res);

  TRes _res;

  call({
    String? romaji,
    String? native,
    String? english,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia {
  Fragment$shortMedia({
    required this.id,
    this.idMal,
    this.siteUrl,
    this.season,
    this.seasonYear,
    this.status,
    required this.isFavourite,
    this.title,
    this.coverImage,
    this.trailer,
    this.streamingEpisodes,
    this.bannerImage,
    this.genres,
    this.isAdult,
    this.episodes,
    this.synonyms,
    this.nextAiringEpisode,
    this.format,
    this.description,
    this.source,
    this.studios,
    this.countryOfOrigin,
    this.startDate,
    this.$__typename = 'Media',
  });

  factory Fragment$shortMedia.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$idMal = json['idMal'];
    final l$siteUrl = json['siteUrl'];
    final l$season = json['season'];
    final l$seasonYear = json['seasonYear'];
    final l$status = json['status'];
    final l$isFavourite = json['isFavourite'];
    final l$title = json['title'];
    final l$coverImage = json['coverImage'];
    final l$trailer = json['trailer'];
    final l$streamingEpisodes = json['streamingEpisodes'];
    final l$bannerImage = json['bannerImage'];
    final l$genres = json['genres'];
    final l$isAdult = json['isAdult'];
    final l$episodes = json['episodes'];
    final l$synonyms = json['synonyms'];
    final l$nextAiringEpisode = json['nextAiringEpisode'];
    final l$format = json['format'];
    final l$description = json['description'];
    final l$source = json['source'];
    final l$studios = json['studios'];
    final l$countryOfOrigin = json['countryOfOrigin'];
    final l$startDate = json['startDate'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia(
      id: (l$id as int),
      idMal: (l$idMal as int?),
      siteUrl: (l$siteUrl as String?),
      season: l$season == null
          ? null
          : fromJson$Enum$MediaSeason((l$season as String)),
      seasonYear: (l$seasonYear as int?),
      status: l$status == null
          ? null
          : fromJson$Enum$MediaStatus((l$status as String)),
      isFavourite: (l$isFavourite as bool),
      title: l$title == null
          ? null
          : Fragment$shortMedia$title.fromJson(
              (l$title as Map<String, dynamic>)),
      coverImage: l$coverImage == null
          ? null
          : Fragment$shortMedia$coverImage.fromJson(
              (l$coverImage as Map<String, dynamic>)),
      trailer: l$trailer == null
          ? null
          : Fragment$shortMedia$trailer.fromJson(
              (l$trailer as Map<String, dynamic>)),
      streamingEpisodes: (l$streamingEpisodes as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$shortMedia$streamingEpisodes.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      bannerImage: (l$bannerImage as String?),
      genres: (l$genres as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      isAdult: (l$isAdult as bool?),
      episodes: (l$episodes as int?),
      synonyms:
          (l$synonyms as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      nextAiringEpisode: l$nextAiringEpisode == null
          ? null
          : Fragment$shortMedia$nextAiringEpisode.fromJson(
              (l$nextAiringEpisode as Map<String, dynamic>)),
      format: l$format == null
          ? null
          : fromJson$Enum$MediaFormat((l$format as String)),
      description: (l$description as String?),
      source: l$source == null
          ? null
          : fromJson$Enum$MediaSource((l$source as String)),
      studios: l$studios == null
          ? null
          : Fragment$shortMedia$studios.fromJson(
              (l$studios as Map<String, dynamic>)),
      countryOfOrigin: (l$countryOfOrigin as String?),
      startDate: l$startDate == null
          ? null
          : Fragment$shortMedia$startDate.fromJson(
              (l$startDate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final int? idMal;

  final String? siteUrl;

  final Enum$MediaSeason? season;

  final int? seasonYear;

  final Enum$MediaStatus? status;

  final bool isFavourite;

  final Fragment$shortMedia$title? title;

  final Fragment$shortMedia$coverImage? coverImage;

  final Fragment$shortMedia$trailer? trailer;

  final List<Fragment$shortMedia$streamingEpisodes?>? streamingEpisodes;

  final String? bannerImage;

  final List<String?>? genres;

  final bool? isAdult;

  final int? episodes;

  final List<String?>? synonyms;

  final Fragment$shortMedia$nextAiringEpisode? nextAiringEpisode;

  final Enum$MediaFormat? format;

  final String? description;

  final Enum$MediaSource? source;

  final Fragment$shortMedia$studios? studios;

  final String? countryOfOrigin;

  final Fragment$shortMedia$startDate? startDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$idMal = idMal;
    _resultData['idMal'] = l$idMal;
    final l$siteUrl = siteUrl;
    _resultData['siteUrl'] = l$siteUrl;
    final l$season = season;
    _resultData['season'] =
        l$season == null ? null : toJson$Enum$MediaSeason(l$season);
    final l$seasonYear = seasonYear;
    _resultData['seasonYear'] = l$seasonYear;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$MediaStatus(l$status);
    final l$isFavourite = isFavourite;
    _resultData['isFavourite'] = l$isFavourite;
    final l$title = title;
    _resultData['title'] = l$title?.toJson();
    final l$coverImage = coverImage;
    _resultData['coverImage'] = l$coverImage?.toJson();
    final l$trailer = trailer;
    _resultData['trailer'] = l$trailer?.toJson();
    final l$streamingEpisodes = streamingEpisodes;
    _resultData['streamingEpisodes'] =
        l$streamingEpisodes?.map((e) => e?.toJson()).toList();
    final l$bannerImage = bannerImage;
    _resultData['bannerImage'] = l$bannerImage;
    final l$genres = genres;
    _resultData['genres'] = l$genres?.map((e) => e).toList();
    final l$isAdult = isAdult;
    _resultData['isAdult'] = l$isAdult;
    final l$episodes = episodes;
    _resultData['episodes'] = l$episodes;
    final l$synonyms = synonyms;
    _resultData['synonyms'] = l$synonyms?.map((e) => e).toList();
    final l$nextAiringEpisode = nextAiringEpisode;
    _resultData['nextAiringEpisode'] = l$nextAiringEpisode?.toJson();
    final l$format = format;
    _resultData['format'] =
        l$format == null ? null : toJson$Enum$MediaFormat(l$format);
    final l$description = description;
    _resultData['description'] = l$description;
    final l$source = source;
    _resultData['source'] =
        l$source == null ? null : toJson$Enum$MediaSource(l$source);
    final l$studios = studios;
    _resultData['studios'] = l$studios?.toJson();
    final l$countryOfOrigin = countryOfOrigin;
    _resultData['countryOfOrigin'] = l$countryOfOrigin;
    final l$startDate = startDate;
    _resultData['startDate'] = l$startDate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$idMal = idMal;
    final l$siteUrl = siteUrl;
    final l$season = season;
    final l$seasonYear = seasonYear;
    final l$status = status;
    final l$isFavourite = isFavourite;
    final l$title = title;
    final l$coverImage = coverImage;
    final l$trailer = trailer;
    final l$streamingEpisodes = streamingEpisodes;
    final l$bannerImage = bannerImage;
    final l$genres = genres;
    final l$isAdult = isAdult;
    final l$episodes = episodes;
    final l$synonyms = synonyms;
    final l$nextAiringEpisode = nextAiringEpisode;
    final l$format = format;
    final l$description = description;
    final l$source = source;
    final l$studios = studios;
    final l$countryOfOrigin = countryOfOrigin;
    final l$startDate = startDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$idMal,
      l$siteUrl,
      l$season,
      l$seasonYear,
      l$status,
      l$isFavourite,
      l$title,
      l$coverImage,
      l$trailer,
      l$streamingEpisodes == null
          ? null
          : Object.hashAll(l$streamingEpisodes.map((v) => v)),
      l$bannerImage,
      l$genres == null ? null : Object.hashAll(l$genres.map((v) => v)),
      l$isAdult,
      l$episodes,
      l$synonyms == null ? null : Object.hashAll(l$synonyms.map((v) => v)),
      l$nextAiringEpisode,
      l$format,
      l$description,
      l$source,
      l$studios,
      l$countryOfOrigin,
      l$startDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$idMal = idMal;
    final lOther$idMal = other.idMal;
    if (l$idMal != lOther$idMal) {
      return false;
    }
    final l$siteUrl = siteUrl;
    final lOther$siteUrl = other.siteUrl;
    if (l$siteUrl != lOther$siteUrl) {
      return false;
    }
    final l$season = season;
    final lOther$season = other.season;
    if (l$season != lOther$season) {
      return false;
    }
    final l$seasonYear = seasonYear;
    final lOther$seasonYear = other.seasonYear;
    if (l$seasonYear != lOther$seasonYear) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$isFavourite = isFavourite;
    final lOther$isFavourite = other.isFavourite;
    if (l$isFavourite != lOther$isFavourite) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$coverImage = coverImage;
    final lOther$coverImage = other.coverImage;
    if (l$coverImage != lOther$coverImage) {
      return false;
    }
    final l$trailer = trailer;
    final lOther$trailer = other.trailer;
    if (l$trailer != lOther$trailer) {
      return false;
    }
    final l$streamingEpisodes = streamingEpisodes;
    final lOther$streamingEpisodes = other.streamingEpisodes;
    if (l$streamingEpisodes != null && lOther$streamingEpisodes != null) {
      if (l$streamingEpisodes.length != lOther$streamingEpisodes.length) {
        return false;
      }
      for (int i = 0; i < l$streamingEpisodes.length; i++) {
        final l$streamingEpisodes$entry = l$streamingEpisodes[i];
        final lOther$streamingEpisodes$entry = lOther$streamingEpisodes[i];
        if (l$streamingEpisodes$entry != lOther$streamingEpisodes$entry) {
          return false;
        }
      }
    } else if (l$streamingEpisodes != lOther$streamingEpisodes) {
      return false;
    }
    final l$bannerImage = bannerImage;
    final lOther$bannerImage = other.bannerImage;
    if (l$bannerImage != lOther$bannerImage) {
      return false;
    }
    final l$genres = genres;
    final lOther$genres = other.genres;
    if (l$genres != null && lOther$genres != null) {
      if (l$genres.length != lOther$genres.length) {
        return false;
      }
      for (int i = 0; i < l$genres.length; i++) {
        final l$genres$entry = l$genres[i];
        final lOther$genres$entry = lOther$genres[i];
        if (l$genres$entry != lOther$genres$entry) {
          return false;
        }
      }
    } else if (l$genres != lOther$genres) {
      return false;
    }
    final l$isAdult = isAdult;
    final lOther$isAdult = other.isAdult;
    if (l$isAdult != lOther$isAdult) {
      return false;
    }
    final l$episodes = episodes;
    final lOther$episodes = other.episodes;
    if (l$episodes != lOther$episodes) {
      return false;
    }
    final l$synonyms = synonyms;
    final lOther$synonyms = other.synonyms;
    if (l$synonyms != null && lOther$synonyms != null) {
      if (l$synonyms.length != lOther$synonyms.length) {
        return false;
      }
      for (int i = 0; i < l$synonyms.length; i++) {
        final l$synonyms$entry = l$synonyms[i];
        final lOther$synonyms$entry = lOther$synonyms[i];
        if (l$synonyms$entry != lOther$synonyms$entry) {
          return false;
        }
      }
    } else if (l$synonyms != lOther$synonyms) {
      return false;
    }
    final l$nextAiringEpisode = nextAiringEpisode;
    final lOther$nextAiringEpisode = other.nextAiringEpisode;
    if (l$nextAiringEpisode != lOther$nextAiringEpisode) {
      return false;
    }
    final l$format = format;
    final lOther$format = other.format;
    if (l$format != lOther$format) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$source = source;
    final lOther$source = other.source;
    if (l$source != lOther$source) {
      return false;
    }
    final l$studios = studios;
    final lOther$studios = other.studios;
    if (l$studios != lOther$studios) {
      return false;
    }
    final l$countryOfOrigin = countryOfOrigin;
    final lOther$countryOfOrigin = other.countryOfOrigin;
    if (l$countryOfOrigin != lOther$countryOfOrigin) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia on Fragment$shortMedia {
  CopyWith$Fragment$shortMedia<Fragment$shortMedia> get copyWith =>
      CopyWith$Fragment$shortMedia(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$shortMedia<TRes> {
  factory CopyWith$Fragment$shortMedia(
    Fragment$shortMedia instance,
    TRes Function(Fragment$shortMedia) then,
  ) = _CopyWithImpl$Fragment$shortMedia;

  factory CopyWith$Fragment$shortMedia.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia;

  TRes call({
    int? id,
    int? idMal,
    String? siteUrl,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    bool? isFavourite,
    Fragment$shortMedia$title? title,
    Fragment$shortMedia$coverImage? coverImage,
    Fragment$shortMedia$trailer? trailer,
    List<Fragment$shortMedia$streamingEpisodes?>? streamingEpisodes,
    String? bannerImage,
    List<String?>? genres,
    bool? isAdult,
    int? episodes,
    List<String?>? synonyms,
    Fragment$shortMedia$nextAiringEpisode? nextAiringEpisode,
    Enum$MediaFormat? format,
    String? description,
    Enum$MediaSource? source,
    Fragment$shortMedia$studios? studios,
    String? countryOfOrigin,
    Fragment$shortMedia$startDate? startDate,
    String? $__typename,
  });
  CopyWith$Fragment$shortMedia$title<TRes> get title;
  CopyWith$Fragment$shortMedia$coverImage<TRes> get coverImage;
  CopyWith$Fragment$shortMedia$trailer<TRes> get trailer;
  TRes streamingEpisodes(
      Iterable<Fragment$shortMedia$streamingEpisodes?>? Function(
              Iterable<
                  CopyWith$Fragment$shortMedia$streamingEpisodes<
                      Fragment$shortMedia$streamingEpisodes>?>?)
          _fn);
  CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> get nextAiringEpisode;
  CopyWith$Fragment$shortMedia$studios<TRes> get studios;
  CopyWith$Fragment$shortMedia$startDate<TRes> get startDate;
}

class _CopyWithImpl$Fragment$shortMedia<TRes>
    implements CopyWith$Fragment$shortMedia<TRes> {
  _CopyWithImpl$Fragment$shortMedia(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia _instance;

  final TRes Function(Fragment$shortMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? idMal = _undefined,
    Object? siteUrl = _undefined,
    Object? season = _undefined,
    Object? seasonYear = _undefined,
    Object? status = _undefined,
    Object? isFavourite = _undefined,
    Object? title = _undefined,
    Object? coverImage = _undefined,
    Object? trailer = _undefined,
    Object? streamingEpisodes = _undefined,
    Object? bannerImage = _undefined,
    Object? genres = _undefined,
    Object? isAdult = _undefined,
    Object? episodes = _undefined,
    Object? synonyms = _undefined,
    Object? nextAiringEpisode = _undefined,
    Object? format = _undefined,
    Object? description = _undefined,
    Object? source = _undefined,
    Object? studios = _undefined,
    Object? countryOfOrigin = _undefined,
    Object? startDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        idMal: idMal == _undefined ? _instance.idMal : (idMal as int?),
        siteUrl:
            siteUrl == _undefined ? _instance.siteUrl : (siteUrl as String?),
        season: season == _undefined
            ? _instance.season
            : (season as Enum$MediaSeason?),
        seasonYear: seasonYear == _undefined
            ? _instance.seasonYear
            : (seasonYear as int?),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$MediaStatus?),
        isFavourite: isFavourite == _undefined || isFavourite == null
            ? _instance.isFavourite
            : (isFavourite as bool),
        title: title == _undefined
            ? _instance.title
            : (title as Fragment$shortMedia$title?),
        coverImage: coverImage == _undefined
            ? _instance.coverImage
            : (coverImage as Fragment$shortMedia$coverImage?),
        trailer: trailer == _undefined
            ? _instance.trailer
            : (trailer as Fragment$shortMedia$trailer?),
        streamingEpisodes: streamingEpisodes == _undefined
            ? _instance.streamingEpisodes
            : (streamingEpisodes
                as List<Fragment$shortMedia$streamingEpisodes?>?),
        bannerImage: bannerImage == _undefined
            ? _instance.bannerImage
            : (bannerImage as String?),
        genres: genres == _undefined
            ? _instance.genres
            : (genres as List<String?>?),
        isAdult: isAdult == _undefined ? _instance.isAdult : (isAdult as bool?),
        episodes:
            episodes == _undefined ? _instance.episodes : (episodes as int?),
        synonyms: synonyms == _undefined
            ? _instance.synonyms
            : (synonyms as List<String?>?),
        nextAiringEpisode: nextAiringEpisode == _undefined
            ? _instance.nextAiringEpisode
            : (nextAiringEpisode as Fragment$shortMedia$nextAiringEpisode?),
        format: format == _undefined
            ? _instance.format
            : (format as Enum$MediaFormat?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        source: source == _undefined
            ? _instance.source
            : (source as Enum$MediaSource?),
        studios: studios == _undefined
            ? _instance.studios
            : (studios as Fragment$shortMedia$studios?),
        countryOfOrigin: countryOfOrigin == _undefined
            ? _instance.countryOfOrigin
            : (countryOfOrigin as String?),
        startDate: startDate == _undefined
            ? _instance.startDate
            : (startDate as Fragment$shortMedia$startDate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$shortMedia$title<TRes> get title {
    final local$title = _instance.title;
    return local$title == null
        ? CopyWith$Fragment$shortMedia$title.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$title(
            local$title, (e) => call(title: e));
  }

  CopyWith$Fragment$shortMedia$coverImage<TRes> get coverImage {
    final local$coverImage = _instance.coverImage;
    return local$coverImage == null
        ? CopyWith$Fragment$shortMedia$coverImage.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$coverImage(
            local$coverImage, (e) => call(coverImage: e));
  }

  CopyWith$Fragment$shortMedia$trailer<TRes> get trailer {
    final local$trailer = _instance.trailer;
    return local$trailer == null
        ? CopyWith$Fragment$shortMedia$trailer.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$trailer(
            local$trailer, (e) => call(trailer: e));
  }

  TRes streamingEpisodes(
          Iterable<Fragment$shortMedia$streamingEpisodes?>? Function(
                  Iterable<
                      CopyWith$Fragment$shortMedia$streamingEpisodes<
                          Fragment$shortMedia$streamingEpisodes>?>?)
              _fn) =>
      call(
          streamingEpisodes:
              _fn(_instance.streamingEpisodes?.map((e) => e == null
                  ? null
                  : CopyWith$Fragment$shortMedia$streamingEpisodes(
                      e,
                      (i) => i,
                    )))?.toList());

  CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> get nextAiringEpisode {
    final local$nextAiringEpisode = _instance.nextAiringEpisode;
    return local$nextAiringEpisode == null
        ? CopyWith$Fragment$shortMedia$nextAiringEpisode.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$nextAiringEpisode(
            local$nextAiringEpisode, (e) => call(nextAiringEpisode: e));
  }

  CopyWith$Fragment$shortMedia$studios<TRes> get studios {
    final local$studios = _instance.studios;
    return local$studios == null
        ? CopyWith$Fragment$shortMedia$studios.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$studios(
            local$studios, (e) => call(studios: e));
  }

  CopyWith$Fragment$shortMedia$startDate<TRes> get startDate {
    final local$startDate = _instance.startDate;
    return local$startDate == null
        ? CopyWith$Fragment$shortMedia$startDate.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia$startDate(
            local$startDate, (e) => call(startDate: e));
  }
}

class _CopyWithStubImpl$Fragment$shortMedia<TRes>
    implements CopyWith$Fragment$shortMedia<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia(this._res);

  TRes _res;

  call({
    int? id,
    int? idMal,
    String? siteUrl,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    bool? isFavourite,
    Fragment$shortMedia$title? title,
    Fragment$shortMedia$coverImage? coverImage,
    Fragment$shortMedia$trailer? trailer,
    List<Fragment$shortMedia$streamingEpisodes?>? streamingEpisodes,
    String? bannerImage,
    List<String?>? genres,
    bool? isAdult,
    int? episodes,
    List<String?>? synonyms,
    Fragment$shortMedia$nextAiringEpisode? nextAiringEpisode,
    Enum$MediaFormat? format,
    String? description,
    Enum$MediaSource? source,
    Fragment$shortMedia$studios? studios,
    String? countryOfOrigin,
    Fragment$shortMedia$startDate? startDate,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$shortMedia$title<TRes> get title =>
      CopyWith$Fragment$shortMedia$title.stub(_res);

  CopyWith$Fragment$shortMedia$coverImage<TRes> get coverImage =>
      CopyWith$Fragment$shortMedia$coverImage.stub(_res);

  CopyWith$Fragment$shortMedia$trailer<TRes> get trailer =>
      CopyWith$Fragment$shortMedia$trailer.stub(_res);

  streamingEpisodes(_fn) => _res;

  CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> get nextAiringEpisode =>
      CopyWith$Fragment$shortMedia$nextAiringEpisode.stub(_res);

  CopyWith$Fragment$shortMedia$studios<TRes> get studios =>
      CopyWith$Fragment$shortMedia$studios.stub(_res);

  CopyWith$Fragment$shortMedia$startDate<TRes> get startDate =>
      CopyWith$Fragment$shortMedia$startDate.stub(_res);
}

const fragmentDefinitionshortMedia = FragmentDefinitionNode(
  name: NameNode(value: 'shortMedia'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Media'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'idMal'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'siteUrl'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'season'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'seasonYear'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isFavourite'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'userPreferred'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'romaji'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'english'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'native'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'coverImage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'extraLarge'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'large'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'medium'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'color'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'trailer'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'site'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'thumbnail'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'streamingEpisodes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'title'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'thumbnail'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'url'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'site'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'bannerImage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'genres'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isAdult'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'episodes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'synonyms'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'nextAiringEpisode'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'airingAt'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'episode'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'format'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'source'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'studios'),
      alias: null,
      arguments: [
        ArgumentNode(
          name: NameNode(value: 'isMain'),
          value: BooleanValueNode(value: true),
        )
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'nodes'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
              name: NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: 'countryOfOrigin'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'startDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'year'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'month'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: 'day'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentshortMedia = DocumentNode(definitions: [
  fragmentDefinitionshortMedia,
]);

extension ClientExtension$Fragment$shortMedia on graphql.GraphQLClient {
  void writeFragment$shortMedia({
    required Fragment$shortMedia data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'shortMedia',
            document: documentNodeFragmentshortMedia,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$shortMedia? readFragment$shortMedia({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'shortMedia',
          document: documentNodeFragmentshortMedia,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$shortMedia.fromJson(result);
  }
}

class Fragment$shortMedia$title {
  Fragment$shortMedia$title({
    this.userPreferred,
    this.romaji,
    this.english,
    this.native,
    this.$__typename = 'MediaTitle',
  });

  factory Fragment$shortMedia$title.fromJson(Map<String, dynamic> json) {
    final l$userPreferred = json['userPreferred'];
    final l$romaji = json['romaji'];
    final l$english = json['english'];
    final l$native = json['native'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$title(
      userPreferred: (l$userPreferred as String?),
      romaji: (l$romaji as String?),
      english: (l$english as String?),
      native: (l$native as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? userPreferred;

  final String? romaji;

  final String? english;

  final String? native;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userPreferred = userPreferred;
    _resultData['userPreferred'] = l$userPreferred;
    final l$romaji = romaji;
    _resultData['romaji'] = l$romaji;
    final l$english = english;
    _resultData['english'] = l$english;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userPreferred = userPreferred;
    final l$romaji = romaji;
    final l$english = english;
    final l$native = native;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userPreferred,
      l$romaji,
      l$english,
      l$native,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$title) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userPreferred = userPreferred;
    final lOther$userPreferred = other.userPreferred;
    if (l$userPreferred != lOther$userPreferred) {
      return false;
    }
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) {
      return false;
    }
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$title
    on Fragment$shortMedia$title {
  CopyWith$Fragment$shortMedia$title<Fragment$shortMedia$title> get copyWith =>
      CopyWith$Fragment$shortMedia$title(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$shortMedia$title<TRes> {
  factory CopyWith$Fragment$shortMedia$title(
    Fragment$shortMedia$title instance,
    TRes Function(Fragment$shortMedia$title) then,
  ) = _CopyWithImpl$Fragment$shortMedia$title;

  factory CopyWith$Fragment$shortMedia$title.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$title;

  TRes call({
    String? userPreferred,
    String? romaji,
    String? english,
    String? native,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$title<TRes>
    implements CopyWith$Fragment$shortMedia$title<TRes> {
  _CopyWithImpl$Fragment$shortMedia$title(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$title _instance;

  final TRes Function(Fragment$shortMedia$title) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userPreferred = _undefined,
    Object? romaji = _undefined,
    Object? english = _undefined,
    Object? native = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$title(
        userPreferred: userPreferred == _undefined
            ? _instance.userPreferred
            : (userPreferred as String?),
        romaji: romaji == _undefined ? _instance.romaji : (romaji as String?),
        english:
            english == _undefined ? _instance.english : (english as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$title<TRes>
    implements CopyWith$Fragment$shortMedia$title<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$title(this._res);

  TRes _res;

  call({
    String? userPreferred,
    String? romaji,
    String? english,
    String? native,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$coverImage {
  Fragment$shortMedia$coverImage({
    this.extraLarge,
    this.large,
    this.medium,
    this.color,
    this.$__typename = 'MediaCoverImage',
  });

  factory Fragment$shortMedia$coverImage.fromJson(Map<String, dynamic> json) {
    final l$extraLarge = json['extraLarge'];
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$color = json['color'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$coverImage(
      extraLarge: (l$extraLarge as String?),
      large: (l$large as String?),
      medium: (l$medium as String?),
      color: (l$color as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? extraLarge;

  final String? large;

  final String? medium;

  final String? color;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$extraLarge = extraLarge;
    _resultData['extraLarge'] = l$extraLarge;
    final l$large = large;
    _resultData['large'] = l$large;
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$color = color;
    _resultData['color'] = l$color;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$extraLarge = extraLarge;
    final l$large = large;
    final l$medium = medium;
    final l$color = color;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$extraLarge,
      l$large,
      l$medium,
      l$color,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$coverImage) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$extraLarge = extraLarge;
    final lOther$extraLarge = other.extraLarge;
    if (l$extraLarge != lOther$extraLarge) {
      return false;
    }
    final l$large = large;
    final lOther$large = other.large;
    if (l$large != lOther$large) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) {
      return false;
    }
    final l$color = color;
    final lOther$color = other.color;
    if (l$color != lOther$color) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$coverImage
    on Fragment$shortMedia$coverImage {
  CopyWith$Fragment$shortMedia$coverImage<Fragment$shortMedia$coverImage>
      get copyWith => CopyWith$Fragment$shortMedia$coverImage(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$coverImage<TRes> {
  factory CopyWith$Fragment$shortMedia$coverImage(
    Fragment$shortMedia$coverImage instance,
    TRes Function(Fragment$shortMedia$coverImage) then,
  ) = _CopyWithImpl$Fragment$shortMedia$coverImage;

  factory CopyWith$Fragment$shortMedia$coverImage.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$coverImage;

  TRes call({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$coverImage<TRes>
    implements CopyWith$Fragment$shortMedia$coverImage<TRes> {
  _CopyWithImpl$Fragment$shortMedia$coverImage(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$coverImage _instance;

  final TRes Function(Fragment$shortMedia$coverImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? extraLarge = _undefined,
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? color = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$coverImage(
        extraLarge: extraLarge == _undefined
            ? _instance.extraLarge
            : (extraLarge as String?),
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        color: color == _undefined ? _instance.color : (color as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$coverImage<TRes>
    implements CopyWith$Fragment$shortMedia$coverImage<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$coverImage(this._res);

  TRes _res;

  call({
    String? extraLarge,
    String? large,
    String? medium,
    String? color,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$trailer {
  Fragment$shortMedia$trailer({
    this.id,
    this.site,
    this.thumbnail,
    this.$__typename = 'MediaTrailer',
  });

  factory Fragment$shortMedia$trailer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$site = json['site'];
    final l$thumbnail = json['thumbnail'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$trailer(
      id: (l$id as String?),
      site: (l$site as String?),
      thumbnail: (l$thumbnail as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? site;

  final String? thumbnail;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$site = site;
    _resultData['site'] = l$site;
    final l$thumbnail = thumbnail;
    _resultData['thumbnail'] = l$thumbnail;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$site = site;
    final l$thumbnail = thumbnail;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$site,
      l$thumbnail,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$trailer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$site = site;
    final lOther$site = other.site;
    if (l$site != lOther$site) {
      return false;
    }
    final l$thumbnail = thumbnail;
    final lOther$thumbnail = other.thumbnail;
    if (l$thumbnail != lOther$thumbnail) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$trailer
    on Fragment$shortMedia$trailer {
  CopyWith$Fragment$shortMedia$trailer<Fragment$shortMedia$trailer>
      get copyWith => CopyWith$Fragment$shortMedia$trailer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$trailer<TRes> {
  factory CopyWith$Fragment$shortMedia$trailer(
    Fragment$shortMedia$trailer instance,
    TRes Function(Fragment$shortMedia$trailer) then,
  ) = _CopyWithImpl$Fragment$shortMedia$trailer;

  factory CopyWith$Fragment$shortMedia$trailer.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$trailer;

  TRes call({
    String? id,
    String? site,
    String? thumbnail,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$trailer<TRes>
    implements CopyWith$Fragment$shortMedia$trailer<TRes> {
  _CopyWithImpl$Fragment$shortMedia$trailer(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$trailer _instance;

  final TRes Function(Fragment$shortMedia$trailer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? site = _undefined,
    Object? thumbnail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$trailer(
        id: id == _undefined ? _instance.id : (id as String?),
        site: site == _undefined ? _instance.site : (site as String?),
        thumbnail: thumbnail == _undefined
            ? _instance.thumbnail
            : (thumbnail as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$trailer<TRes>
    implements CopyWith$Fragment$shortMedia$trailer<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$trailer(this._res);

  TRes _res;

  call({
    String? id,
    String? site,
    String? thumbnail,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$streamingEpisodes {
  Fragment$shortMedia$streamingEpisodes({
    this.title,
    this.thumbnail,
    this.url,
    this.site,
    this.$__typename = 'MediaStreamingEpisode',
  });

  factory Fragment$shortMedia$streamingEpisodes.fromJson(
      Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$thumbnail = json['thumbnail'];
    final l$url = json['url'];
    final l$site = json['site'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$streamingEpisodes(
      title: (l$title as String?),
      thumbnail: (l$thumbnail as String?),
      url: (l$url as String?),
      site: (l$site as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? title;

  final String? thumbnail;

  final String? url;

  final String? site;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$title = title;
    _resultData['title'] = l$title;
    final l$thumbnail = thumbnail;
    _resultData['thumbnail'] = l$thumbnail;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$site = site;
    _resultData['site'] = l$site;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$thumbnail = thumbnail;
    final l$url = url;
    final l$site = site;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$title,
      l$thumbnail,
      l$url,
      l$site,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$streamingEpisodes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$thumbnail = thumbnail;
    final lOther$thumbnail = other.thumbnail;
    if (l$thumbnail != lOther$thumbnail) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$site = site;
    final lOther$site = other.site;
    if (l$site != lOther$site) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$streamingEpisodes
    on Fragment$shortMedia$streamingEpisodes {
  CopyWith$Fragment$shortMedia$streamingEpisodes<
          Fragment$shortMedia$streamingEpisodes>
      get copyWith => CopyWith$Fragment$shortMedia$streamingEpisodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$streamingEpisodes<TRes> {
  factory CopyWith$Fragment$shortMedia$streamingEpisodes(
    Fragment$shortMedia$streamingEpisodes instance,
    TRes Function(Fragment$shortMedia$streamingEpisodes) then,
  ) = _CopyWithImpl$Fragment$shortMedia$streamingEpisodes;

  factory CopyWith$Fragment$shortMedia$streamingEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$streamingEpisodes;

  TRes call({
    String? title,
    String? thumbnail,
    String? url,
    String? site,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$streamingEpisodes<TRes>
    implements CopyWith$Fragment$shortMedia$streamingEpisodes<TRes> {
  _CopyWithImpl$Fragment$shortMedia$streamingEpisodes(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$streamingEpisodes _instance;

  final TRes Function(Fragment$shortMedia$streamingEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? thumbnail = _undefined,
    Object? url = _undefined,
    Object? site = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$streamingEpisodes(
        title: title == _undefined ? _instance.title : (title as String?),
        thumbnail: thumbnail == _undefined
            ? _instance.thumbnail
            : (thumbnail as String?),
        url: url == _undefined ? _instance.url : (url as String?),
        site: site == _undefined ? _instance.site : (site as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$streamingEpisodes<TRes>
    implements CopyWith$Fragment$shortMedia$streamingEpisodes<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$streamingEpisodes(this._res);

  TRes _res;

  call({
    String? title,
    String? thumbnail,
    String? url,
    String? site,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$nextAiringEpisode {
  Fragment$shortMedia$nextAiringEpisode({
    required this.airingAt,
    required this.episode,
    this.$__typename = 'AiringSchedule',
  });

  factory Fragment$shortMedia$nextAiringEpisode.fromJson(
      Map<String, dynamic> json) {
    final l$airingAt = json['airingAt'];
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$nextAiringEpisode(
      airingAt: (l$airingAt as int),
      episode: (l$episode as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int airingAt;

  final int episode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$airingAt = airingAt;
    _resultData['airingAt'] = l$airingAt;
    final l$episode = episode;
    _resultData['episode'] = l$episode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$airingAt = airingAt;
    final l$episode = episode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$airingAt,
      l$episode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$nextAiringEpisode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$airingAt = airingAt;
    final lOther$airingAt = other.airingAt;
    if (l$airingAt != lOther$airingAt) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$nextAiringEpisode
    on Fragment$shortMedia$nextAiringEpisode {
  CopyWith$Fragment$shortMedia$nextAiringEpisode<
          Fragment$shortMedia$nextAiringEpisode>
      get copyWith => CopyWith$Fragment$shortMedia$nextAiringEpisode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> {
  factory CopyWith$Fragment$shortMedia$nextAiringEpisode(
    Fragment$shortMedia$nextAiringEpisode instance,
    TRes Function(Fragment$shortMedia$nextAiringEpisode) then,
  ) = _CopyWithImpl$Fragment$shortMedia$nextAiringEpisode;

  factory CopyWith$Fragment$shortMedia$nextAiringEpisode.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$nextAiringEpisode;

  TRes call({
    int? airingAt,
    int? episode,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$nextAiringEpisode<TRes>
    implements CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> {
  _CopyWithImpl$Fragment$shortMedia$nextAiringEpisode(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$nextAiringEpisode _instance;

  final TRes Function(Fragment$shortMedia$nextAiringEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? airingAt = _undefined,
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$nextAiringEpisode(
        airingAt: airingAt == _undefined || airingAt == null
            ? _instance.airingAt
            : (airingAt as int),
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$nextAiringEpisode<TRes>
    implements CopyWith$Fragment$shortMedia$nextAiringEpisode<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$nextAiringEpisode(this._res);

  TRes _res;

  call({
    int? airingAt,
    int? episode,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$studios {
  Fragment$shortMedia$studios({
    this.nodes,
    this.$__typename = 'StudioConnection',
  });

  factory Fragment$shortMedia$studios.fromJson(Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$studios(
      nodes: (l$nodes as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$shortMedia$studios$nodes.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$shortMedia$studios$nodes?>? nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$nodes == null ? null : Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$studios) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes != null && lOther$nodes != null) {
      if (l$nodes.length != lOther$nodes.length) {
        return false;
      }
      for (int i = 0; i < l$nodes.length; i++) {
        final l$nodes$entry = l$nodes[i];
        final lOther$nodes$entry = lOther$nodes[i];
        if (l$nodes$entry != lOther$nodes$entry) {
          return false;
        }
      }
    } else if (l$nodes != lOther$nodes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$studios
    on Fragment$shortMedia$studios {
  CopyWith$Fragment$shortMedia$studios<Fragment$shortMedia$studios>
      get copyWith => CopyWith$Fragment$shortMedia$studios(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$studios<TRes> {
  factory CopyWith$Fragment$shortMedia$studios(
    Fragment$shortMedia$studios instance,
    TRes Function(Fragment$shortMedia$studios) then,
  ) = _CopyWithImpl$Fragment$shortMedia$studios;

  factory CopyWith$Fragment$shortMedia$studios.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$studios;

  TRes call({
    List<Fragment$shortMedia$studios$nodes?>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Fragment$shortMedia$studios$nodes?>? Function(
              Iterable<
                  CopyWith$Fragment$shortMedia$studios$nodes<
                      Fragment$shortMedia$studios$nodes>?>?)
          _fn);
}

class _CopyWithImpl$Fragment$shortMedia$studios<TRes>
    implements CopyWith$Fragment$shortMedia$studios<TRes> {
  _CopyWithImpl$Fragment$shortMedia$studios(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$studios _instance;

  final TRes Function(Fragment$shortMedia$studios) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$studios(
        nodes: nodes == _undefined
            ? _instance.nodes
            : (nodes as List<Fragment$shortMedia$studios$nodes?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes nodes(
          Iterable<Fragment$shortMedia$studios$nodes?>? Function(
                  Iterable<
                      CopyWith$Fragment$shortMedia$studios$nodes<
                          Fragment$shortMedia$studios$nodes>?>?)
              _fn) =>
      call(
          nodes: _fn(_instance.nodes?.map((e) => e == null
              ? null
              : CopyWith$Fragment$shortMedia$studios$nodes(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Fragment$shortMedia$studios<TRes>
    implements CopyWith$Fragment$shortMedia$studios<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$studios(this._res);

  TRes _res;

  call({
    List<Fragment$shortMedia$studios$nodes?>? nodes,
    String? $__typename,
  }) =>
      _res;

  nodes(_fn) => _res;
}

class Fragment$shortMedia$studios$nodes {
  Fragment$shortMedia$studios$nodes({
    required this.name,
    this.$__typename = 'Studio',
  });

  factory Fragment$shortMedia$studios$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$studios$nodes(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$studios$nodes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$studios$nodes
    on Fragment$shortMedia$studios$nodes {
  CopyWith$Fragment$shortMedia$studios$nodes<Fragment$shortMedia$studios$nodes>
      get copyWith => CopyWith$Fragment$shortMedia$studios$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$studios$nodes<TRes> {
  factory CopyWith$Fragment$shortMedia$studios$nodes(
    Fragment$shortMedia$studios$nodes instance,
    TRes Function(Fragment$shortMedia$studios$nodes) then,
  ) = _CopyWithImpl$Fragment$shortMedia$studios$nodes;

  factory CopyWith$Fragment$shortMedia$studios$nodes.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$studios$nodes;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$studios$nodes<TRes>
    implements CopyWith$Fragment$shortMedia$studios$nodes<TRes> {
  _CopyWithImpl$Fragment$shortMedia$studios$nodes(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$studios$nodes _instance;

  final TRes Function(Fragment$shortMedia$studios$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$studios$nodes(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$studios$nodes<TRes>
    implements CopyWith$Fragment$shortMedia$studios$nodes<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$studios$nodes(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$shortMedia$startDate {
  Fragment$shortMedia$startDate({
    this.year,
    this.month,
    this.day,
    this.$__typename = 'FuzzyDate',
  });

  factory Fragment$shortMedia$startDate.fromJson(Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Fragment$shortMedia$startDate(
      year: (l$year as int?),
      month: (l$month as int?),
      day: (l$day as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? year;

  final int? month;

  final int? day;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$year = year;
    _resultData['year'] = l$year;
    final l$month = month;
    _resultData['month'] = l$month;
    final l$day = day;
    _resultData['day'] = l$day;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$year,
      l$month,
      l$day,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$shortMedia$startDate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$shortMedia$startDate
    on Fragment$shortMedia$startDate {
  CopyWith$Fragment$shortMedia$startDate<Fragment$shortMedia$startDate>
      get copyWith => CopyWith$Fragment$shortMedia$startDate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$shortMedia$startDate<TRes> {
  factory CopyWith$Fragment$shortMedia$startDate(
    Fragment$shortMedia$startDate instance,
    TRes Function(Fragment$shortMedia$startDate) then,
  ) = _CopyWithImpl$Fragment$shortMedia$startDate;

  factory CopyWith$Fragment$shortMedia$startDate.stub(TRes res) =
      _CopyWithStubImpl$Fragment$shortMedia$startDate;

  TRes call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$shortMedia$startDate<TRes>
    implements CopyWith$Fragment$shortMedia$startDate<TRes> {
  _CopyWithImpl$Fragment$shortMedia$startDate(
    this._instance,
    this._then,
  );

  final Fragment$shortMedia$startDate _instance;

  final TRes Function(Fragment$shortMedia$startDate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$shortMedia$startDate(
        year: year == _undefined ? _instance.year : (year as int?),
        month: month == _undefined ? _instance.month : (month as int?),
        day: day == _undefined ? _instance.day : (day as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$shortMedia$startDate<TRes>
    implements CopyWith$Fragment$shortMedia$startDate<TRes> {
  _CopyWithStubImpl$Fragment$shortMedia$startDate(this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  }) =>
      _res;
}
