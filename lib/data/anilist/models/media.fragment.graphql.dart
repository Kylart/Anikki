import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.graphql.dart';

class Fragment$media {
  Fragment$media({
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
    this.countryOfOrigin,
    this.$__typename = 'Media',
  });

  factory Fragment$media.fromJson(Map<String, dynamic> json) {
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
    final l$countryOfOrigin = json['countryOfOrigin'];
    final l$$__typename = json['__typename'];
    return Fragment$media(
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
          : Fragment$media$title.fromJson((l$title as Map<String, dynamic>)),
      coverImage: l$coverImage == null
          ? null
          : Fragment$media$coverImage.fromJson(
              (l$coverImage as Map<String, dynamic>)),
      trailer: l$trailer == null
          ? null
          : Fragment$media$trailer.fromJson(
              (l$trailer as Map<String, dynamic>)),
      streamingEpisodes: (l$streamingEpisodes as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$media$streamingEpisodes.fromJson(
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
          : Fragment$media$nextAiringEpisode.fromJson(
              (l$nextAiringEpisode as Map<String, dynamic>)),
      format: l$format == null
          ? null
          : fromJson$Enum$MediaFormat((l$format as String)),
      description: (l$description as String?),
      countryOfOrigin: (l$countryOfOrigin as String?),
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

  final Fragment$media$title? title;

  final Fragment$media$coverImage? coverImage;

  final Fragment$media$trailer? trailer;

  final List<Fragment$media$streamingEpisodes?>? streamingEpisodes;

  final String? bannerImage;

  final List<String?>? genres;

  final bool? isAdult;

  final int? episodes;

  final List<String?>? synonyms;

  final Fragment$media$nextAiringEpisode? nextAiringEpisode;

  final Enum$MediaFormat? format;

  final String? description;

  final String? countryOfOrigin;

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
    final l$countryOfOrigin = countryOfOrigin;
    _resultData['countryOfOrigin'] = l$countryOfOrigin;
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
    final l$countryOfOrigin = countryOfOrigin;
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
      l$countryOfOrigin,
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
    final l$countryOfOrigin = countryOfOrigin;
    final lOther$countryOfOrigin = other.countryOfOrigin;
    if (l$countryOfOrigin != lOther$countryOfOrigin) {
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
    int? id,
    int? idMal,
    String? siteUrl,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    bool? isFavourite,
    Fragment$media$title? title,
    Fragment$media$coverImage? coverImage,
    Fragment$media$trailer? trailer,
    List<Fragment$media$streamingEpisodes?>? streamingEpisodes,
    String? bannerImage,
    List<String?>? genres,
    bool? isAdult,
    int? episodes,
    List<String?>? synonyms,
    Fragment$media$nextAiringEpisode? nextAiringEpisode,
    Enum$MediaFormat? format,
    String? description,
    String? countryOfOrigin,
    String? $__typename,
  });
  CopyWith$Fragment$media$title<TRes> get title;
  CopyWith$Fragment$media$coverImage<TRes> get coverImage;
  CopyWith$Fragment$media$trailer<TRes> get trailer;
  TRes streamingEpisodes(
      Iterable<Fragment$media$streamingEpisodes?>? Function(
              Iterable<
                  CopyWith$Fragment$media$streamingEpisodes<
                      Fragment$media$streamingEpisodes>?>?)
          _fn);
  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode;
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
    Object? countryOfOrigin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media(
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
            : (title as Fragment$media$title?),
        coverImage: coverImage == _undefined
            ? _instance.coverImage
            : (coverImage as Fragment$media$coverImage?),
        trailer: trailer == _undefined
            ? _instance.trailer
            : (trailer as Fragment$media$trailer?),
        streamingEpisodes: streamingEpisodes == _undefined
            ? _instance.streamingEpisodes
            : (streamingEpisodes as List<Fragment$media$streamingEpisodes?>?),
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
            : (nextAiringEpisode as Fragment$media$nextAiringEpisode?),
        format: format == _undefined
            ? _instance.format
            : (format as Enum$MediaFormat?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        countryOfOrigin: countryOfOrigin == _undefined
            ? _instance.countryOfOrigin
            : (countryOfOrigin as String?),
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

  CopyWith$Fragment$media$trailer<TRes> get trailer {
    final local$trailer = _instance.trailer;
    return local$trailer == null
        ? CopyWith$Fragment$media$trailer.stub(_then(_instance))
        : CopyWith$Fragment$media$trailer(
            local$trailer, (e) => call(trailer: e));
  }

  TRes streamingEpisodes(
          Iterable<Fragment$media$streamingEpisodes?>? Function(
                  Iterable<
                      CopyWith$Fragment$media$streamingEpisodes<
                          Fragment$media$streamingEpisodes>?>?)
              _fn) =>
      call(
          streamingEpisodes:
              _fn(_instance.streamingEpisodes?.map((e) => e == null
                  ? null
                  : CopyWith$Fragment$media$streamingEpisodes(
                      e,
                      (i) => i,
                    )))?.toList());

  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode {
    final local$nextAiringEpisode = _instance.nextAiringEpisode;
    return local$nextAiringEpisode == null
        ? CopyWith$Fragment$media$nextAiringEpisode.stub(_then(_instance))
        : CopyWith$Fragment$media$nextAiringEpisode(
            local$nextAiringEpisode, (e) => call(nextAiringEpisode: e));
  }
}

class _CopyWithStubImpl$Fragment$media<TRes>
    implements CopyWith$Fragment$media<TRes> {
  _CopyWithStubImpl$Fragment$media(this._res);

  TRes _res;

  call({
    int? id,
    int? idMal,
    String? siteUrl,
    Enum$MediaSeason? season,
    int? seasonYear,
    Enum$MediaStatus? status,
    bool? isFavourite,
    Fragment$media$title? title,
    Fragment$media$coverImage? coverImage,
    Fragment$media$trailer? trailer,
    List<Fragment$media$streamingEpisodes?>? streamingEpisodes,
    String? bannerImage,
    List<String?>? genres,
    bool? isAdult,
    int? episodes,
    List<String?>? synonyms,
    Fragment$media$nextAiringEpisode? nextAiringEpisode,
    Enum$MediaFormat? format,
    String? description,
    String? countryOfOrigin,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$media$title<TRes> get title =>
      CopyWith$Fragment$media$title.stub(_res);

  CopyWith$Fragment$media$coverImage<TRes> get coverImage =>
      CopyWith$Fragment$media$coverImage.stub(_res);

  CopyWith$Fragment$media$trailer<TRes> get trailer =>
      CopyWith$Fragment$media$trailer.stub(_res);

  streamingEpisodes(_fn) => _res;

  CopyWith$Fragment$media$nextAiringEpisode<TRes> get nextAiringEpisode =>
      CopyWith$Fragment$media$nextAiringEpisode.stub(_res);
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
      name: NameNode(value: 'countryOfOrigin'),
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

class Fragment$media$trailer {
  Fragment$media$trailer({
    this.id,
    this.site,
    this.thumbnail,
    this.$__typename = 'MediaTrailer',
  });

  factory Fragment$media$trailer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$site = json['site'];
    final l$thumbnail = json['thumbnail'];
    final l$$__typename = json['__typename'];
    return Fragment$media$trailer(
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
    if (!(other is Fragment$media$trailer) ||
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

extension UtilityExtension$Fragment$media$trailer on Fragment$media$trailer {
  CopyWith$Fragment$media$trailer<Fragment$media$trailer> get copyWith =>
      CopyWith$Fragment$media$trailer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$media$trailer<TRes> {
  factory CopyWith$Fragment$media$trailer(
    Fragment$media$trailer instance,
    TRes Function(Fragment$media$trailer) then,
  ) = _CopyWithImpl$Fragment$media$trailer;

  factory CopyWith$Fragment$media$trailer.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$trailer;

  TRes call({
    String? id,
    String? site,
    String? thumbnail,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$trailer<TRes>
    implements CopyWith$Fragment$media$trailer<TRes> {
  _CopyWithImpl$Fragment$media$trailer(
    this._instance,
    this._then,
  );

  final Fragment$media$trailer _instance;

  final TRes Function(Fragment$media$trailer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? site = _undefined,
    Object? thumbnail = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$trailer(
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

class _CopyWithStubImpl$Fragment$media$trailer<TRes>
    implements CopyWith$Fragment$media$trailer<TRes> {
  _CopyWithStubImpl$Fragment$media$trailer(this._res);

  TRes _res;

  call({
    String? id,
    String? site,
    String? thumbnail,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$media$streamingEpisodes {
  Fragment$media$streamingEpisodes({
    this.title,
    this.thumbnail,
    this.url,
    this.site,
    this.$__typename = 'MediaStreamingEpisode',
  });

  factory Fragment$media$streamingEpisodes.fromJson(Map<String, dynamic> json) {
    final l$title = json['title'];
    final l$thumbnail = json['thumbnail'];
    final l$url = json['url'];
    final l$site = json['site'];
    final l$$__typename = json['__typename'];
    return Fragment$media$streamingEpisodes(
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
    if (!(other is Fragment$media$streamingEpisodes) ||
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

extension UtilityExtension$Fragment$media$streamingEpisodes
    on Fragment$media$streamingEpisodes {
  CopyWith$Fragment$media$streamingEpisodes<Fragment$media$streamingEpisodes>
      get copyWith => CopyWith$Fragment$media$streamingEpisodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$media$streamingEpisodes<TRes> {
  factory CopyWith$Fragment$media$streamingEpisodes(
    Fragment$media$streamingEpisodes instance,
    TRes Function(Fragment$media$streamingEpisodes) then,
  ) = _CopyWithImpl$Fragment$media$streamingEpisodes;

  factory CopyWith$Fragment$media$streamingEpisodes.stub(TRes res) =
      _CopyWithStubImpl$Fragment$media$streamingEpisodes;

  TRes call({
    String? title,
    String? thumbnail,
    String? url,
    String? site,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$media$streamingEpisodes<TRes>
    implements CopyWith$Fragment$media$streamingEpisodes<TRes> {
  _CopyWithImpl$Fragment$media$streamingEpisodes(
    this._instance,
    this._then,
  );

  final Fragment$media$streamingEpisodes _instance;

  final TRes Function(Fragment$media$streamingEpisodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? thumbnail = _undefined,
    Object? url = _undefined,
    Object? site = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$streamingEpisodes(
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

class _CopyWithStubImpl$Fragment$media$streamingEpisodes<TRes>
    implements CopyWith$Fragment$media$streamingEpisodes<TRes> {
  _CopyWithStubImpl$Fragment$media$streamingEpisodes(this._res);

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

class Fragment$media$nextAiringEpisode {
  Fragment$media$nextAiringEpisode({
    required this.airingAt,
    required this.episode,
    this.$__typename = 'AiringSchedule',
  });

  factory Fragment$media$nextAiringEpisode.fromJson(Map<String, dynamic> json) {
    final l$airingAt = json['airingAt'];
    final l$episode = json['episode'];
    final l$$__typename = json['__typename'];
    return Fragment$media$nextAiringEpisode(
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
    if (!(other is Fragment$media$nextAiringEpisode) ||
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
    Object? episode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$media$nextAiringEpisode(
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

class _CopyWithStubImpl$Fragment$media$nextAiringEpisode<TRes>
    implements CopyWith$Fragment$media$nextAiringEpisode<TRes> {
  _CopyWithStubImpl$Fragment$media$nextAiringEpisode(this._res);

  TRes _res;

  call({
    int? airingAt,
    int? episode,
    String? $__typename,
  }) =>
      _res;
}
