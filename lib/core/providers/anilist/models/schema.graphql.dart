class Input$AiringScheduleInput {
  factory Input$AiringScheduleInput({
    int? airingAt,
    int? episode,
    int? timeUntilAiring,
  }) =>
      Input$AiringScheduleInput._({
        if (airingAt != null) r'airingAt': airingAt,
        if (episode != null) r'episode': episode,
        if (timeUntilAiring != null) r'timeUntilAiring': timeUntilAiring,
      });

  Input$AiringScheduleInput._(this._$data);

  factory Input$AiringScheduleInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('airingAt')) {
      final l$airingAt = data['airingAt'];
      result$data['airingAt'] = (l$airingAt as int?);
    }
    if (data.containsKey('episode')) {
      final l$episode = data['episode'];
      result$data['episode'] = (l$episode as int?);
    }
    if (data.containsKey('timeUntilAiring')) {
      final l$timeUntilAiring = data['timeUntilAiring'];
      result$data['timeUntilAiring'] = (l$timeUntilAiring as int?);
    }
    return Input$AiringScheduleInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get airingAt => (_$data['airingAt'] as int?);
  int? get episode => (_$data['episode'] as int?);
  int? get timeUntilAiring => (_$data['timeUntilAiring'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('airingAt')) {
      final l$airingAt = airingAt;
      result$data['airingAt'] = l$airingAt;
    }
    if (_$data.containsKey('episode')) {
      final l$episode = episode;
      result$data['episode'] = l$episode;
    }
    if (_$data.containsKey('timeUntilAiring')) {
      final l$timeUntilAiring = timeUntilAiring;
      result$data['timeUntilAiring'] = l$timeUntilAiring;
    }
    return result$data;
  }

  CopyWith$Input$AiringScheduleInput<Input$AiringScheduleInput> get copyWith =>
      CopyWith$Input$AiringScheduleInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$AiringScheduleInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$airingAt = airingAt;
    final lOther$airingAt = other.airingAt;
    if (_$data.containsKey('airingAt') !=
        other._$data.containsKey('airingAt')) {
      return false;
    }
    if (l$airingAt != lOther$airingAt) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (_$data.containsKey('episode') != other._$data.containsKey('episode')) {
      return false;
    }
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$timeUntilAiring = timeUntilAiring;
    final lOther$timeUntilAiring = other.timeUntilAiring;
    if (_$data.containsKey('timeUntilAiring') !=
        other._$data.containsKey('timeUntilAiring')) {
      return false;
    }
    if (l$timeUntilAiring != lOther$timeUntilAiring) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$airingAt = airingAt;
    final l$episode = episode;
    final l$timeUntilAiring = timeUntilAiring;
    return Object.hashAll([
      _$data.containsKey('airingAt') ? l$airingAt : const {},
      _$data.containsKey('episode') ? l$episode : const {},
      _$data.containsKey('timeUntilAiring') ? l$timeUntilAiring : const {},
    ]);
  }
}

abstract class CopyWith$Input$AiringScheduleInput<TRes> {
  factory CopyWith$Input$AiringScheduleInput(
    Input$AiringScheduleInput instance,
    TRes Function(Input$AiringScheduleInput) then,
  ) = _CopyWithImpl$Input$AiringScheduleInput;

  factory CopyWith$Input$AiringScheduleInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AiringScheduleInput;

  TRes call({
    int? airingAt,
    int? episode,
    int? timeUntilAiring,
  });
}

class _CopyWithImpl$Input$AiringScheduleInput<TRes>
    implements CopyWith$Input$AiringScheduleInput<TRes> {
  _CopyWithImpl$Input$AiringScheduleInput(
    this._instance,
    this._then,
  );

  final Input$AiringScheduleInput _instance;

  final TRes Function(Input$AiringScheduleInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? airingAt = _undefined,
    Object? episode = _undefined,
    Object? timeUntilAiring = _undefined,
  }) =>
      _then(Input$AiringScheduleInput._({
        ..._instance._$data,
        if (airingAt != _undefined) 'airingAt': (airingAt as int?),
        if (episode != _undefined) 'episode': (episode as int?),
        if (timeUntilAiring != _undefined)
          'timeUntilAiring': (timeUntilAiring as int?),
      }));
}

class _CopyWithStubImpl$Input$AiringScheduleInput<TRes>
    implements CopyWith$Input$AiringScheduleInput<TRes> {
  _CopyWithStubImpl$Input$AiringScheduleInput(this._res);

  TRes _res;

  call({
    int? airingAt,
    int? episode,
    int? timeUntilAiring,
  }) =>
      _res;
}

class Input$AniChartHighlightInput {
  factory Input$AniChartHighlightInput({
    int? mediaId,
    String? highlight,
  }) =>
      Input$AniChartHighlightInput._({
        if (mediaId != null) r'mediaId': mediaId,
        if (highlight != null) r'highlight': highlight,
      });

  Input$AniChartHighlightInput._(this._$data);

  factory Input$AniChartHighlightInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('mediaId')) {
      final l$mediaId = data['mediaId'];
      result$data['mediaId'] = (l$mediaId as int?);
    }
    if (data.containsKey('highlight')) {
      final l$highlight = data['highlight'];
      result$data['highlight'] = (l$highlight as String?);
    }
    return Input$AniChartHighlightInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get mediaId => (_$data['mediaId'] as int?);
  String? get highlight => (_$data['highlight'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('mediaId')) {
      final l$mediaId = mediaId;
      result$data['mediaId'] = l$mediaId;
    }
    if (_$data.containsKey('highlight')) {
      final l$highlight = highlight;
      result$data['highlight'] = l$highlight;
    }
    return result$data;
  }

  CopyWith$Input$AniChartHighlightInput<Input$AniChartHighlightInput>
      get copyWith => CopyWith$Input$AniChartHighlightInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$AniChartHighlightInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (_$data.containsKey('mediaId') != other._$data.containsKey('mediaId')) {
      return false;
    }
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    final l$highlight = highlight;
    final lOther$highlight = other.highlight;
    if (_$data.containsKey('highlight') !=
        other._$data.containsKey('highlight')) {
      return false;
    }
    if (l$highlight != lOther$highlight) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mediaId = mediaId;
    final l$highlight = highlight;
    return Object.hashAll([
      _$data.containsKey('mediaId') ? l$mediaId : const {},
      _$data.containsKey('highlight') ? l$highlight : const {},
    ]);
  }
}

abstract class CopyWith$Input$AniChartHighlightInput<TRes> {
  factory CopyWith$Input$AniChartHighlightInput(
    Input$AniChartHighlightInput instance,
    TRes Function(Input$AniChartHighlightInput) then,
  ) = _CopyWithImpl$Input$AniChartHighlightInput;

  factory CopyWith$Input$AniChartHighlightInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AniChartHighlightInput;

  TRes call({
    int? mediaId,
    String? highlight,
  });
}

class _CopyWithImpl$Input$AniChartHighlightInput<TRes>
    implements CopyWith$Input$AniChartHighlightInput<TRes> {
  _CopyWithImpl$Input$AniChartHighlightInput(
    this._instance,
    this._then,
  );

  final Input$AniChartHighlightInput _instance;

  final TRes Function(Input$AniChartHighlightInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mediaId = _undefined,
    Object? highlight = _undefined,
  }) =>
      _then(Input$AniChartHighlightInput._({
        ..._instance._$data,
        if (mediaId != _undefined) 'mediaId': (mediaId as int?),
        if (highlight != _undefined) 'highlight': (highlight as String?),
      }));
}

class _CopyWithStubImpl$Input$AniChartHighlightInput<TRes>
    implements CopyWith$Input$AniChartHighlightInput<TRes> {
  _CopyWithStubImpl$Input$AniChartHighlightInput(this._res);

  TRes _res;

  call({
    int? mediaId,
    String? highlight,
  }) =>
      _res;
}

class Input$CharacterNameInput {
  factory Input$CharacterNameInput({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
    List<String?>? alternativeSpoiler,
  }) =>
      Input$CharacterNameInput._({
        if (first != null) r'first': first,
        if (middle != null) r'middle': middle,
        if (last != null) r'last': last,
        if (native != null) r'native': native,
        if (alternative != null) r'alternative': alternative,
        if (alternativeSpoiler != null)
          r'alternativeSpoiler': alternativeSpoiler,
      });

  Input$CharacterNameInput._(this._$data);

  factory Input$CharacterNameInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as String?);
    }
    if (data.containsKey('middle')) {
      final l$middle = data['middle'];
      result$data['middle'] = (l$middle as String?);
    }
    if (data.containsKey('last')) {
      final l$last = data['last'];
      result$data['last'] = (l$last as String?);
    }
    if (data.containsKey('native')) {
      final l$native = data['native'];
      result$data['native'] = (l$native as String?);
    }
    if (data.containsKey('alternative')) {
      final l$alternative = data['alternative'];
      result$data['alternative'] = (l$alternative as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('alternativeSpoiler')) {
      final l$alternativeSpoiler = data['alternativeSpoiler'];
      result$data['alternativeSpoiler'] =
          (l$alternativeSpoiler as List<dynamic>?)
              ?.map((e) => (e as String?))
              .toList();
    }
    return Input$CharacterNameInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get first => (_$data['first'] as String?);
  String? get middle => (_$data['middle'] as String?);
  String? get last => (_$data['last'] as String?);
  String? get native => (_$data['native'] as String?);
  List<String?>? get alternative => (_$data['alternative'] as List<String?>?);
  List<String?>? get alternativeSpoiler =>
      (_$data['alternativeSpoiler'] as List<String?>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('middle')) {
      final l$middle = middle;
      result$data['middle'] = l$middle;
    }
    if (_$data.containsKey('last')) {
      final l$last = last;
      result$data['last'] = l$last;
    }
    if (_$data.containsKey('native')) {
      final l$native = native;
      result$data['native'] = l$native;
    }
    if (_$data.containsKey('alternative')) {
      final l$alternative = alternative;
      result$data['alternative'] = l$alternative?.map((e) => e).toList();
    }
    if (_$data.containsKey('alternativeSpoiler')) {
      final l$alternativeSpoiler = alternativeSpoiler;
      result$data['alternativeSpoiler'] =
          l$alternativeSpoiler?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$CharacterNameInput<Input$CharacterNameInput> get copyWith =>
      CopyWith$Input$CharacterNameInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CharacterNameInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$middle = middle;
    final lOther$middle = other.middle;
    if (_$data.containsKey('middle') != other._$data.containsKey('middle')) {
      return false;
    }
    if (l$middle != lOther$middle) {
      return false;
    }
    final l$last = last;
    final lOther$last = other.last;
    if (_$data.containsKey('last') != other._$data.containsKey('last')) {
      return false;
    }
    if (l$last != lOther$last) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (_$data.containsKey('native') != other._$data.containsKey('native')) {
      return false;
    }
    if (l$native != lOther$native) {
      return false;
    }
    final l$alternative = alternative;
    final lOther$alternative = other.alternative;
    if (_$data.containsKey('alternative') !=
        other._$data.containsKey('alternative')) {
      return false;
    }
    if (l$alternative != null && lOther$alternative != null) {
      if (l$alternative.length != lOther$alternative.length) {
        return false;
      }
      for (int i = 0; i < l$alternative.length; i++) {
        final l$alternative$entry = l$alternative[i];
        final lOther$alternative$entry = lOther$alternative[i];
        if (l$alternative$entry != lOther$alternative$entry) {
          return false;
        }
      }
    } else if (l$alternative != lOther$alternative) {
      return false;
    }
    final l$alternativeSpoiler = alternativeSpoiler;
    final lOther$alternativeSpoiler = other.alternativeSpoiler;
    if (_$data.containsKey('alternativeSpoiler') !=
        other._$data.containsKey('alternativeSpoiler')) {
      return false;
    }
    if (l$alternativeSpoiler != null && lOther$alternativeSpoiler != null) {
      if (l$alternativeSpoiler.length != lOther$alternativeSpoiler.length) {
        return false;
      }
      for (int i = 0; i < l$alternativeSpoiler.length; i++) {
        final l$alternativeSpoiler$entry = l$alternativeSpoiler[i];
        final lOther$alternativeSpoiler$entry = lOther$alternativeSpoiler[i];
        if (l$alternativeSpoiler$entry != lOther$alternativeSpoiler$entry) {
          return false;
        }
      }
    } else if (l$alternativeSpoiler != lOther$alternativeSpoiler) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$middle = middle;
    final l$last = last;
    final l$native = native;
    final l$alternative = alternative;
    final l$alternativeSpoiler = alternativeSpoiler;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('middle') ? l$middle : const {},
      _$data.containsKey('last') ? l$last : const {},
      _$data.containsKey('native') ? l$native : const {},
      _$data.containsKey('alternative')
          ? l$alternative == null
              ? null
              : Object.hashAll(l$alternative.map((v) => v))
          : const {},
      _$data.containsKey('alternativeSpoiler')
          ? l$alternativeSpoiler == null
              ? null
              : Object.hashAll(l$alternativeSpoiler.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$CharacterNameInput<TRes> {
  factory CopyWith$Input$CharacterNameInput(
    Input$CharacterNameInput instance,
    TRes Function(Input$CharacterNameInput) then,
  ) = _CopyWithImpl$Input$CharacterNameInput;

  factory CopyWith$Input$CharacterNameInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CharacterNameInput;

  TRes call({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
    List<String?>? alternativeSpoiler,
  });
}

class _CopyWithImpl$Input$CharacterNameInput<TRes>
    implements CopyWith$Input$CharacterNameInput<TRes> {
  _CopyWithImpl$Input$CharacterNameInput(
    this._instance,
    this._then,
  );

  final Input$CharacterNameInput _instance;

  final TRes Function(Input$CharacterNameInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? middle = _undefined,
    Object? last = _undefined,
    Object? native = _undefined,
    Object? alternative = _undefined,
    Object? alternativeSpoiler = _undefined,
  }) =>
      _then(Input$CharacterNameInput._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as String?),
        if (middle != _undefined) 'middle': (middle as String?),
        if (last != _undefined) 'last': (last as String?),
        if (native != _undefined) 'native': (native as String?),
        if (alternative != _undefined)
          'alternative': (alternative as List<String?>?),
        if (alternativeSpoiler != _undefined)
          'alternativeSpoiler': (alternativeSpoiler as List<String?>?),
      }));
}

class _CopyWithStubImpl$Input$CharacterNameInput<TRes>
    implements CopyWith$Input$CharacterNameInput<TRes> {
  _CopyWithStubImpl$Input$CharacterNameInput(this._res);

  TRes _res;

  call({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
    List<String?>? alternativeSpoiler,
  }) =>
      _res;
}

class Input$FuzzyDateInput {
  factory Input$FuzzyDateInput({
    int? year,
    int? month,
    int? day,
  }) =>
      Input$FuzzyDateInput._({
        if (year != null) r'year': year,
        if (month != null) r'month': month,
        if (day != null) r'day': day,
      });

  Input$FuzzyDateInput._(this._$data);

  factory Input$FuzzyDateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('year')) {
      final l$year = data['year'];
      result$data['year'] = (l$year as int?);
    }
    if (data.containsKey('month')) {
      final l$month = data['month'];
      result$data['month'] = (l$month as int?);
    }
    if (data.containsKey('day')) {
      final l$day = data['day'];
      result$data['day'] = (l$day as int?);
    }
    return Input$FuzzyDateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get year => (_$data['year'] as int?);
  int? get month => (_$data['month'] as int?);
  int? get day => (_$data['day'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('year')) {
      final l$year = year;
      result$data['year'] = l$year;
    }
    if (_$data.containsKey('month')) {
      final l$month = month;
      result$data['month'] = l$month;
    }
    if (_$data.containsKey('day')) {
      final l$day = day;
      result$data['day'] = l$day;
    }
    return result$data;
  }

  CopyWith$Input$FuzzyDateInput<Input$FuzzyDateInput> get copyWith =>
      CopyWith$Input$FuzzyDateInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$FuzzyDateInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (_$data.containsKey('year') != other._$data.containsKey('year')) {
      return false;
    }
    if (l$year != lOther$year) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (_$data.containsKey('month') != other._$data.containsKey('month')) {
      return false;
    }
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (_$data.containsKey('day') != other._$data.containsKey('day')) {
      return false;
    }
    if (l$day != lOther$day) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    return Object.hashAll([
      _$data.containsKey('year') ? l$year : const {},
      _$data.containsKey('month') ? l$month : const {},
      _$data.containsKey('day') ? l$day : const {},
    ]);
  }
}

abstract class CopyWith$Input$FuzzyDateInput<TRes> {
  factory CopyWith$Input$FuzzyDateInput(
    Input$FuzzyDateInput instance,
    TRes Function(Input$FuzzyDateInput) then,
  ) = _CopyWithImpl$Input$FuzzyDateInput;

  factory CopyWith$Input$FuzzyDateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$FuzzyDateInput;

  TRes call({
    int? year,
    int? month,
    int? day,
  });
}

class _CopyWithImpl$Input$FuzzyDateInput<TRes>
    implements CopyWith$Input$FuzzyDateInput<TRes> {
  _CopyWithImpl$Input$FuzzyDateInput(
    this._instance,
    this._then,
  );

  final Input$FuzzyDateInput _instance;

  final TRes Function(Input$FuzzyDateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
  }) =>
      _then(Input$FuzzyDateInput._({
        ..._instance._$data,
        if (year != _undefined) 'year': (year as int?),
        if (month != _undefined) 'month': (month as int?),
        if (day != _undefined) 'day': (day as int?),
      }));
}

class _CopyWithStubImpl$Input$FuzzyDateInput<TRes>
    implements CopyWith$Input$FuzzyDateInput<TRes> {
  _CopyWithStubImpl$Input$FuzzyDateInput(this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
  }) =>
      _res;
}

class Input$ListActivityOptionInput {
  factory Input$ListActivityOptionInput({
    bool? disabled,
    Enum$MediaListStatus? type,
  }) =>
      Input$ListActivityOptionInput._({
        if (disabled != null) r'disabled': disabled,
        if (type != null) r'type': type,
      });

  Input$ListActivityOptionInput._(this._$data);

  factory Input$ListActivityOptionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('disabled')) {
      final l$disabled = data['disabled'];
      result$data['disabled'] = (l$disabled as bool?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$MediaListStatus((l$type as String));
    }
    return Input$ListActivityOptionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get disabled => (_$data['disabled'] as bool?);
  Enum$MediaListStatus? get type => (_$data['type'] as Enum$MediaListStatus?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('disabled')) {
      final l$disabled = disabled;
      result$data['disabled'] = l$disabled;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] =
          l$type == null ? null : toJson$Enum$MediaListStatus(l$type);
    }
    return result$data;
  }

  CopyWith$Input$ListActivityOptionInput<Input$ListActivityOptionInput>
      get copyWith => CopyWith$Input$ListActivityOptionInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ListActivityOptionInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$disabled = disabled;
    final lOther$disabled = other.disabled;
    if (_$data.containsKey('disabled') !=
        other._$data.containsKey('disabled')) {
      return false;
    }
    if (l$disabled != lOther$disabled) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$disabled = disabled;
    final l$type = type;
    return Object.hashAll([
      _$data.containsKey('disabled') ? l$disabled : const {},
      _$data.containsKey('type') ? l$type : const {},
    ]);
  }
}

abstract class CopyWith$Input$ListActivityOptionInput<TRes> {
  factory CopyWith$Input$ListActivityOptionInput(
    Input$ListActivityOptionInput instance,
    TRes Function(Input$ListActivityOptionInput) then,
  ) = _CopyWithImpl$Input$ListActivityOptionInput;

  factory CopyWith$Input$ListActivityOptionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ListActivityOptionInput;

  TRes call({
    bool? disabled,
    Enum$MediaListStatus? type,
  });
}

class _CopyWithImpl$Input$ListActivityOptionInput<TRes>
    implements CopyWith$Input$ListActivityOptionInput<TRes> {
  _CopyWithImpl$Input$ListActivityOptionInput(
    this._instance,
    this._then,
  );

  final Input$ListActivityOptionInput _instance;

  final TRes Function(Input$ListActivityOptionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? disabled = _undefined,
    Object? type = _undefined,
  }) =>
      _then(Input$ListActivityOptionInput._({
        ..._instance._$data,
        if (disabled != _undefined) 'disabled': (disabled as bool?),
        if (type != _undefined) 'type': (type as Enum$MediaListStatus?),
      }));
}

class _CopyWithStubImpl$Input$ListActivityOptionInput<TRes>
    implements CopyWith$Input$ListActivityOptionInput<TRes> {
  _CopyWithStubImpl$Input$ListActivityOptionInput(this._res);

  TRes _res;

  call({
    bool? disabled,
    Enum$MediaListStatus? type,
  }) =>
      _res;
}

class Input$MediaExternalLinkInput {
  factory Input$MediaExternalLinkInput({
    required int id,
    required String url,
    required String site,
  }) =>
      Input$MediaExternalLinkInput._({
        r'id': id,
        r'url': url,
        r'site': site,
      });

  Input$MediaExternalLinkInput._(this._$data);

  factory Input$MediaExternalLinkInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$url = data['url'];
    result$data['url'] = (l$url as String);
    final l$site = data['site'];
    result$data['site'] = (l$site as String);
    return Input$MediaExternalLinkInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  String get url => (_$data['url'] as String);
  String get site => (_$data['site'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$url = url;
    result$data['url'] = l$url;
    final l$site = site;
    result$data['site'] = l$site;
    return result$data;
  }

  CopyWith$Input$MediaExternalLinkInput<Input$MediaExternalLinkInput>
      get copyWith => CopyWith$Input$MediaExternalLinkInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$MediaExternalLinkInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$site = site;
    return Object.hashAll([
      l$id,
      l$url,
      l$site,
    ]);
  }
}

abstract class CopyWith$Input$MediaExternalLinkInput<TRes> {
  factory CopyWith$Input$MediaExternalLinkInput(
    Input$MediaExternalLinkInput instance,
    TRes Function(Input$MediaExternalLinkInput) then,
  ) = _CopyWithImpl$Input$MediaExternalLinkInput;

  factory CopyWith$Input$MediaExternalLinkInput.stub(TRes res) =
      _CopyWithStubImpl$Input$MediaExternalLinkInput;

  TRes call({
    int? id,
    String? url,
    String? site,
  });
}

class _CopyWithImpl$Input$MediaExternalLinkInput<TRes>
    implements CopyWith$Input$MediaExternalLinkInput<TRes> {
  _CopyWithImpl$Input$MediaExternalLinkInput(
    this._instance,
    this._then,
  );

  final Input$MediaExternalLinkInput _instance;

  final TRes Function(Input$MediaExternalLinkInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? site = _undefined,
  }) =>
      _then(Input$MediaExternalLinkInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (url != _undefined && url != null) 'url': (url as String),
        if (site != _undefined && site != null) 'site': (site as String),
      }));
}

class _CopyWithStubImpl$Input$MediaExternalLinkInput<TRes>
    implements CopyWith$Input$MediaExternalLinkInput<TRes> {
  _CopyWithStubImpl$Input$MediaExternalLinkInput(this._res);

  TRes _res;

  call({
    int? id,
    String? url,
    String? site,
  }) =>
      _res;
}

class Input$MediaListOptionsInput {
  factory Input$MediaListOptionsInput({
    List<String?>? sectionOrder,
    bool? splitCompletedSectionByFormat,
    List<String?>? customLists,
    List<String?>? advancedScoring,
    bool? advancedScoringEnabled,
    String? theme,
  }) =>
      Input$MediaListOptionsInput._({
        if (sectionOrder != null) r'sectionOrder': sectionOrder,
        if (splitCompletedSectionByFormat != null)
          r'splitCompletedSectionByFormat': splitCompletedSectionByFormat,
        if (customLists != null) r'customLists': customLists,
        if (advancedScoring != null) r'advancedScoring': advancedScoring,
        if (advancedScoringEnabled != null)
          r'advancedScoringEnabled': advancedScoringEnabled,
        if (theme != null) r'theme': theme,
      });

  Input$MediaListOptionsInput._(this._$data);

  factory Input$MediaListOptionsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('sectionOrder')) {
      final l$sectionOrder = data['sectionOrder'];
      result$data['sectionOrder'] = (l$sectionOrder as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('splitCompletedSectionByFormat')) {
      final l$splitCompletedSectionByFormat =
          data['splitCompletedSectionByFormat'];
      result$data['splitCompletedSectionByFormat'] =
          (l$splitCompletedSectionByFormat as bool?);
    }
    if (data.containsKey('customLists')) {
      final l$customLists = data['customLists'];
      result$data['customLists'] = (l$customLists as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('advancedScoring')) {
      final l$advancedScoring = data['advancedScoring'];
      result$data['advancedScoring'] = (l$advancedScoring as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('advancedScoringEnabled')) {
      final l$advancedScoringEnabled = data['advancedScoringEnabled'];
      result$data['advancedScoringEnabled'] =
          (l$advancedScoringEnabled as bool?);
    }
    if (data.containsKey('theme')) {
      final l$theme = data['theme'];
      result$data['theme'] = (l$theme as String?);
    }
    return Input$MediaListOptionsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String?>? get sectionOrder => (_$data['sectionOrder'] as List<String?>?);
  bool? get splitCompletedSectionByFormat =>
      (_$data['splitCompletedSectionByFormat'] as bool?);
  List<String?>? get customLists => (_$data['customLists'] as List<String?>?);
  List<String?>? get advancedScoring =>
      (_$data['advancedScoring'] as List<String?>?);
  bool? get advancedScoringEnabled =>
      (_$data['advancedScoringEnabled'] as bool?);
  String? get theme => (_$data['theme'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('sectionOrder')) {
      final l$sectionOrder = sectionOrder;
      result$data['sectionOrder'] = l$sectionOrder?.map((e) => e).toList();
    }
    if (_$data.containsKey('splitCompletedSectionByFormat')) {
      final l$splitCompletedSectionByFormat = splitCompletedSectionByFormat;
      result$data['splitCompletedSectionByFormat'] =
          l$splitCompletedSectionByFormat;
    }
    if (_$data.containsKey('customLists')) {
      final l$customLists = customLists;
      result$data['customLists'] = l$customLists?.map((e) => e).toList();
    }
    if (_$data.containsKey('advancedScoring')) {
      final l$advancedScoring = advancedScoring;
      result$data['advancedScoring'] =
          l$advancedScoring?.map((e) => e).toList();
    }
    if (_$data.containsKey('advancedScoringEnabled')) {
      final l$advancedScoringEnabled = advancedScoringEnabled;
      result$data['advancedScoringEnabled'] = l$advancedScoringEnabled;
    }
    if (_$data.containsKey('theme')) {
      final l$theme = theme;
      result$data['theme'] = l$theme;
    }
    return result$data;
  }

  CopyWith$Input$MediaListOptionsInput<Input$MediaListOptionsInput>
      get copyWith => CopyWith$Input$MediaListOptionsInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$MediaListOptionsInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sectionOrder = sectionOrder;
    final lOther$sectionOrder = other.sectionOrder;
    if (_$data.containsKey('sectionOrder') !=
        other._$data.containsKey('sectionOrder')) {
      return false;
    }
    if (l$sectionOrder != null && lOther$sectionOrder != null) {
      if (l$sectionOrder.length != lOther$sectionOrder.length) {
        return false;
      }
      for (int i = 0; i < l$sectionOrder.length; i++) {
        final l$sectionOrder$entry = l$sectionOrder[i];
        final lOther$sectionOrder$entry = lOther$sectionOrder[i];
        if (l$sectionOrder$entry != lOther$sectionOrder$entry) {
          return false;
        }
      }
    } else if (l$sectionOrder != lOther$sectionOrder) {
      return false;
    }
    final l$splitCompletedSectionByFormat = splitCompletedSectionByFormat;
    final lOther$splitCompletedSectionByFormat =
        other.splitCompletedSectionByFormat;
    if (_$data.containsKey('splitCompletedSectionByFormat') !=
        other._$data.containsKey('splitCompletedSectionByFormat')) {
      return false;
    }
    if (l$splitCompletedSectionByFormat !=
        lOther$splitCompletedSectionByFormat) {
      return false;
    }
    final l$customLists = customLists;
    final lOther$customLists = other.customLists;
    if (_$data.containsKey('customLists') !=
        other._$data.containsKey('customLists')) {
      return false;
    }
    if (l$customLists != null && lOther$customLists != null) {
      if (l$customLists.length != lOther$customLists.length) {
        return false;
      }
      for (int i = 0; i < l$customLists.length; i++) {
        final l$customLists$entry = l$customLists[i];
        final lOther$customLists$entry = lOther$customLists[i];
        if (l$customLists$entry != lOther$customLists$entry) {
          return false;
        }
      }
    } else if (l$customLists != lOther$customLists) {
      return false;
    }
    final l$advancedScoring = advancedScoring;
    final lOther$advancedScoring = other.advancedScoring;
    if (_$data.containsKey('advancedScoring') !=
        other._$data.containsKey('advancedScoring')) {
      return false;
    }
    if (l$advancedScoring != null && lOther$advancedScoring != null) {
      if (l$advancedScoring.length != lOther$advancedScoring.length) {
        return false;
      }
      for (int i = 0; i < l$advancedScoring.length; i++) {
        final l$advancedScoring$entry = l$advancedScoring[i];
        final lOther$advancedScoring$entry = lOther$advancedScoring[i];
        if (l$advancedScoring$entry != lOther$advancedScoring$entry) {
          return false;
        }
      }
    } else if (l$advancedScoring != lOther$advancedScoring) {
      return false;
    }
    final l$advancedScoringEnabled = advancedScoringEnabled;
    final lOther$advancedScoringEnabled = other.advancedScoringEnabled;
    if (_$data.containsKey('advancedScoringEnabled') !=
        other._$data.containsKey('advancedScoringEnabled')) {
      return false;
    }
    if (l$advancedScoringEnabled != lOther$advancedScoringEnabled) {
      return false;
    }
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (_$data.containsKey('theme') != other._$data.containsKey('theme')) {
      return false;
    }
    if (l$theme != lOther$theme) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sectionOrder = sectionOrder;
    final l$splitCompletedSectionByFormat = splitCompletedSectionByFormat;
    final l$customLists = customLists;
    final l$advancedScoring = advancedScoring;
    final l$advancedScoringEnabled = advancedScoringEnabled;
    final l$theme = theme;
    return Object.hashAll([
      _$data.containsKey('sectionOrder')
          ? l$sectionOrder == null
              ? null
              : Object.hashAll(l$sectionOrder.map((v) => v))
          : const {},
      _$data.containsKey('splitCompletedSectionByFormat')
          ? l$splitCompletedSectionByFormat
          : const {},
      _$data.containsKey('customLists')
          ? l$customLists == null
              ? null
              : Object.hashAll(l$customLists.map((v) => v))
          : const {},
      _$data.containsKey('advancedScoring')
          ? l$advancedScoring == null
              ? null
              : Object.hashAll(l$advancedScoring.map((v) => v))
          : const {},
      _$data.containsKey('advancedScoringEnabled')
          ? l$advancedScoringEnabled
          : const {},
      _$data.containsKey('theme') ? l$theme : const {},
    ]);
  }
}

abstract class CopyWith$Input$MediaListOptionsInput<TRes> {
  factory CopyWith$Input$MediaListOptionsInput(
    Input$MediaListOptionsInput instance,
    TRes Function(Input$MediaListOptionsInput) then,
  ) = _CopyWithImpl$Input$MediaListOptionsInput;

  factory CopyWith$Input$MediaListOptionsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$MediaListOptionsInput;

  TRes call({
    List<String?>? sectionOrder,
    bool? splitCompletedSectionByFormat,
    List<String?>? customLists,
    List<String?>? advancedScoring,
    bool? advancedScoringEnabled,
    String? theme,
  });
}

class _CopyWithImpl$Input$MediaListOptionsInput<TRes>
    implements CopyWith$Input$MediaListOptionsInput<TRes> {
  _CopyWithImpl$Input$MediaListOptionsInput(
    this._instance,
    this._then,
  );

  final Input$MediaListOptionsInput _instance;

  final TRes Function(Input$MediaListOptionsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sectionOrder = _undefined,
    Object? splitCompletedSectionByFormat = _undefined,
    Object? customLists = _undefined,
    Object? advancedScoring = _undefined,
    Object? advancedScoringEnabled = _undefined,
    Object? theme = _undefined,
  }) =>
      _then(Input$MediaListOptionsInput._({
        ..._instance._$data,
        if (sectionOrder != _undefined)
          'sectionOrder': (sectionOrder as List<String?>?),
        if (splitCompletedSectionByFormat != _undefined)
          'splitCompletedSectionByFormat':
              (splitCompletedSectionByFormat as bool?),
        if (customLists != _undefined)
          'customLists': (customLists as List<String?>?),
        if (advancedScoring != _undefined)
          'advancedScoring': (advancedScoring as List<String?>?),
        if (advancedScoringEnabled != _undefined)
          'advancedScoringEnabled': (advancedScoringEnabled as bool?),
        if (theme != _undefined) 'theme': (theme as String?),
      }));
}

class _CopyWithStubImpl$Input$MediaListOptionsInput<TRes>
    implements CopyWith$Input$MediaListOptionsInput<TRes> {
  _CopyWithStubImpl$Input$MediaListOptionsInput(this._res);

  TRes _res;

  call({
    List<String?>? sectionOrder,
    bool? splitCompletedSectionByFormat,
    List<String?>? customLists,
    List<String?>? advancedScoring,
    bool? advancedScoringEnabled,
    String? theme,
  }) =>
      _res;
}

class Input$MediaTitleInput {
  factory Input$MediaTitleInput({
    String? romaji,
    String? english,
    String? native,
  }) =>
      Input$MediaTitleInput._({
        if (romaji != null) r'romaji': romaji,
        if (english != null) r'english': english,
        if (native != null) r'native': native,
      });

  Input$MediaTitleInput._(this._$data);

  factory Input$MediaTitleInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('romaji')) {
      final l$romaji = data['romaji'];
      result$data['romaji'] = (l$romaji as String?);
    }
    if (data.containsKey('english')) {
      final l$english = data['english'];
      result$data['english'] = (l$english as String?);
    }
    if (data.containsKey('native')) {
      final l$native = data['native'];
      result$data['native'] = (l$native as String?);
    }
    return Input$MediaTitleInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get romaji => (_$data['romaji'] as String?);
  String? get english => (_$data['english'] as String?);
  String? get native => (_$data['native'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('romaji')) {
      final l$romaji = romaji;
      result$data['romaji'] = l$romaji;
    }
    if (_$data.containsKey('english')) {
      final l$english = english;
      result$data['english'] = l$english;
    }
    if (_$data.containsKey('native')) {
      final l$native = native;
      result$data['native'] = l$native;
    }
    return result$data;
  }

  CopyWith$Input$MediaTitleInput<Input$MediaTitleInput> get copyWith =>
      CopyWith$Input$MediaTitleInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$MediaTitleInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (_$data.containsKey('romaji') != other._$data.containsKey('romaji')) {
      return false;
    }
    if (l$romaji != lOther$romaji) {
      return false;
    }
    final l$english = english;
    final lOther$english = other.english;
    if (_$data.containsKey('english') != other._$data.containsKey('english')) {
      return false;
    }
    if (l$english != lOther$english) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (_$data.containsKey('native') != other._$data.containsKey('native')) {
      return false;
    }
    if (l$native != lOther$native) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$romaji = romaji;
    final l$english = english;
    final l$native = native;
    return Object.hashAll([
      _$data.containsKey('romaji') ? l$romaji : const {},
      _$data.containsKey('english') ? l$english : const {},
      _$data.containsKey('native') ? l$native : const {},
    ]);
  }
}

abstract class CopyWith$Input$MediaTitleInput<TRes> {
  factory CopyWith$Input$MediaTitleInput(
    Input$MediaTitleInput instance,
    TRes Function(Input$MediaTitleInput) then,
  ) = _CopyWithImpl$Input$MediaTitleInput;

  factory CopyWith$Input$MediaTitleInput.stub(TRes res) =
      _CopyWithStubImpl$Input$MediaTitleInput;

  TRes call({
    String? romaji,
    String? english,
    String? native,
  });
}

class _CopyWithImpl$Input$MediaTitleInput<TRes>
    implements CopyWith$Input$MediaTitleInput<TRes> {
  _CopyWithImpl$Input$MediaTitleInput(
    this._instance,
    this._then,
  );

  final Input$MediaTitleInput _instance;

  final TRes Function(Input$MediaTitleInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? romaji = _undefined,
    Object? english = _undefined,
    Object? native = _undefined,
  }) =>
      _then(Input$MediaTitleInput._({
        ..._instance._$data,
        if (romaji != _undefined) 'romaji': (romaji as String?),
        if (english != _undefined) 'english': (english as String?),
        if (native != _undefined) 'native': (native as String?),
      }));
}

class _CopyWithStubImpl$Input$MediaTitleInput<TRes>
    implements CopyWith$Input$MediaTitleInput<TRes> {
  _CopyWithStubImpl$Input$MediaTitleInput(this._res);

  TRes _res;

  call({
    String? romaji,
    String? english,
    String? native,
  }) =>
      _res;
}

class Input$NotificationOptionInput {
  factory Input$NotificationOptionInput({
    Enum$NotificationType? type,
    bool? enabled,
  }) =>
      Input$NotificationOptionInput._({
        if (type != null) r'type': type,
        if (enabled != null) r'enabled': enabled,
      });

  Input$NotificationOptionInput._(this._$data);

  factory Input$NotificationOptionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$NotificationType((l$type as String));
    }
    if (data.containsKey('enabled')) {
      final l$enabled = data['enabled'];
      result$data['enabled'] = (l$enabled as bool?);
    }
    return Input$NotificationOptionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$NotificationType? get type => (_$data['type'] as Enum$NotificationType?);
  bool? get enabled => (_$data['enabled'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] =
          l$type == null ? null : toJson$Enum$NotificationType(l$type);
    }
    if (_$data.containsKey('enabled')) {
      final l$enabled = enabled;
      result$data['enabled'] = l$enabled;
    }
    return result$data;
  }

  CopyWith$Input$NotificationOptionInput<Input$NotificationOptionInput>
      get copyWith => CopyWith$Input$NotificationOptionInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$NotificationOptionInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (_$data.containsKey('enabled') != other._$data.containsKey('enabled')) {
      return false;
    }
    if (l$enabled != lOther$enabled) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$enabled = enabled;
    return Object.hashAll([
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('enabled') ? l$enabled : const {},
    ]);
  }
}

abstract class CopyWith$Input$NotificationOptionInput<TRes> {
  factory CopyWith$Input$NotificationOptionInput(
    Input$NotificationOptionInput instance,
    TRes Function(Input$NotificationOptionInput) then,
  ) = _CopyWithImpl$Input$NotificationOptionInput;

  factory CopyWith$Input$NotificationOptionInput.stub(TRes res) =
      _CopyWithStubImpl$Input$NotificationOptionInput;

  TRes call({
    Enum$NotificationType? type,
    bool? enabled,
  });
}

class _CopyWithImpl$Input$NotificationOptionInput<TRes>
    implements CopyWith$Input$NotificationOptionInput<TRes> {
  _CopyWithImpl$Input$NotificationOptionInput(
    this._instance,
    this._then,
  );

  final Input$NotificationOptionInput _instance;

  final TRes Function(Input$NotificationOptionInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? enabled = _undefined,
  }) =>
      _then(Input$NotificationOptionInput._({
        ..._instance._$data,
        if (type != _undefined) 'type': (type as Enum$NotificationType?),
        if (enabled != _undefined) 'enabled': (enabled as bool?),
      }));
}

class _CopyWithStubImpl$Input$NotificationOptionInput<TRes>
    implements CopyWith$Input$NotificationOptionInput<TRes> {
  _CopyWithStubImpl$Input$NotificationOptionInput(this._res);

  TRes _res;

  call({
    Enum$NotificationType? type,
    bool? enabled,
  }) =>
      _res;
}

class Input$StaffNameInput {
  factory Input$StaffNameInput({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
  }) =>
      Input$StaffNameInput._({
        if (first != null) r'first': first,
        if (middle != null) r'middle': middle,
        if (last != null) r'last': last,
        if (native != null) r'native': native,
        if (alternative != null) r'alternative': alternative,
      });

  Input$StaffNameInput._(this._$data);

  factory Input$StaffNameInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as String?);
    }
    if (data.containsKey('middle')) {
      final l$middle = data['middle'];
      result$data['middle'] = (l$middle as String?);
    }
    if (data.containsKey('last')) {
      final l$last = data['last'];
      result$data['last'] = (l$last as String?);
    }
    if (data.containsKey('native')) {
      final l$native = data['native'];
      result$data['native'] = (l$native as String?);
    }
    if (data.containsKey('alternative')) {
      final l$alternative = data['alternative'];
      result$data['alternative'] = (l$alternative as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    return Input$StaffNameInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get first => (_$data['first'] as String?);
  String? get middle => (_$data['middle'] as String?);
  String? get last => (_$data['last'] as String?);
  String? get native => (_$data['native'] as String?);
  List<String?>? get alternative => (_$data['alternative'] as List<String?>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('middle')) {
      final l$middle = middle;
      result$data['middle'] = l$middle;
    }
    if (_$data.containsKey('last')) {
      final l$last = last;
      result$data['last'] = l$last;
    }
    if (_$data.containsKey('native')) {
      final l$native = native;
      result$data['native'] = l$native;
    }
    if (_$data.containsKey('alternative')) {
      final l$alternative = alternative;
      result$data['alternative'] = l$alternative?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$StaffNameInput<Input$StaffNameInput> get copyWith =>
      CopyWith$Input$StaffNameInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$StaffNameInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$middle = middle;
    final lOther$middle = other.middle;
    if (_$data.containsKey('middle') != other._$data.containsKey('middle')) {
      return false;
    }
    if (l$middle != lOther$middle) {
      return false;
    }
    final l$last = last;
    final lOther$last = other.last;
    if (_$data.containsKey('last') != other._$data.containsKey('last')) {
      return false;
    }
    if (l$last != lOther$last) {
      return false;
    }
    final l$native = native;
    final lOther$native = other.native;
    if (_$data.containsKey('native') != other._$data.containsKey('native')) {
      return false;
    }
    if (l$native != lOther$native) {
      return false;
    }
    final l$alternative = alternative;
    final lOther$alternative = other.alternative;
    if (_$data.containsKey('alternative') !=
        other._$data.containsKey('alternative')) {
      return false;
    }
    if (l$alternative != null && lOther$alternative != null) {
      if (l$alternative.length != lOther$alternative.length) {
        return false;
      }
      for (int i = 0; i < l$alternative.length; i++) {
        final l$alternative$entry = l$alternative[i];
        final lOther$alternative$entry = lOther$alternative[i];
        if (l$alternative$entry != lOther$alternative$entry) {
          return false;
        }
      }
    } else if (l$alternative != lOther$alternative) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$middle = middle;
    final l$last = last;
    final l$native = native;
    final l$alternative = alternative;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('middle') ? l$middle : const {},
      _$data.containsKey('last') ? l$last : const {},
      _$data.containsKey('native') ? l$native : const {},
      _$data.containsKey('alternative')
          ? l$alternative == null
              ? null
              : Object.hashAll(l$alternative.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$StaffNameInput<TRes> {
  factory CopyWith$Input$StaffNameInput(
    Input$StaffNameInput instance,
    TRes Function(Input$StaffNameInput) then,
  ) = _CopyWithImpl$Input$StaffNameInput;

  factory CopyWith$Input$StaffNameInput.stub(TRes res) =
      _CopyWithStubImpl$Input$StaffNameInput;

  TRes call({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
  });
}

class _CopyWithImpl$Input$StaffNameInput<TRes>
    implements CopyWith$Input$StaffNameInput<TRes> {
  _CopyWithImpl$Input$StaffNameInput(
    this._instance,
    this._then,
  );

  final Input$StaffNameInput _instance;

  final TRes Function(Input$StaffNameInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? middle = _undefined,
    Object? last = _undefined,
    Object? native = _undefined,
    Object? alternative = _undefined,
  }) =>
      _then(Input$StaffNameInput._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as String?),
        if (middle != _undefined) 'middle': (middle as String?),
        if (last != _undefined) 'last': (last as String?),
        if (native != _undefined) 'native': (native as String?),
        if (alternative != _undefined)
          'alternative': (alternative as List<String?>?),
      }));
}

class _CopyWithStubImpl$Input$StaffNameInput<TRes>
    implements CopyWith$Input$StaffNameInput<TRes> {
  _CopyWithStubImpl$Input$StaffNameInput(this._res);

  TRes _res;

  call({
    String? first,
    String? middle,
    String? last,
    String? native,
    List<String?>? alternative,
  }) =>
      _res;
}

enum Enum$ActivitySort { ID, ID_DESC, PINNED, $unknown }

String toJson$Enum$ActivitySort(Enum$ActivitySort e) {
  switch (e) {
    case Enum$ActivitySort.ID:
      return r'ID';
    case Enum$ActivitySort.ID_DESC:
      return r'ID_DESC';
    case Enum$ActivitySort.PINNED:
      return r'PINNED';
    case Enum$ActivitySort.$unknown:
      return r'$unknown';
  }
}

Enum$ActivitySort fromJson$Enum$ActivitySort(String value) {
  switch (value) {
    case r'ID':
      return Enum$ActivitySort.ID;
    case r'ID_DESC':
      return Enum$ActivitySort.ID_DESC;
    case r'PINNED':
      return Enum$ActivitySort.PINNED;
    default:
      return Enum$ActivitySort.$unknown;
  }
}

enum Enum$ActivityType {
  TEXT,
  ANIME_LIST,
  MANGA_LIST,
  MESSAGE,
  MEDIA_LIST,
  $unknown
}

String toJson$Enum$ActivityType(Enum$ActivityType e) {
  switch (e) {
    case Enum$ActivityType.TEXT:
      return r'TEXT';
    case Enum$ActivityType.ANIME_LIST:
      return r'ANIME_LIST';
    case Enum$ActivityType.MANGA_LIST:
      return r'MANGA_LIST';
    case Enum$ActivityType.MESSAGE:
      return r'MESSAGE';
    case Enum$ActivityType.MEDIA_LIST:
      return r'MEDIA_LIST';
    case Enum$ActivityType.$unknown:
      return r'$unknown';
  }
}

Enum$ActivityType fromJson$Enum$ActivityType(String value) {
  switch (value) {
    case r'TEXT':
      return Enum$ActivityType.TEXT;
    case r'ANIME_LIST':
      return Enum$ActivityType.ANIME_LIST;
    case r'MANGA_LIST':
      return Enum$ActivityType.MANGA_LIST;
    case r'MESSAGE':
      return Enum$ActivityType.MESSAGE;
    case r'MEDIA_LIST':
      return Enum$ActivityType.MEDIA_LIST;
    default:
      return Enum$ActivityType.$unknown;
  }
}

enum Enum$AiringSort {
  ID,
  ID_DESC,
  MEDIA_ID,
  MEDIA_ID_DESC,
  TIME,
  TIME_DESC,
  EPISODE,
  EPISODE_DESC,
  $unknown
}

String toJson$Enum$AiringSort(Enum$AiringSort e) {
  switch (e) {
    case Enum$AiringSort.ID:
      return r'ID';
    case Enum$AiringSort.ID_DESC:
      return r'ID_DESC';
    case Enum$AiringSort.MEDIA_ID:
      return r'MEDIA_ID';
    case Enum$AiringSort.MEDIA_ID_DESC:
      return r'MEDIA_ID_DESC';
    case Enum$AiringSort.TIME:
      return r'TIME';
    case Enum$AiringSort.TIME_DESC:
      return r'TIME_DESC';
    case Enum$AiringSort.EPISODE:
      return r'EPISODE';
    case Enum$AiringSort.EPISODE_DESC:
      return r'EPISODE_DESC';
    case Enum$AiringSort.$unknown:
      return r'$unknown';
  }
}

Enum$AiringSort fromJson$Enum$AiringSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$AiringSort.ID;
    case r'ID_DESC':
      return Enum$AiringSort.ID_DESC;
    case r'MEDIA_ID':
      return Enum$AiringSort.MEDIA_ID;
    case r'MEDIA_ID_DESC':
      return Enum$AiringSort.MEDIA_ID_DESC;
    case r'TIME':
      return Enum$AiringSort.TIME;
    case r'TIME_DESC':
      return Enum$AiringSort.TIME_DESC;
    case r'EPISODE':
      return Enum$AiringSort.EPISODE;
    case r'EPISODE_DESC':
      return Enum$AiringSort.EPISODE_DESC;
    default:
      return Enum$AiringSort.$unknown;
  }
}

enum Enum$CharacterRole { MAIN, SUPPORTING, BACKGROUND, $unknown }

String toJson$Enum$CharacterRole(Enum$CharacterRole e) {
  switch (e) {
    case Enum$CharacterRole.MAIN:
      return r'MAIN';
    case Enum$CharacterRole.SUPPORTING:
      return r'SUPPORTING';
    case Enum$CharacterRole.BACKGROUND:
      return r'BACKGROUND';
    case Enum$CharacterRole.$unknown:
      return r'$unknown';
  }
}

Enum$CharacterRole fromJson$Enum$CharacterRole(String value) {
  switch (value) {
    case r'MAIN':
      return Enum$CharacterRole.MAIN;
    case r'SUPPORTING':
      return Enum$CharacterRole.SUPPORTING;
    case r'BACKGROUND':
      return Enum$CharacterRole.BACKGROUND;
    default:
      return Enum$CharacterRole.$unknown;
  }
}

enum Enum$CharacterSort {
  ID,
  ID_DESC,
  ROLE,
  ROLE_DESC,
  SEARCH_MATCH,
  FAVOURITES,
  FAVOURITES_DESC,
  RELEVANCE,
  $unknown
}

String toJson$Enum$CharacterSort(Enum$CharacterSort e) {
  switch (e) {
    case Enum$CharacterSort.ID:
      return r'ID';
    case Enum$CharacterSort.ID_DESC:
      return r'ID_DESC';
    case Enum$CharacterSort.ROLE:
      return r'ROLE';
    case Enum$CharacterSort.ROLE_DESC:
      return r'ROLE_DESC';
    case Enum$CharacterSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$CharacterSort.FAVOURITES:
      return r'FAVOURITES';
    case Enum$CharacterSort.FAVOURITES_DESC:
      return r'FAVOURITES_DESC';
    case Enum$CharacterSort.RELEVANCE:
      return r'RELEVANCE';
    case Enum$CharacterSort.$unknown:
      return r'$unknown';
  }
}

Enum$CharacterSort fromJson$Enum$CharacterSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$CharacterSort.ID;
    case r'ID_DESC':
      return Enum$CharacterSort.ID_DESC;
    case r'ROLE':
      return Enum$CharacterSort.ROLE;
    case r'ROLE_DESC':
      return Enum$CharacterSort.ROLE_DESC;
    case r'SEARCH_MATCH':
      return Enum$CharacterSort.SEARCH_MATCH;
    case r'FAVOURITES':
      return Enum$CharacterSort.FAVOURITES;
    case r'FAVOURITES_DESC':
      return Enum$CharacterSort.FAVOURITES_DESC;
    case r'RELEVANCE':
      return Enum$CharacterSort.RELEVANCE;
    default:
      return Enum$CharacterSort.$unknown;
  }
}

enum Enum$ExternalLinkMediaType { ANIME, MANGA, STAFF, $unknown }

String toJson$Enum$ExternalLinkMediaType(Enum$ExternalLinkMediaType e) {
  switch (e) {
    case Enum$ExternalLinkMediaType.ANIME:
      return r'ANIME';
    case Enum$ExternalLinkMediaType.MANGA:
      return r'MANGA';
    case Enum$ExternalLinkMediaType.STAFF:
      return r'STAFF';
    case Enum$ExternalLinkMediaType.$unknown:
      return r'$unknown';
  }
}

Enum$ExternalLinkMediaType fromJson$Enum$ExternalLinkMediaType(String value) {
  switch (value) {
    case r'ANIME':
      return Enum$ExternalLinkMediaType.ANIME;
    case r'MANGA':
      return Enum$ExternalLinkMediaType.MANGA;
    case r'STAFF':
      return Enum$ExternalLinkMediaType.STAFF;
    default:
      return Enum$ExternalLinkMediaType.$unknown;
  }
}

enum Enum$ExternalLinkType { INFO, STREAMING, SOCIAL, $unknown }

String toJson$Enum$ExternalLinkType(Enum$ExternalLinkType e) {
  switch (e) {
    case Enum$ExternalLinkType.INFO:
      return r'INFO';
    case Enum$ExternalLinkType.STREAMING:
      return r'STREAMING';
    case Enum$ExternalLinkType.SOCIAL:
      return r'SOCIAL';
    case Enum$ExternalLinkType.$unknown:
      return r'$unknown';
  }
}

Enum$ExternalLinkType fromJson$Enum$ExternalLinkType(String value) {
  switch (value) {
    case r'INFO':
      return Enum$ExternalLinkType.INFO;
    case r'STREAMING':
      return Enum$ExternalLinkType.STREAMING;
    case r'SOCIAL':
      return Enum$ExternalLinkType.SOCIAL;
    default:
      return Enum$ExternalLinkType.$unknown;
  }
}

enum Enum$LikeableType {
  THREAD,
  THREAD_COMMENT,
  ACTIVITY,
  ACTIVITY_REPLY,
  $unknown
}

String toJson$Enum$LikeableType(Enum$LikeableType e) {
  switch (e) {
    case Enum$LikeableType.THREAD:
      return r'THREAD';
    case Enum$LikeableType.THREAD_COMMENT:
      return r'THREAD_COMMENT';
    case Enum$LikeableType.ACTIVITY:
      return r'ACTIVITY';
    case Enum$LikeableType.ACTIVITY_REPLY:
      return r'ACTIVITY_REPLY';
    case Enum$LikeableType.$unknown:
      return r'$unknown';
  }
}

Enum$LikeableType fromJson$Enum$LikeableType(String value) {
  switch (value) {
    case r'THREAD':
      return Enum$LikeableType.THREAD;
    case r'THREAD_COMMENT':
      return Enum$LikeableType.THREAD_COMMENT;
    case r'ACTIVITY':
      return Enum$LikeableType.ACTIVITY;
    case r'ACTIVITY_REPLY':
      return Enum$LikeableType.ACTIVITY_REPLY;
    default:
      return Enum$LikeableType.$unknown;
  }
}

enum Enum$MediaFormat {
  TV,
  TV_SHORT,
  MOVIE,
  SPECIAL,
  OVA,
  ONA,
  MUSIC,
  MANGA,
  NOVEL,
  ONE_SHOT,
  $unknown
}

String toJson$Enum$MediaFormat(Enum$MediaFormat e) {
  switch (e) {
    case Enum$MediaFormat.TV:
      return r'TV';
    case Enum$MediaFormat.TV_SHORT:
      return r'TV_SHORT';
    case Enum$MediaFormat.MOVIE:
      return r'MOVIE';
    case Enum$MediaFormat.SPECIAL:
      return r'SPECIAL';
    case Enum$MediaFormat.OVA:
      return r'OVA';
    case Enum$MediaFormat.ONA:
      return r'ONA';
    case Enum$MediaFormat.MUSIC:
      return r'MUSIC';
    case Enum$MediaFormat.MANGA:
      return r'MANGA';
    case Enum$MediaFormat.NOVEL:
      return r'NOVEL';
    case Enum$MediaFormat.ONE_SHOT:
      return r'ONE_SHOT';
    case Enum$MediaFormat.$unknown:
      return r'$unknown';
  }
}

Enum$MediaFormat fromJson$Enum$MediaFormat(String value) {
  switch (value) {
    case r'TV':
      return Enum$MediaFormat.TV;
    case r'TV_SHORT':
      return Enum$MediaFormat.TV_SHORT;
    case r'MOVIE':
      return Enum$MediaFormat.MOVIE;
    case r'SPECIAL':
      return Enum$MediaFormat.SPECIAL;
    case r'OVA':
      return Enum$MediaFormat.OVA;
    case r'ONA':
      return Enum$MediaFormat.ONA;
    case r'MUSIC':
      return Enum$MediaFormat.MUSIC;
    case r'MANGA':
      return Enum$MediaFormat.MANGA;
    case r'NOVEL':
      return Enum$MediaFormat.NOVEL;
    case r'ONE_SHOT':
      return Enum$MediaFormat.ONE_SHOT;
    default:
      return Enum$MediaFormat.$unknown;
  }
}

enum Enum$MediaListSort {
  MEDIA_ID,
  MEDIA_ID_DESC,
  SCORE,
  SCORE_DESC,
  STATUS,
  STATUS_DESC,
  PROGRESS,
  PROGRESS_DESC,
  PROGRESS_VOLUMES,
  PROGRESS_VOLUMES_DESC,
  REPEAT,
  REPEAT_DESC,
  PRIORITY,
  PRIORITY_DESC,
  STARTED_ON,
  STARTED_ON_DESC,
  FINISHED_ON,
  FINISHED_ON_DESC,
  ADDED_TIME,
  ADDED_TIME_DESC,
  UPDATED_TIME,
  UPDATED_TIME_DESC,
  MEDIA_TITLE_ROMAJI,
  MEDIA_TITLE_ROMAJI_DESC,
  MEDIA_TITLE_ENGLISH,
  MEDIA_TITLE_ENGLISH_DESC,
  MEDIA_TITLE_NATIVE,
  MEDIA_TITLE_NATIVE_DESC,
  MEDIA_POPULARITY,
  MEDIA_POPULARITY_DESC,
  $unknown
}

String toJson$Enum$MediaListSort(Enum$MediaListSort e) {
  switch (e) {
    case Enum$MediaListSort.MEDIA_ID:
      return r'MEDIA_ID';
    case Enum$MediaListSort.MEDIA_ID_DESC:
      return r'MEDIA_ID_DESC';
    case Enum$MediaListSort.SCORE:
      return r'SCORE';
    case Enum$MediaListSort.SCORE_DESC:
      return r'SCORE_DESC';
    case Enum$MediaListSort.STATUS:
      return r'STATUS';
    case Enum$MediaListSort.STATUS_DESC:
      return r'STATUS_DESC';
    case Enum$MediaListSort.PROGRESS:
      return r'PROGRESS';
    case Enum$MediaListSort.PROGRESS_DESC:
      return r'PROGRESS_DESC';
    case Enum$MediaListSort.PROGRESS_VOLUMES:
      return r'PROGRESS_VOLUMES';
    case Enum$MediaListSort.PROGRESS_VOLUMES_DESC:
      return r'PROGRESS_VOLUMES_DESC';
    case Enum$MediaListSort.REPEAT:
      return r'REPEAT';
    case Enum$MediaListSort.REPEAT_DESC:
      return r'REPEAT_DESC';
    case Enum$MediaListSort.PRIORITY:
      return r'PRIORITY';
    case Enum$MediaListSort.PRIORITY_DESC:
      return r'PRIORITY_DESC';
    case Enum$MediaListSort.STARTED_ON:
      return r'STARTED_ON';
    case Enum$MediaListSort.STARTED_ON_DESC:
      return r'STARTED_ON_DESC';
    case Enum$MediaListSort.FINISHED_ON:
      return r'FINISHED_ON';
    case Enum$MediaListSort.FINISHED_ON_DESC:
      return r'FINISHED_ON_DESC';
    case Enum$MediaListSort.ADDED_TIME:
      return r'ADDED_TIME';
    case Enum$MediaListSort.ADDED_TIME_DESC:
      return r'ADDED_TIME_DESC';
    case Enum$MediaListSort.UPDATED_TIME:
      return r'UPDATED_TIME';
    case Enum$MediaListSort.UPDATED_TIME_DESC:
      return r'UPDATED_TIME_DESC';
    case Enum$MediaListSort.MEDIA_TITLE_ROMAJI:
      return r'MEDIA_TITLE_ROMAJI';
    case Enum$MediaListSort.MEDIA_TITLE_ROMAJI_DESC:
      return r'MEDIA_TITLE_ROMAJI_DESC';
    case Enum$MediaListSort.MEDIA_TITLE_ENGLISH:
      return r'MEDIA_TITLE_ENGLISH';
    case Enum$MediaListSort.MEDIA_TITLE_ENGLISH_DESC:
      return r'MEDIA_TITLE_ENGLISH_DESC';
    case Enum$MediaListSort.MEDIA_TITLE_NATIVE:
      return r'MEDIA_TITLE_NATIVE';
    case Enum$MediaListSort.MEDIA_TITLE_NATIVE_DESC:
      return r'MEDIA_TITLE_NATIVE_DESC';
    case Enum$MediaListSort.MEDIA_POPULARITY:
      return r'MEDIA_POPULARITY';
    case Enum$MediaListSort.MEDIA_POPULARITY_DESC:
      return r'MEDIA_POPULARITY_DESC';
    case Enum$MediaListSort.$unknown:
      return r'$unknown';
  }
}

Enum$MediaListSort fromJson$Enum$MediaListSort(String value) {
  switch (value) {
    case r'MEDIA_ID':
      return Enum$MediaListSort.MEDIA_ID;
    case r'MEDIA_ID_DESC':
      return Enum$MediaListSort.MEDIA_ID_DESC;
    case r'SCORE':
      return Enum$MediaListSort.SCORE;
    case r'SCORE_DESC':
      return Enum$MediaListSort.SCORE_DESC;
    case r'STATUS':
      return Enum$MediaListSort.STATUS;
    case r'STATUS_DESC':
      return Enum$MediaListSort.STATUS_DESC;
    case r'PROGRESS':
      return Enum$MediaListSort.PROGRESS;
    case r'PROGRESS_DESC':
      return Enum$MediaListSort.PROGRESS_DESC;
    case r'PROGRESS_VOLUMES':
      return Enum$MediaListSort.PROGRESS_VOLUMES;
    case r'PROGRESS_VOLUMES_DESC':
      return Enum$MediaListSort.PROGRESS_VOLUMES_DESC;
    case r'REPEAT':
      return Enum$MediaListSort.REPEAT;
    case r'REPEAT_DESC':
      return Enum$MediaListSort.REPEAT_DESC;
    case r'PRIORITY':
      return Enum$MediaListSort.PRIORITY;
    case r'PRIORITY_DESC':
      return Enum$MediaListSort.PRIORITY_DESC;
    case r'STARTED_ON':
      return Enum$MediaListSort.STARTED_ON;
    case r'STARTED_ON_DESC':
      return Enum$MediaListSort.STARTED_ON_DESC;
    case r'FINISHED_ON':
      return Enum$MediaListSort.FINISHED_ON;
    case r'FINISHED_ON_DESC':
      return Enum$MediaListSort.FINISHED_ON_DESC;
    case r'ADDED_TIME':
      return Enum$MediaListSort.ADDED_TIME;
    case r'ADDED_TIME_DESC':
      return Enum$MediaListSort.ADDED_TIME_DESC;
    case r'UPDATED_TIME':
      return Enum$MediaListSort.UPDATED_TIME;
    case r'UPDATED_TIME_DESC':
      return Enum$MediaListSort.UPDATED_TIME_DESC;
    case r'MEDIA_TITLE_ROMAJI':
      return Enum$MediaListSort.MEDIA_TITLE_ROMAJI;
    case r'MEDIA_TITLE_ROMAJI_DESC':
      return Enum$MediaListSort.MEDIA_TITLE_ROMAJI_DESC;
    case r'MEDIA_TITLE_ENGLISH':
      return Enum$MediaListSort.MEDIA_TITLE_ENGLISH;
    case r'MEDIA_TITLE_ENGLISH_DESC':
      return Enum$MediaListSort.MEDIA_TITLE_ENGLISH_DESC;
    case r'MEDIA_TITLE_NATIVE':
      return Enum$MediaListSort.MEDIA_TITLE_NATIVE;
    case r'MEDIA_TITLE_NATIVE_DESC':
      return Enum$MediaListSort.MEDIA_TITLE_NATIVE_DESC;
    case r'MEDIA_POPULARITY':
      return Enum$MediaListSort.MEDIA_POPULARITY;
    case r'MEDIA_POPULARITY_DESC':
      return Enum$MediaListSort.MEDIA_POPULARITY_DESC;
    default:
      return Enum$MediaListSort.$unknown;
  }
}

enum Enum$MediaListStatus {
  CURRENT,
  PLANNING,
  COMPLETED,
  DROPPED,
  PAUSED,
  REPEATING,
  $unknown
}

String toJson$Enum$MediaListStatus(Enum$MediaListStatus e) {
  switch (e) {
    case Enum$MediaListStatus.CURRENT:
      return r'CURRENT';
    case Enum$MediaListStatus.PLANNING:
      return r'PLANNING';
    case Enum$MediaListStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$MediaListStatus.DROPPED:
      return r'DROPPED';
    case Enum$MediaListStatus.PAUSED:
      return r'PAUSED';
    case Enum$MediaListStatus.REPEATING:
      return r'REPEATING';
    case Enum$MediaListStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MediaListStatus fromJson$Enum$MediaListStatus(String value) {
  switch (value) {
    case r'CURRENT':
      return Enum$MediaListStatus.CURRENT;
    case r'PLANNING':
      return Enum$MediaListStatus.PLANNING;
    case r'COMPLETED':
      return Enum$MediaListStatus.COMPLETED;
    case r'DROPPED':
      return Enum$MediaListStatus.DROPPED;
    case r'PAUSED':
      return Enum$MediaListStatus.PAUSED;
    case r'REPEATING':
      return Enum$MediaListStatus.REPEATING;
    default:
      return Enum$MediaListStatus.$unknown;
  }
}

enum Enum$MediaRankType { RATED, POPULAR, $unknown }

String toJson$Enum$MediaRankType(Enum$MediaRankType e) {
  switch (e) {
    case Enum$MediaRankType.RATED:
      return r'RATED';
    case Enum$MediaRankType.POPULAR:
      return r'POPULAR';
    case Enum$MediaRankType.$unknown:
      return r'$unknown';
  }
}

Enum$MediaRankType fromJson$Enum$MediaRankType(String value) {
  switch (value) {
    case r'RATED':
      return Enum$MediaRankType.RATED;
    case r'POPULAR':
      return Enum$MediaRankType.POPULAR;
    default:
      return Enum$MediaRankType.$unknown;
  }
}

enum Enum$MediaRelation {
  ADAPTATION,
  PREQUEL,
  SEQUEL,
  PARENT,
  SIDE_STORY,
  CHARACTER,
  SUMMARY,
  ALTERNATIVE,
  SPIN_OFF,
  OTHER,
  SOURCE,
  COMPILATION,
  CONTAINS,
  $unknown
}

String toJson$Enum$MediaRelation(Enum$MediaRelation e) {
  switch (e) {
    case Enum$MediaRelation.ADAPTATION:
      return r'ADAPTATION';
    case Enum$MediaRelation.PREQUEL:
      return r'PREQUEL';
    case Enum$MediaRelation.SEQUEL:
      return r'SEQUEL';
    case Enum$MediaRelation.PARENT:
      return r'PARENT';
    case Enum$MediaRelation.SIDE_STORY:
      return r'SIDE_STORY';
    case Enum$MediaRelation.CHARACTER:
      return r'CHARACTER';
    case Enum$MediaRelation.SUMMARY:
      return r'SUMMARY';
    case Enum$MediaRelation.ALTERNATIVE:
      return r'ALTERNATIVE';
    case Enum$MediaRelation.SPIN_OFF:
      return r'SPIN_OFF';
    case Enum$MediaRelation.OTHER:
      return r'OTHER';
    case Enum$MediaRelation.SOURCE:
      return r'SOURCE';
    case Enum$MediaRelation.COMPILATION:
      return r'COMPILATION';
    case Enum$MediaRelation.CONTAINS:
      return r'CONTAINS';
    case Enum$MediaRelation.$unknown:
      return r'$unknown';
  }
}

Enum$MediaRelation fromJson$Enum$MediaRelation(String value) {
  switch (value) {
    case r'ADAPTATION':
      return Enum$MediaRelation.ADAPTATION;
    case r'PREQUEL':
      return Enum$MediaRelation.PREQUEL;
    case r'SEQUEL':
      return Enum$MediaRelation.SEQUEL;
    case r'PARENT':
      return Enum$MediaRelation.PARENT;
    case r'SIDE_STORY':
      return Enum$MediaRelation.SIDE_STORY;
    case r'CHARACTER':
      return Enum$MediaRelation.CHARACTER;
    case r'SUMMARY':
      return Enum$MediaRelation.SUMMARY;
    case r'ALTERNATIVE':
      return Enum$MediaRelation.ALTERNATIVE;
    case r'SPIN_OFF':
      return Enum$MediaRelation.SPIN_OFF;
    case r'OTHER':
      return Enum$MediaRelation.OTHER;
    case r'SOURCE':
      return Enum$MediaRelation.SOURCE;
    case r'COMPILATION':
      return Enum$MediaRelation.COMPILATION;
    case r'CONTAINS':
      return Enum$MediaRelation.CONTAINS;
    default:
      return Enum$MediaRelation.$unknown;
  }
}

enum Enum$MediaSeason { WINTER, SPRING, SUMMER, FALL, $unknown }

String toJson$Enum$MediaSeason(Enum$MediaSeason e) {
  switch (e) {
    case Enum$MediaSeason.WINTER:
      return r'WINTER';
    case Enum$MediaSeason.SPRING:
      return r'SPRING';
    case Enum$MediaSeason.SUMMER:
      return r'SUMMER';
    case Enum$MediaSeason.FALL:
      return r'FALL';
    case Enum$MediaSeason.$unknown:
      return r'$unknown';
  }
}

Enum$MediaSeason fromJson$Enum$MediaSeason(String value) {
  switch (value) {
    case r'WINTER':
      return Enum$MediaSeason.WINTER;
    case r'SPRING':
      return Enum$MediaSeason.SPRING;
    case r'SUMMER':
      return Enum$MediaSeason.SUMMER;
    case r'FALL':
      return Enum$MediaSeason.FALL;
    default:
      return Enum$MediaSeason.$unknown;
  }
}

enum Enum$MediaSort {
  ID,
  ID_DESC,
  TITLE_ROMAJI,
  TITLE_ROMAJI_DESC,
  TITLE_ENGLISH,
  TITLE_ENGLISH_DESC,
  TITLE_NATIVE,
  TITLE_NATIVE_DESC,
  TYPE,
  TYPE_DESC,
  FORMAT,
  FORMAT_DESC,
  START_DATE,
  START_DATE_DESC,
  END_DATE,
  END_DATE_DESC,
  SCORE,
  SCORE_DESC,
  POPULARITY,
  POPULARITY_DESC,
  TRENDING,
  TRENDING_DESC,
  EPISODES,
  EPISODES_DESC,
  DURATION,
  DURATION_DESC,
  STATUS,
  STATUS_DESC,
  CHAPTERS,
  CHAPTERS_DESC,
  VOLUMES,
  VOLUMES_DESC,
  UPDATED_AT,
  UPDATED_AT_DESC,
  SEARCH_MATCH,
  FAVOURITES,
  FAVOURITES_DESC,
  $unknown
}

String toJson$Enum$MediaSort(Enum$MediaSort e) {
  switch (e) {
    case Enum$MediaSort.ID:
      return r'ID';
    case Enum$MediaSort.ID_DESC:
      return r'ID_DESC';
    case Enum$MediaSort.TITLE_ROMAJI:
      return r'TITLE_ROMAJI';
    case Enum$MediaSort.TITLE_ROMAJI_DESC:
      return r'TITLE_ROMAJI_DESC';
    case Enum$MediaSort.TITLE_ENGLISH:
      return r'TITLE_ENGLISH';
    case Enum$MediaSort.TITLE_ENGLISH_DESC:
      return r'TITLE_ENGLISH_DESC';
    case Enum$MediaSort.TITLE_NATIVE:
      return r'TITLE_NATIVE';
    case Enum$MediaSort.TITLE_NATIVE_DESC:
      return r'TITLE_NATIVE_DESC';
    case Enum$MediaSort.TYPE:
      return r'TYPE';
    case Enum$MediaSort.TYPE_DESC:
      return r'TYPE_DESC';
    case Enum$MediaSort.FORMAT:
      return r'FORMAT';
    case Enum$MediaSort.FORMAT_DESC:
      return r'FORMAT_DESC';
    case Enum$MediaSort.START_DATE:
      return r'START_DATE';
    case Enum$MediaSort.START_DATE_DESC:
      return r'START_DATE_DESC';
    case Enum$MediaSort.END_DATE:
      return r'END_DATE';
    case Enum$MediaSort.END_DATE_DESC:
      return r'END_DATE_DESC';
    case Enum$MediaSort.SCORE:
      return r'SCORE';
    case Enum$MediaSort.SCORE_DESC:
      return r'SCORE_DESC';
    case Enum$MediaSort.POPULARITY:
      return r'POPULARITY';
    case Enum$MediaSort.POPULARITY_DESC:
      return r'POPULARITY_DESC';
    case Enum$MediaSort.TRENDING:
      return r'TRENDING';
    case Enum$MediaSort.TRENDING_DESC:
      return r'TRENDING_DESC';
    case Enum$MediaSort.EPISODES:
      return r'EPISODES';
    case Enum$MediaSort.EPISODES_DESC:
      return r'EPISODES_DESC';
    case Enum$MediaSort.DURATION:
      return r'DURATION';
    case Enum$MediaSort.DURATION_DESC:
      return r'DURATION_DESC';
    case Enum$MediaSort.STATUS:
      return r'STATUS';
    case Enum$MediaSort.STATUS_DESC:
      return r'STATUS_DESC';
    case Enum$MediaSort.CHAPTERS:
      return r'CHAPTERS';
    case Enum$MediaSort.CHAPTERS_DESC:
      return r'CHAPTERS_DESC';
    case Enum$MediaSort.VOLUMES:
      return r'VOLUMES';
    case Enum$MediaSort.VOLUMES_DESC:
      return r'VOLUMES_DESC';
    case Enum$MediaSort.UPDATED_AT:
      return r'UPDATED_AT';
    case Enum$MediaSort.UPDATED_AT_DESC:
      return r'UPDATED_AT_DESC';
    case Enum$MediaSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$MediaSort.FAVOURITES:
      return r'FAVOURITES';
    case Enum$MediaSort.FAVOURITES_DESC:
      return r'FAVOURITES_DESC';
    case Enum$MediaSort.$unknown:
      return r'$unknown';
  }
}

Enum$MediaSort fromJson$Enum$MediaSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$MediaSort.ID;
    case r'ID_DESC':
      return Enum$MediaSort.ID_DESC;
    case r'TITLE_ROMAJI':
      return Enum$MediaSort.TITLE_ROMAJI;
    case r'TITLE_ROMAJI_DESC':
      return Enum$MediaSort.TITLE_ROMAJI_DESC;
    case r'TITLE_ENGLISH':
      return Enum$MediaSort.TITLE_ENGLISH;
    case r'TITLE_ENGLISH_DESC':
      return Enum$MediaSort.TITLE_ENGLISH_DESC;
    case r'TITLE_NATIVE':
      return Enum$MediaSort.TITLE_NATIVE;
    case r'TITLE_NATIVE_DESC':
      return Enum$MediaSort.TITLE_NATIVE_DESC;
    case r'TYPE':
      return Enum$MediaSort.TYPE;
    case r'TYPE_DESC':
      return Enum$MediaSort.TYPE_DESC;
    case r'FORMAT':
      return Enum$MediaSort.FORMAT;
    case r'FORMAT_DESC':
      return Enum$MediaSort.FORMAT_DESC;
    case r'START_DATE':
      return Enum$MediaSort.START_DATE;
    case r'START_DATE_DESC':
      return Enum$MediaSort.START_DATE_DESC;
    case r'END_DATE':
      return Enum$MediaSort.END_DATE;
    case r'END_DATE_DESC':
      return Enum$MediaSort.END_DATE_DESC;
    case r'SCORE':
      return Enum$MediaSort.SCORE;
    case r'SCORE_DESC':
      return Enum$MediaSort.SCORE_DESC;
    case r'POPULARITY':
      return Enum$MediaSort.POPULARITY;
    case r'POPULARITY_DESC':
      return Enum$MediaSort.POPULARITY_DESC;
    case r'TRENDING':
      return Enum$MediaSort.TRENDING;
    case r'TRENDING_DESC':
      return Enum$MediaSort.TRENDING_DESC;
    case r'EPISODES':
      return Enum$MediaSort.EPISODES;
    case r'EPISODES_DESC':
      return Enum$MediaSort.EPISODES_DESC;
    case r'DURATION':
      return Enum$MediaSort.DURATION;
    case r'DURATION_DESC':
      return Enum$MediaSort.DURATION_DESC;
    case r'STATUS':
      return Enum$MediaSort.STATUS;
    case r'STATUS_DESC':
      return Enum$MediaSort.STATUS_DESC;
    case r'CHAPTERS':
      return Enum$MediaSort.CHAPTERS;
    case r'CHAPTERS_DESC':
      return Enum$MediaSort.CHAPTERS_DESC;
    case r'VOLUMES':
      return Enum$MediaSort.VOLUMES;
    case r'VOLUMES_DESC':
      return Enum$MediaSort.VOLUMES_DESC;
    case r'UPDATED_AT':
      return Enum$MediaSort.UPDATED_AT;
    case r'UPDATED_AT_DESC':
      return Enum$MediaSort.UPDATED_AT_DESC;
    case r'SEARCH_MATCH':
      return Enum$MediaSort.SEARCH_MATCH;
    case r'FAVOURITES':
      return Enum$MediaSort.FAVOURITES;
    case r'FAVOURITES_DESC':
      return Enum$MediaSort.FAVOURITES_DESC;
    default:
      return Enum$MediaSort.$unknown;
  }
}

enum Enum$MediaSource {
  ORIGINAL,
  MANGA,
  LIGHT_NOVEL,
  VISUAL_NOVEL,
  VIDEO_GAME,
  OTHER,
  NOVEL,
  DOUJINSHI,
  ANIME,
  WEB_NOVEL,
  LIVE_ACTION,
  GAME,
  COMIC,
  MULTIMEDIA_PROJECT,
  PICTURE_BOOK,
  $unknown
}

String toJson$Enum$MediaSource(Enum$MediaSource e) {
  switch (e) {
    case Enum$MediaSource.ORIGINAL:
      return r'ORIGINAL';
    case Enum$MediaSource.MANGA:
      return r'MANGA';
    case Enum$MediaSource.LIGHT_NOVEL:
      return r'LIGHT_NOVEL';
    case Enum$MediaSource.VISUAL_NOVEL:
      return r'VISUAL_NOVEL';
    case Enum$MediaSource.VIDEO_GAME:
      return r'VIDEO_GAME';
    case Enum$MediaSource.OTHER:
      return r'OTHER';
    case Enum$MediaSource.NOVEL:
      return r'NOVEL';
    case Enum$MediaSource.DOUJINSHI:
      return r'DOUJINSHI';
    case Enum$MediaSource.ANIME:
      return r'ANIME';
    case Enum$MediaSource.WEB_NOVEL:
      return r'WEB_NOVEL';
    case Enum$MediaSource.LIVE_ACTION:
      return r'LIVE_ACTION';
    case Enum$MediaSource.GAME:
      return r'GAME';
    case Enum$MediaSource.COMIC:
      return r'COMIC';
    case Enum$MediaSource.MULTIMEDIA_PROJECT:
      return r'MULTIMEDIA_PROJECT';
    case Enum$MediaSource.PICTURE_BOOK:
      return r'PICTURE_BOOK';
    case Enum$MediaSource.$unknown:
      return r'$unknown';
  }
}

Enum$MediaSource fromJson$Enum$MediaSource(String value) {
  switch (value) {
    case r'ORIGINAL':
      return Enum$MediaSource.ORIGINAL;
    case r'MANGA':
      return Enum$MediaSource.MANGA;
    case r'LIGHT_NOVEL':
      return Enum$MediaSource.LIGHT_NOVEL;
    case r'VISUAL_NOVEL':
      return Enum$MediaSource.VISUAL_NOVEL;
    case r'VIDEO_GAME':
      return Enum$MediaSource.VIDEO_GAME;
    case r'OTHER':
      return Enum$MediaSource.OTHER;
    case r'NOVEL':
      return Enum$MediaSource.NOVEL;
    case r'DOUJINSHI':
      return Enum$MediaSource.DOUJINSHI;
    case r'ANIME':
      return Enum$MediaSource.ANIME;
    case r'WEB_NOVEL':
      return Enum$MediaSource.WEB_NOVEL;
    case r'LIVE_ACTION':
      return Enum$MediaSource.LIVE_ACTION;
    case r'GAME':
      return Enum$MediaSource.GAME;
    case r'COMIC':
      return Enum$MediaSource.COMIC;
    case r'MULTIMEDIA_PROJECT':
      return Enum$MediaSource.MULTIMEDIA_PROJECT;
    case r'PICTURE_BOOK':
      return Enum$MediaSource.PICTURE_BOOK;
    default:
      return Enum$MediaSource.$unknown;
  }
}

enum Enum$MediaStatus {
  FINISHED,
  RELEASING,
  NOT_YET_RELEASED,
  CANCELLED,
  HIATUS,
  $unknown
}

String toJson$Enum$MediaStatus(Enum$MediaStatus e) {
  switch (e) {
    case Enum$MediaStatus.FINISHED:
      return r'FINISHED';
    case Enum$MediaStatus.RELEASING:
      return r'RELEASING';
    case Enum$MediaStatus.NOT_YET_RELEASED:
      return r'NOT_YET_RELEASED';
    case Enum$MediaStatus.CANCELLED:
      return r'CANCELLED';
    case Enum$MediaStatus.HIATUS:
      return r'HIATUS';
    case Enum$MediaStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MediaStatus fromJson$Enum$MediaStatus(String value) {
  switch (value) {
    case r'FINISHED':
      return Enum$MediaStatus.FINISHED;
    case r'RELEASING':
      return Enum$MediaStatus.RELEASING;
    case r'NOT_YET_RELEASED':
      return Enum$MediaStatus.NOT_YET_RELEASED;
    case r'CANCELLED':
      return Enum$MediaStatus.CANCELLED;
    case r'HIATUS':
      return Enum$MediaStatus.HIATUS;
    default:
      return Enum$MediaStatus.$unknown;
  }
}

enum Enum$MediaTrendSort {
  ID,
  ID_DESC,
  MEDIA_ID,
  MEDIA_ID_DESC,
  DATE,
  DATE_DESC,
  SCORE,
  SCORE_DESC,
  POPULARITY,
  POPULARITY_DESC,
  TRENDING,
  TRENDING_DESC,
  EPISODE,
  EPISODE_DESC,
  $unknown
}

String toJson$Enum$MediaTrendSort(Enum$MediaTrendSort e) {
  switch (e) {
    case Enum$MediaTrendSort.ID:
      return r'ID';
    case Enum$MediaTrendSort.ID_DESC:
      return r'ID_DESC';
    case Enum$MediaTrendSort.MEDIA_ID:
      return r'MEDIA_ID';
    case Enum$MediaTrendSort.MEDIA_ID_DESC:
      return r'MEDIA_ID_DESC';
    case Enum$MediaTrendSort.DATE:
      return r'DATE';
    case Enum$MediaTrendSort.DATE_DESC:
      return r'DATE_DESC';
    case Enum$MediaTrendSort.SCORE:
      return r'SCORE';
    case Enum$MediaTrendSort.SCORE_DESC:
      return r'SCORE_DESC';
    case Enum$MediaTrendSort.POPULARITY:
      return r'POPULARITY';
    case Enum$MediaTrendSort.POPULARITY_DESC:
      return r'POPULARITY_DESC';
    case Enum$MediaTrendSort.TRENDING:
      return r'TRENDING';
    case Enum$MediaTrendSort.TRENDING_DESC:
      return r'TRENDING_DESC';
    case Enum$MediaTrendSort.EPISODE:
      return r'EPISODE';
    case Enum$MediaTrendSort.EPISODE_DESC:
      return r'EPISODE_DESC';
    case Enum$MediaTrendSort.$unknown:
      return r'$unknown';
  }
}

Enum$MediaTrendSort fromJson$Enum$MediaTrendSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$MediaTrendSort.ID;
    case r'ID_DESC':
      return Enum$MediaTrendSort.ID_DESC;
    case r'MEDIA_ID':
      return Enum$MediaTrendSort.MEDIA_ID;
    case r'MEDIA_ID_DESC':
      return Enum$MediaTrendSort.MEDIA_ID_DESC;
    case r'DATE':
      return Enum$MediaTrendSort.DATE;
    case r'DATE_DESC':
      return Enum$MediaTrendSort.DATE_DESC;
    case r'SCORE':
      return Enum$MediaTrendSort.SCORE;
    case r'SCORE_DESC':
      return Enum$MediaTrendSort.SCORE_DESC;
    case r'POPULARITY':
      return Enum$MediaTrendSort.POPULARITY;
    case r'POPULARITY_DESC':
      return Enum$MediaTrendSort.POPULARITY_DESC;
    case r'TRENDING':
      return Enum$MediaTrendSort.TRENDING;
    case r'TRENDING_DESC':
      return Enum$MediaTrendSort.TRENDING_DESC;
    case r'EPISODE':
      return Enum$MediaTrendSort.EPISODE;
    case r'EPISODE_DESC':
      return Enum$MediaTrendSort.EPISODE_DESC;
    default:
      return Enum$MediaTrendSort.$unknown;
  }
}

enum Enum$MediaType { ANIME, MANGA, $unknown }

String toJson$Enum$MediaType(Enum$MediaType e) {
  switch (e) {
    case Enum$MediaType.ANIME:
      return r'ANIME';
    case Enum$MediaType.MANGA:
      return r'MANGA';
    case Enum$MediaType.$unknown:
      return r'$unknown';
  }
}

Enum$MediaType fromJson$Enum$MediaType(String value) {
  switch (value) {
    case r'ANIME':
      return Enum$MediaType.ANIME;
    case r'MANGA':
      return Enum$MediaType.MANGA;
    default:
      return Enum$MediaType.$unknown;
  }
}

enum Enum$ModActionType {
  NOTE,
  BAN,
  DELETE,
  EDIT,
  EXPIRE,
  REPORT,
  RESET,
  ANON,
  $unknown
}

String toJson$Enum$ModActionType(Enum$ModActionType e) {
  switch (e) {
    case Enum$ModActionType.NOTE:
      return r'NOTE';
    case Enum$ModActionType.BAN:
      return r'BAN';
    case Enum$ModActionType.DELETE:
      return r'DELETE';
    case Enum$ModActionType.EDIT:
      return r'EDIT';
    case Enum$ModActionType.EXPIRE:
      return r'EXPIRE';
    case Enum$ModActionType.REPORT:
      return r'REPORT';
    case Enum$ModActionType.RESET:
      return r'RESET';
    case Enum$ModActionType.ANON:
      return r'ANON';
    case Enum$ModActionType.$unknown:
      return r'$unknown';
  }
}

Enum$ModActionType fromJson$Enum$ModActionType(String value) {
  switch (value) {
    case r'NOTE':
      return Enum$ModActionType.NOTE;
    case r'BAN':
      return Enum$ModActionType.BAN;
    case r'DELETE':
      return Enum$ModActionType.DELETE;
    case r'EDIT':
      return Enum$ModActionType.EDIT;
    case r'EXPIRE':
      return Enum$ModActionType.EXPIRE;
    case r'REPORT':
      return Enum$ModActionType.REPORT;
    case r'RESET':
      return Enum$ModActionType.RESET;
    case r'ANON':
      return Enum$ModActionType.ANON;
    default:
      return Enum$ModActionType.$unknown;
  }
}

enum Enum$ModRole {
  ADMIN,
  LEAD_DEVELOPER,
  DEVELOPER,
  LEAD_COMMUNITY,
  COMMUNITY,
  DISCORD_COMMUNITY,
  LEAD_ANIME_DATA,
  ANIME_DATA,
  LEAD_MANGA_DATA,
  MANGA_DATA,
  LEAD_SOCIAL_MEDIA,
  SOCIAL_MEDIA,
  RETIRED,
  $unknown
}

String toJson$Enum$ModRole(Enum$ModRole e) {
  switch (e) {
    case Enum$ModRole.ADMIN:
      return r'ADMIN';
    case Enum$ModRole.LEAD_DEVELOPER:
      return r'LEAD_DEVELOPER';
    case Enum$ModRole.DEVELOPER:
      return r'DEVELOPER';
    case Enum$ModRole.LEAD_COMMUNITY:
      return r'LEAD_COMMUNITY';
    case Enum$ModRole.COMMUNITY:
      return r'COMMUNITY';
    case Enum$ModRole.DISCORD_COMMUNITY:
      return r'DISCORD_COMMUNITY';
    case Enum$ModRole.LEAD_ANIME_DATA:
      return r'LEAD_ANIME_DATA';
    case Enum$ModRole.ANIME_DATA:
      return r'ANIME_DATA';
    case Enum$ModRole.LEAD_MANGA_DATA:
      return r'LEAD_MANGA_DATA';
    case Enum$ModRole.MANGA_DATA:
      return r'MANGA_DATA';
    case Enum$ModRole.LEAD_SOCIAL_MEDIA:
      return r'LEAD_SOCIAL_MEDIA';
    case Enum$ModRole.SOCIAL_MEDIA:
      return r'SOCIAL_MEDIA';
    case Enum$ModRole.RETIRED:
      return r'RETIRED';
    case Enum$ModRole.$unknown:
      return r'$unknown';
  }
}

Enum$ModRole fromJson$Enum$ModRole(String value) {
  switch (value) {
    case r'ADMIN':
      return Enum$ModRole.ADMIN;
    case r'LEAD_DEVELOPER':
      return Enum$ModRole.LEAD_DEVELOPER;
    case r'DEVELOPER':
      return Enum$ModRole.DEVELOPER;
    case r'LEAD_COMMUNITY':
      return Enum$ModRole.LEAD_COMMUNITY;
    case r'COMMUNITY':
      return Enum$ModRole.COMMUNITY;
    case r'DISCORD_COMMUNITY':
      return Enum$ModRole.DISCORD_COMMUNITY;
    case r'LEAD_ANIME_DATA':
      return Enum$ModRole.LEAD_ANIME_DATA;
    case r'ANIME_DATA':
      return Enum$ModRole.ANIME_DATA;
    case r'LEAD_MANGA_DATA':
      return Enum$ModRole.LEAD_MANGA_DATA;
    case r'MANGA_DATA':
      return Enum$ModRole.MANGA_DATA;
    case r'LEAD_SOCIAL_MEDIA':
      return Enum$ModRole.LEAD_SOCIAL_MEDIA;
    case r'SOCIAL_MEDIA':
      return Enum$ModRole.SOCIAL_MEDIA;
    case r'RETIRED':
      return Enum$ModRole.RETIRED;
    default:
      return Enum$ModRole.$unknown;
  }
}

enum Enum$NotificationType {
  ACTIVITY_MESSAGE,
  ACTIVITY_REPLY,
  FOLLOWING,
  ACTIVITY_MENTION,
  THREAD_COMMENT_MENTION,
  THREAD_SUBSCRIBED,
  THREAD_COMMENT_REPLY,
  AIRING,
  ACTIVITY_LIKE,
  ACTIVITY_REPLY_LIKE,
  THREAD_LIKE,
  THREAD_COMMENT_LIKE,
  ACTIVITY_REPLY_SUBSCRIBED,
  RELATED_MEDIA_ADDITION,
  MEDIA_DATA_CHANGE,
  MEDIA_MERGE,
  MEDIA_DELETION,
  $unknown
}

String toJson$Enum$NotificationType(Enum$NotificationType e) {
  switch (e) {
    case Enum$NotificationType.ACTIVITY_MESSAGE:
      return r'ACTIVITY_MESSAGE';
    case Enum$NotificationType.ACTIVITY_REPLY:
      return r'ACTIVITY_REPLY';
    case Enum$NotificationType.FOLLOWING:
      return r'FOLLOWING';
    case Enum$NotificationType.ACTIVITY_MENTION:
      return r'ACTIVITY_MENTION';
    case Enum$NotificationType.THREAD_COMMENT_MENTION:
      return r'THREAD_COMMENT_MENTION';
    case Enum$NotificationType.THREAD_SUBSCRIBED:
      return r'THREAD_SUBSCRIBED';
    case Enum$NotificationType.THREAD_COMMENT_REPLY:
      return r'THREAD_COMMENT_REPLY';
    case Enum$NotificationType.AIRING:
      return r'AIRING';
    case Enum$NotificationType.ACTIVITY_LIKE:
      return r'ACTIVITY_LIKE';
    case Enum$NotificationType.ACTIVITY_REPLY_LIKE:
      return r'ACTIVITY_REPLY_LIKE';
    case Enum$NotificationType.THREAD_LIKE:
      return r'THREAD_LIKE';
    case Enum$NotificationType.THREAD_COMMENT_LIKE:
      return r'THREAD_COMMENT_LIKE';
    case Enum$NotificationType.ACTIVITY_REPLY_SUBSCRIBED:
      return r'ACTIVITY_REPLY_SUBSCRIBED';
    case Enum$NotificationType.RELATED_MEDIA_ADDITION:
      return r'RELATED_MEDIA_ADDITION';
    case Enum$NotificationType.MEDIA_DATA_CHANGE:
      return r'MEDIA_DATA_CHANGE';
    case Enum$NotificationType.MEDIA_MERGE:
      return r'MEDIA_MERGE';
    case Enum$NotificationType.MEDIA_DELETION:
      return r'MEDIA_DELETION';
    case Enum$NotificationType.$unknown:
      return r'$unknown';
  }
}

Enum$NotificationType fromJson$Enum$NotificationType(String value) {
  switch (value) {
    case r'ACTIVITY_MESSAGE':
      return Enum$NotificationType.ACTIVITY_MESSAGE;
    case r'ACTIVITY_REPLY':
      return Enum$NotificationType.ACTIVITY_REPLY;
    case r'FOLLOWING':
      return Enum$NotificationType.FOLLOWING;
    case r'ACTIVITY_MENTION':
      return Enum$NotificationType.ACTIVITY_MENTION;
    case r'THREAD_COMMENT_MENTION':
      return Enum$NotificationType.THREAD_COMMENT_MENTION;
    case r'THREAD_SUBSCRIBED':
      return Enum$NotificationType.THREAD_SUBSCRIBED;
    case r'THREAD_COMMENT_REPLY':
      return Enum$NotificationType.THREAD_COMMENT_REPLY;
    case r'AIRING':
      return Enum$NotificationType.AIRING;
    case r'ACTIVITY_LIKE':
      return Enum$NotificationType.ACTIVITY_LIKE;
    case r'ACTIVITY_REPLY_LIKE':
      return Enum$NotificationType.ACTIVITY_REPLY_LIKE;
    case r'THREAD_LIKE':
      return Enum$NotificationType.THREAD_LIKE;
    case r'THREAD_COMMENT_LIKE':
      return Enum$NotificationType.THREAD_COMMENT_LIKE;
    case r'ACTIVITY_REPLY_SUBSCRIBED':
      return Enum$NotificationType.ACTIVITY_REPLY_SUBSCRIBED;
    case r'RELATED_MEDIA_ADDITION':
      return Enum$NotificationType.RELATED_MEDIA_ADDITION;
    case r'MEDIA_DATA_CHANGE':
      return Enum$NotificationType.MEDIA_DATA_CHANGE;
    case r'MEDIA_MERGE':
      return Enum$NotificationType.MEDIA_MERGE;
    case r'MEDIA_DELETION':
      return Enum$NotificationType.MEDIA_DELETION;
    default:
      return Enum$NotificationType.$unknown;
  }
}

enum Enum$RecommendationRating { NO_RATING, RATE_UP, RATE_DOWN, $unknown }

String toJson$Enum$RecommendationRating(Enum$RecommendationRating e) {
  switch (e) {
    case Enum$RecommendationRating.NO_RATING:
      return r'NO_RATING';
    case Enum$RecommendationRating.RATE_UP:
      return r'RATE_UP';
    case Enum$RecommendationRating.RATE_DOWN:
      return r'RATE_DOWN';
    case Enum$RecommendationRating.$unknown:
      return r'$unknown';
  }
}

Enum$RecommendationRating fromJson$Enum$RecommendationRating(String value) {
  switch (value) {
    case r'NO_RATING':
      return Enum$RecommendationRating.NO_RATING;
    case r'RATE_UP':
      return Enum$RecommendationRating.RATE_UP;
    case r'RATE_DOWN':
      return Enum$RecommendationRating.RATE_DOWN;
    default:
      return Enum$RecommendationRating.$unknown;
  }
}

enum Enum$RecommendationSort { ID, ID_DESC, RATING, RATING_DESC, $unknown }

String toJson$Enum$RecommendationSort(Enum$RecommendationSort e) {
  switch (e) {
    case Enum$RecommendationSort.ID:
      return r'ID';
    case Enum$RecommendationSort.ID_DESC:
      return r'ID_DESC';
    case Enum$RecommendationSort.RATING:
      return r'RATING';
    case Enum$RecommendationSort.RATING_DESC:
      return r'RATING_DESC';
    case Enum$RecommendationSort.$unknown:
      return r'$unknown';
  }
}

Enum$RecommendationSort fromJson$Enum$RecommendationSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$RecommendationSort.ID;
    case r'ID_DESC':
      return Enum$RecommendationSort.ID_DESC;
    case r'RATING':
      return Enum$RecommendationSort.RATING;
    case r'RATING_DESC':
      return Enum$RecommendationSort.RATING_DESC;
    default:
      return Enum$RecommendationSort.$unknown;
  }
}

enum Enum$ReviewRating { NO_VOTE, UP_VOTE, DOWN_VOTE, $unknown }

String toJson$Enum$ReviewRating(Enum$ReviewRating e) {
  switch (e) {
    case Enum$ReviewRating.NO_VOTE:
      return r'NO_VOTE';
    case Enum$ReviewRating.UP_VOTE:
      return r'UP_VOTE';
    case Enum$ReviewRating.DOWN_VOTE:
      return r'DOWN_VOTE';
    case Enum$ReviewRating.$unknown:
      return r'$unknown';
  }
}

Enum$ReviewRating fromJson$Enum$ReviewRating(String value) {
  switch (value) {
    case r'NO_VOTE':
      return Enum$ReviewRating.NO_VOTE;
    case r'UP_VOTE':
      return Enum$ReviewRating.UP_VOTE;
    case r'DOWN_VOTE':
      return Enum$ReviewRating.DOWN_VOTE;
    default:
      return Enum$ReviewRating.$unknown;
  }
}

enum Enum$ReviewSort {
  ID,
  ID_DESC,
  SCORE,
  SCORE_DESC,
  RATING,
  RATING_DESC,
  CREATED_AT,
  CREATED_AT_DESC,
  UPDATED_AT,
  UPDATED_AT_DESC,
  $unknown
}

String toJson$Enum$ReviewSort(Enum$ReviewSort e) {
  switch (e) {
    case Enum$ReviewSort.ID:
      return r'ID';
    case Enum$ReviewSort.ID_DESC:
      return r'ID_DESC';
    case Enum$ReviewSort.SCORE:
      return r'SCORE';
    case Enum$ReviewSort.SCORE_DESC:
      return r'SCORE_DESC';
    case Enum$ReviewSort.RATING:
      return r'RATING';
    case Enum$ReviewSort.RATING_DESC:
      return r'RATING_DESC';
    case Enum$ReviewSort.CREATED_AT:
      return r'CREATED_AT';
    case Enum$ReviewSort.CREATED_AT_DESC:
      return r'CREATED_AT_DESC';
    case Enum$ReviewSort.UPDATED_AT:
      return r'UPDATED_AT';
    case Enum$ReviewSort.UPDATED_AT_DESC:
      return r'UPDATED_AT_DESC';
    case Enum$ReviewSort.$unknown:
      return r'$unknown';
  }
}

Enum$ReviewSort fromJson$Enum$ReviewSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$ReviewSort.ID;
    case r'ID_DESC':
      return Enum$ReviewSort.ID_DESC;
    case r'SCORE':
      return Enum$ReviewSort.SCORE;
    case r'SCORE_DESC':
      return Enum$ReviewSort.SCORE_DESC;
    case r'RATING':
      return Enum$ReviewSort.RATING;
    case r'RATING_DESC':
      return Enum$ReviewSort.RATING_DESC;
    case r'CREATED_AT':
      return Enum$ReviewSort.CREATED_AT;
    case r'CREATED_AT_DESC':
      return Enum$ReviewSort.CREATED_AT_DESC;
    case r'UPDATED_AT':
      return Enum$ReviewSort.UPDATED_AT;
    case r'UPDATED_AT_DESC':
      return Enum$ReviewSort.UPDATED_AT_DESC;
    default:
      return Enum$ReviewSort.$unknown;
  }
}

enum Enum$RevisionHistoryAction { CREATE, EDIT, $unknown }

String toJson$Enum$RevisionHistoryAction(Enum$RevisionHistoryAction e) {
  switch (e) {
    case Enum$RevisionHistoryAction.CREATE:
      return r'CREATE';
    case Enum$RevisionHistoryAction.EDIT:
      return r'EDIT';
    case Enum$RevisionHistoryAction.$unknown:
      return r'$unknown';
  }
}

Enum$RevisionHistoryAction fromJson$Enum$RevisionHistoryAction(String value) {
  switch (value) {
    case r'CREATE':
      return Enum$RevisionHistoryAction.CREATE;
    case r'EDIT':
      return Enum$RevisionHistoryAction.EDIT;
    default:
      return Enum$RevisionHistoryAction.$unknown;
  }
}

enum Enum$ScoreFormat {
  POINT_100,
  POINT_10_DECIMAL,
  POINT_10,
  POINT_5,
  POINT_3,
  $unknown
}

String toJson$Enum$ScoreFormat(Enum$ScoreFormat e) {
  switch (e) {
    case Enum$ScoreFormat.POINT_100:
      return r'POINT_100';
    case Enum$ScoreFormat.POINT_10_DECIMAL:
      return r'POINT_10_DECIMAL';
    case Enum$ScoreFormat.POINT_10:
      return r'POINT_10';
    case Enum$ScoreFormat.POINT_5:
      return r'POINT_5';
    case Enum$ScoreFormat.POINT_3:
      return r'POINT_3';
    case Enum$ScoreFormat.$unknown:
      return r'$unknown';
  }
}

Enum$ScoreFormat fromJson$Enum$ScoreFormat(String value) {
  switch (value) {
    case r'POINT_100':
      return Enum$ScoreFormat.POINT_100;
    case r'POINT_10_DECIMAL':
      return Enum$ScoreFormat.POINT_10_DECIMAL;
    case r'POINT_10':
      return Enum$ScoreFormat.POINT_10;
    case r'POINT_5':
      return Enum$ScoreFormat.POINT_5;
    case r'POINT_3':
      return Enum$ScoreFormat.POINT_3;
    default:
      return Enum$ScoreFormat.$unknown;
  }
}

enum Enum$SiteTrendSort {
  DATE,
  DATE_DESC,
  COUNT,
  COUNT_DESC,
  CHANGE,
  CHANGE_DESC,
  $unknown
}

String toJson$Enum$SiteTrendSort(Enum$SiteTrendSort e) {
  switch (e) {
    case Enum$SiteTrendSort.DATE:
      return r'DATE';
    case Enum$SiteTrendSort.DATE_DESC:
      return r'DATE_DESC';
    case Enum$SiteTrendSort.COUNT:
      return r'COUNT';
    case Enum$SiteTrendSort.COUNT_DESC:
      return r'COUNT_DESC';
    case Enum$SiteTrendSort.CHANGE:
      return r'CHANGE';
    case Enum$SiteTrendSort.CHANGE_DESC:
      return r'CHANGE_DESC';
    case Enum$SiteTrendSort.$unknown:
      return r'$unknown';
  }
}

Enum$SiteTrendSort fromJson$Enum$SiteTrendSort(String value) {
  switch (value) {
    case r'DATE':
      return Enum$SiteTrendSort.DATE;
    case r'DATE_DESC':
      return Enum$SiteTrendSort.DATE_DESC;
    case r'COUNT':
      return Enum$SiteTrendSort.COUNT;
    case r'COUNT_DESC':
      return Enum$SiteTrendSort.COUNT_DESC;
    case r'CHANGE':
      return Enum$SiteTrendSort.CHANGE;
    case r'CHANGE_DESC':
      return Enum$SiteTrendSort.CHANGE_DESC;
    default:
      return Enum$SiteTrendSort.$unknown;
  }
}

enum Enum$StaffLanguage {
  JAPANESE,
  ENGLISH,
  KOREAN,
  ITALIAN,
  SPANISH,
  PORTUGUESE,
  FRENCH,
  GERMAN,
  HEBREW,
  HUNGARIAN,
  $unknown
}

String toJson$Enum$StaffLanguage(Enum$StaffLanguage e) {
  switch (e) {
    case Enum$StaffLanguage.JAPANESE:
      return r'JAPANESE';
    case Enum$StaffLanguage.ENGLISH:
      return r'ENGLISH';
    case Enum$StaffLanguage.KOREAN:
      return r'KOREAN';
    case Enum$StaffLanguage.ITALIAN:
      return r'ITALIAN';
    case Enum$StaffLanguage.SPANISH:
      return r'SPANISH';
    case Enum$StaffLanguage.PORTUGUESE:
      return r'PORTUGUESE';
    case Enum$StaffLanguage.FRENCH:
      return r'FRENCH';
    case Enum$StaffLanguage.GERMAN:
      return r'GERMAN';
    case Enum$StaffLanguage.HEBREW:
      return r'HEBREW';
    case Enum$StaffLanguage.HUNGARIAN:
      return r'HUNGARIAN';
    case Enum$StaffLanguage.$unknown:
      return r'$unknown';
  }
}

Enum$StaffLanguage fromJson$Enum$StaffLanguage(String value) {
  switch (value) {
    case r'JAPANESE':
      return Enum$StaffLanguage.JAPANESE;
    case r'ENGLISH':
      return Enum$StaffLanguage.ENGLISH;
    case r'KOREAN':
      return Enum$StaffLanguage.KOREAN;
    case r'ITALIAN':
      return Enum$StaffLanguage.ITALIAN;
    case r'SPANISH':
      return Enum$StaffLanguage.SPANISH;
    case r'PORTUGUESE':
      return Enum$StaffLanguage.PORTUGUESE;
    case r'FRENCH':
      return Enum$StaffLanguage.FRENCH;
    case r'GERMAN':
      return Enum$StaffLanguage.GERMAN;
    case r'HEBREW':
      return Enum$StaffLanguage.HEBREW;
    case r'HUNGARIAN':
      return Enum$StaffLanguage.HUNGARIAN;
    default:
      return Enum$StaffLanguage.$unknown;
  }
}

enum Enum$StaffSort {
  ID,
  ID_DESC,
  ROLE,
  ROLE_DESC,
  LANGUAGE,
  LANGUAGE_DESC,
  SEARCH_MATCH,
  FAVOURITES,
  FAVOURITES_DESC,
  RELEVANCE,
  $unknown
}

String toJson$Enum$StaffSort(Enum$StaffSort e) {
  switch (e) {
    case Enum$StaffSort.ID:
      return r'ID';
    case Enum$StaffSort.ID_DESC:
      return r'ID_DESC';
    case Enum$StaffSort.ROLE:
      return r'ROLE';
    case Enum$StaffSort.ROLE_DESC:
      return r'ROLE_DESC';
    case Enum$StaffSort.LANGUAGE:
      return r'LANGUAGE';
    case Enum$StaffSort.LANGUAGE_DESC:
      return r'LANGUAGE_DESC';
    case Enum$StaffSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$StaffSort.FAVOURITES:
      return r'FAVOURITES';
    case Enum$StaffSort.FAVOURITES_DESC:
      return r'FAVOURITES_DESC';
    case Enum$StaffSort.RELEVANCE:
      return r'RELEVANCE';
    case Enum$StaffSort.$unknown:
      return r'$unknown';
  }
}

Enum$StaffSort fromJson$Enum$StaffSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$StaffSort.ID;
    case r'ID_DESC':
      return Enum$StaffSort.ID_DESC;
    case r'ROLE':
      return Enum$StaffSort.ROLE;
    case r'ROLE_DESC':
      return Enum$StaffSort.ROLE_DESC;
    case r'LANGUAGE':
      return Enum$StaffSort.LANGUAGE;
    case r'LANGUAGE_DESC':
      return Enum$StaffSort.LANGUAGE_DESC;
    case r'SEARCH_MATCH':
      return Enum$StaffSort.SEARCH_MATCH;
    case r'FAVOURITES':
      return Enum$StaffSort.FAVOURITES;
    case r'FAVOURITES_DESC':
      return Enum$StaffSort.FAVOURITES_DESC;
    case r'RELEVANCE':
      return Enum$StaffSort.RELEVANCE;
    default:
      return Enum$StaffSort.$unknown;
  }
}

enum Enum$StudioSort {
  ID,
  ID_DESC,
  NAME,
  NAME_DESC,
  SEARCH_MATCH,
  FAVOURITES,
  FAVOURITES_DESC,
  $unknown
}

String toJson$Enum$StudioSort(Enum$StudioSort e) {
  switch (e) {
    case Enum$StudioSort.ID:
      return r'ID';
    case Enum$StudioSort.ID_DESC:
      return r'ID_DESC';
    case Enum$StudioSort.NAME:
      return r'NAME';
    case Enum$StudioSort.NAME_DESC:
      return r'NAME_DESC';
    case Enum$StudioSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$StudioSort.FAVOURITES:
      return r'FAVOURITES';
    case Enum$StudioSort.FAVOURITES_DESC:
      return r'FAVOURITES_DESC';
    case Enum$StudioSort.$unknown:
      return r'$unknown';
  }
}

Enum$StudioSort fromJson$Enum$StudioSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$StudioSort.ID;
    case r'ID_DESC':
      return Enum$StudioSort.ID_DESC;
    case r'NAME':
      return Enum$StudioSort.NAME;
    case r'NAME_DESC':
      return Enum$StudioSort.NAME_DESC;
    case r'SEARCH_MATCH':
      return Enum$StudioSort.SEARCH_MATCH;
    case r'FAVOURITES':
      return Enum$StudioSort.FAVOURITES;
    case r'FAVOURITES_DESC':
      return Enum$StudioSort.FAVOURITES_DESC;
    default:
      return Enum$StudioSort.$unknown;
  }
}

enum Enum$SubmissionSort { ID, ID_DESC, $unknown }

String toJson$Enum$SubmissionSort(Enum$SubmissionSort e) {
  switch (e) {
    case Enum$SubmissionSort.ID:
      return r'ID';
    case Enum$SubmissionSort.ID_DESC:
      return r'ID_DESC';
    case Enum$SubmissionSort.$unknown:
      return r'$unknown';
  }
}

Enum$SubmissionSort fromJson$Enum$SubmissionSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$SubmissionSort.ID;
    case r'ID_DESC':
      return Enum$SubmissionSort.ID_DESC;
    default:
      return Enum$SubmissionSort.$unknown;
  }
}

enum Enum$SubmissionStatus {
  PENDING,
  REJECTED,
  PARTIALLY_ACCEPTED,
  ACCEPTED,
  $unknown
}

String toJson$Enum$SubmissionStatus(Enum$SubmissionStatus e) {
  switch (e) {
    case Enum$SubmissionStatus.PENDING:
      return r'PENDING';
    case Enum$SubmissionStatus.REJECTED:
      return r'REJECTED';
    case Enum$SubmissionStatus.PARTIALLY_ACCEPTED:
      return r'PARTIALLY_ACCEPTED';
    case Enum$SubmissionStatus.ACCEPTED:
      return r'ACCEPTED';
    case Enum$SubmissionStatus.$unknown:
      return r'$unknown';
  }
}

Enum$SubmissionStatus fromJson$Enum$SubmissionStatus(String value) {
  switch (value) {
    case r'PENDING':
      return Enum$SubmissionStatus.PENDING;
    case r'REJECTED':
      return Enum$SubmissionStatus.REJECTED;
    case r'PARTIALLY_ACCEPTED':
      return Enum$SubmissionStatus.PARTIALLY_ACCEPTED;
    case r'ACCEPTED':
      return Enum$SubmissionStatus.ACCEPTED;
    default:
      return Enum$SubmissionStatus.$unknown;
  }
}

enum Enum$ThreadCommentSort { ID, ID_DESC, $unknown }

String toJson$Enum$ThreadCommentSort(Enum$ThreadCommentSort e) {
  switch (e) {
    case Enum$ThreadCommentSort.ID:
      return r'ID';
    case Enum$ThreadCommentSort.ID_DESC:
      return r'ID_DESC';
    case Enum$ThreadCommentSort.$unknown:
      return r'$unknown';
  }
}

Enum$ThreadCommentSort fromJson$Enum$ThreadCommentSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$ThreadCommentSort.ID;
    case r'ID_DESC':
      return Enum$ThreadCommentSort.ID_DESC;
    default:
      return Enum$ThreadCommentSort.$unknown;
  }
}

enum Enum$ThreadSort {
  ID,
  ID_DESC,
  TITLE,
  TITLE_DESC,
  CREATED_AT,
  CREATED_AT_DESC,
  UPDATED_AT,
  UPDATED_AT_DESC,
  REPLIED_AT,
  REPLIED_AT_DESC,
  REPLY_COUNT,
  REPLY_COUNT_DESC,
  VIEW_COUNT,
  VIEW_COUNT_DESC,
  IS_STICKY,
  SEARCH_MATCH,
  $unknown
}

String toJson$Enum$ThreadSort(Enum$ThreadSort e) {
  switch (e) {
    case Enum$ThreadSort.ID:
      return r'ID';
    case Enum$ThreadSort.ID_DESC:
      return r'ID_DESC';
    case Enum$ThreadSort.TITLE:
      return r'TITLE';
    case Enum$ThreadSort.TITLE_DESC:
      return r'TITLE_DESC';
    case Enum$ThreadSort.CREATED_AT:
      return r'CREATED_AT';
    case Enum$ThreadSort.CREATED_AT_DESC:
      return r'CREATED_AT_DESC';
    case Enum$ThreadSort.UPDATED_AT:
      return r'UPDATED_AT';
    case Enum$ThreadSort.UPDATED_AT_DESC:
      return r'UPDATED_AT_DESC';
    case Enum$ThreadSort.REPLIED_AT:
      return r'REPLIED_AT';
    case Enum$ThreadSort.REPLIED_AT_DESC:
      return r'REPLIED_AT_DESC';
    case Enum$ThreadSort.REPLY_COUNT:
      return r'REPLY_COUNT';
    case Enum$ThreadSort.REPLY_COUNT_DESC:
      return r'REPLY_COUNT_DESC';
    case Enum$ThreadSort.VIEW_COUNT:
      return r'VIEW_COUNT';
    case Enum$ThreadSort.VIEW_COUNT_DESC:
      return r'VIEW_COUNT_DESC';
    case Enum$ThreadSort.IS_STICKY:
      return r'IS_STICKY';
    case Enum$ThreadSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$ThreadSort.$unknown:
      return r'$unknown';
  }
}

Enum$ThreadSort fromJson$Enum$ThreadSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$ThreadSort.ID;
    case r'ID_DESC':
      return Enum$ThreadSort.ID_DESC;
    case r'TITLE':
      return Enum$ThreadSort.TITLE;
    case r'TITLE_DESC':
      return Enum$ThreadSort.TITLE_DESC;
    case r'CREATED_AT':
      return Enum$ThreadSort.CREATED_AT;
    case r'CREATED_AT_DESC':
      return Enum$ThreadSort.CREATED_AT_DESC;
    case r'UPDATED_AT':
      return Enum$ThreadSort.UPDATED_AT;
    case r'UPDATED_AT_DESC':
      return Enum$ThreadSort.UPDATED_AT_DESC;
    case r'REPLIED_AT':
      return Enum$ThreadSort.REPLIED_AT;
    case r'REPLIED_AT_DESC':
      return Enum$ThreadSort.REPLIED_AT_DESC;
    case r'REPLY_COUNT':
      return Enum$ThreadSort.REPLY_COUNT;
    case r'REPLY_COUNT_DESC':
      return Enum$ThreadSort.REPLY_COUNT_DESC;
    case r'VIEW_COUNT':
      return Enum$ThreadSort.VIEW_COUNT;
    case r'VIEW_COUNT_DESC':
      return Enum$ThreadSort.VIEW_COUNT_DESC;
    case r'IS_STICKY':
      return Enum$ThreadSort.IS_STICKY;
    case r'SEARCH_MATCH':
      return Enum$ThreadSort.SEARCH_MATCH;
    default:
      return Enum$ThreadSort.$unknown;
  }
}

enum Enum$UserSort {
  ID,
  ID_DESC,
  USERNAME,
  USERNAME_DESC,
  WATCHED_TIME,
  WATCHED_TIME_DESC,
  CHAPTERS_READ,
  CHAPTERS_READ_DESC,
  SEARCH_MATCH,
  $unknown
}

String toJson$Enum$UserSort(Enum$UserSort e) {
  switch (e) {
    case Enum$UserSort.ID:
      return r'ID';
    case Enum$UserSort.ID_DESC:
      return r'ID_DESC';
    case Enum$UserSort.USERNAME:
      return r'USERNAME';
    case Enum$UserSort.USERNAME_DESC:
      return r'USERNAME_DESC';
    case Enum$UserSort.WATCHED_TIME:
      return r'WATCHED_TIME';
    case Enum$UserSort.WATCHED_TIME_DESC:
      return r'WATCHED_TIME_DESC';
    case Enum$UserSort.CHAPTERS_READ:
      return r'CHAPTERS_READ';
    case Enum$UserSort.CHAPTERS_READ_DESC:
      return r'CHAPTERS_READ_DESC';
    case Enum$UserSort.SEARCH_MATCH:
      return r'SEARCH_MATCH';
    case Enum$UserSort.$unknown:
      return r'$unknown';
  }
}

Enum$UserSort fromJson$Enum$UserSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$UserSort.ID;
    case r'ID_DESC':
      return Enum$UserSort.ID_DESC;
    case r'USERNAME':
      return Enum$UserSort.USERNAME;
    case r'USERNAME_DESC':
      return Enum$UserSort.USERNAME_DESC;
    case r'WATCHED_TIME':
      return Enum$UserSort.WATCHED_TIME;
    case r'WATCHED_TIME_DESC':
      return Enum$UserSort.WATCHED_TIME_DESC;
    case r'CHAPTERS_READ':
      return Enum$UserSort.CHAPTERS_READ;
    case r'CHAPTERS_READ_DESC':
      return Enum$UserSort.CHAPTERS_READ_DESC;
    case r'SEARCH_MATCH':
      return Enum$UserSort.SEARCH_MATCH;
    default:
      return Enum$UserSort.$unknown;
  }
}

enum Enum$UserStaffNameLanguage { ROMAJI_WESTERN, ROMAJI, NATIVE, $unknown }

String toJson$Enum$UserStaffNameLanguage(Enum$UserStaffNameLanguage e) {
  switch (e) {
    case Enum$UserStaffNameLanguage.ROMAJI_WESTERN:
      return r'ROMAJI_WESTERN';
    case Enum$UserStaffNameLanguage.ROMAJI:
      return r'ROMAJI';
    case Enum$UserStaffNameLanguage.NATIVE:
      return r'NATIVE';
    case Enum$UserStaffNameLanguage.$unknown:
      return r'$unknown';
  }
}

Enum$UserStaffNameLanguage fromJson$Enum$UserStaffNameLanguage(String value) {
  switch (value) {
    case r'ROMAJI_WESTERN':
      return Enum$UserStaffNameLanguage.ROMAJI_WESTERN;
    case r'ROMAJI':
      return Enum$UserStaffNameLanguage.ROMAJI;
    case r'NATIVE':
      return Enum$UserStaffNameLanguage.NATIVE;
    default:
      return Enum$UserStaffNameLanguage.$unknown;
  }
}

enum Enum$UserStatisticsSort {
  ID,
  ID_DESC,
  COUNT,
  COUNT_DESC,
  PROGRESS,
  PROGRESS_DESC,
  MEAN_SCORE,
  MEAN_SCORE_DESC,
  $unknown
}

String toJson$Enum$UserStatisticsSort(Enum$UserStatisticsSort e) {
  switch (e) {
    case Enum$UserStatisticsSort.ID:
      return r'ID';
    case Enum$UserStatisticsSort.ID_DESC:
      return r'ID_DESC';
    case Enum$UserStatisticsSort.COUNT:
      return r'COUNT';
    case Enum$UserStatisticsSort.COUNT_DESC:
      return r'COUNT_DESC';
    case Enum$UserStatisticsSort.PROGRESS:
      return r'PROGRESS';
    case Enum$UserStatisticsSort.PROGRESS_DESC:
      return r'PROGRESS_DESC';
    case Enum$UserStatisticsSort.MEAN_SCORE:
      return r'MEAN_SCORE';
    case Enum$UserStatisticsSort.MEAN_SCORE_DESC:
      return r'MEAN_SCORE_DESC';
    case Enum$UserStatisticsSort.$unknown:
      return r'$unknown';
  }
}

Enum$UserStatisticsSort fromJson$Enum$UserStatisticsSort(String value) {
  switch (value) {
    case r'ID':
      return Enum$UserStatisticsSort.ID;
    case r'ID_DESC':
      return Enum$UserStatisticsSort.ID_DESC;
    case r'COUNT':
      return Enum$UserStatisticsSort.COUNT;
    case r'COUNT_DESC':
      return Enum$UserStatisticsSort.COUNT_DESC;
    case r'PROGRESS':
      return Enum$UserStatisticsSort.PROGRESS;
    case r'PROGRESS_DESC':
      return Enum$UserStatisticsSort.PROGRESS_DESC;
    case r'MEAN_SCORE':
      return Enum$UserStatisticsSort.MEAN_SCORE;
    case r'MEAN_SCORE_DESC':
      return Enum$UserStatisticsSort.MEAN_SCORE_DESC;
    default:
      return Enum$UserStatisticsSort.$unknown;
  }
}

enum Enum$UserTitleLanguage {
  ROMAJI,
  ENGLISH,
  NATIVE,
  ROMAJI_STYLISED,
  ENGLISH_STYLISED,
  NATIVE_STYLISED,
  $unknown
}

String toJson$Enum$UserTitleLanguage(Enum$UserTitleLanguage e) {
  switch (e) {
    case Enum$UserTitleLanguage.ROMAJI:
      return r'ROMAJI';
    case Enum$UserTitleLanguage.ENGLISH:
      return r'ENGLISH';
    case Enum$UserTitleLanguage.NATIVE:
      return r'NATIVE';
    case Enum$UserTitleLanguage.ROMAJI_STYLISED:
      return r'ROMAJI_STYLISED';
    case Enum$UserTitleLanguage.ENGLISH_STYLISED:
      return r'ENGLISH_STYLISED';
    case Enum$UserTitleLanguage.NATIVE_STYLISED:
      return r'NATIVE_STYLISED';
    case Enum$UserTitleLanguage.$unknown:
      return r'$unknown';
  }
}

Enum$UserTitleLanguage fromJson$Enum$UserTitleLanguage(String value) {
  switch (value) {
    case r'ROMAJI':
      return Enum$UserTitleLanguage.ROMAJI;
    case r'ENGLISH':
      return Enum$UserTitleLanguage.ENGLISH;
    case r'NATIVE':
      return Enum$UserTitleLanguage.NATIVE;
    case r'ROMAJI_STYLISED':
      return Enum$UserTitleLanguage.ROMAJI_STYLISED;
    case r'ENGLISH_STYLISED':
      return Enum$UserTitleLanguage.ENGLISH_STYLISED;
    case r'NATIVE_STYLISED':
      return Enum$UserTitleLanguage.NATIVE_STYLISED;
    default:
      return Enum$UserTitleLanguage.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'ActivityUnion': {
    'TextActivity',
    'ListActivity',
    'MessageActivity',
  },
  'LikeableUnion': {
    'ListActivity',
    'TextActivity',
    'MessageActivity',
    'ActivityReply',
    'Thread',
    'ThreadComment',
  },
  'NotificationUnion': {
    'AiringNotification',
    'FollowingNotification',
    'ActivityMessageNotification',
    'ActivityMentionNotification',
    'ActivityReplyNotification',
    'ActivityReplySubscribedNotification',
    'ActivityLikeNotification',
    'ActivityReplyLikeNotification',
    'ThreadCommentMentionNotification',
    'ThreadCommentReplyNotification',
    'ThreadCommentSubscribedNotification',
    'ThreadCommentLikeNotification',
    'ThreadLikeNotification',
    'RelatedMediaAdditionNotification',
    'MediaDataChangeNotification',
    'MediaMergeNotification',
    'MediaDeletionNotification',
  },
};
