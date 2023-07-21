import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Search {
  factory Variables$Query$Search({String? search}) => Variables$Query$Search._({
        if (search != null) r'search': search,
      });

  Variables$Query$Search._(this._$data);

  factory Variables$Query$Search.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    return Variables$Query$Search._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get search => (_$data['search'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    return result$data;
  }

  CopyWith$Variables$Query$Search<Variables$Query$Search> get copyWith =>
      CopyWith$Variables$Query$Search(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Search) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$search = search;
    return Object.hashAll([_$data.containsKey('search') ? l$search : const {}]);
  }
}

abstract class CopyWith$Variables$Query$Search<TRes> {
  factory CopyWith$Variables$Query$Search(
    Variables$Query$Search instance,
    TRes Function(Variables$Query$Search) then,
  ) = _CopyWithImpl$Variables$Query$Search;

  factory CopyWith$Variables$Query$Search.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Search;

  TRes call({String? search});
}

class _CopyWithImpl$Variables$Query$Search<TRes>
    implements CopyWith$Variables$Query$Search<TRes> {
  _CopyWithImpl$Variables$Query$Search(
    this._instance,
    this._then,
  );

  final Variables$Query$Search _instance;

  final TRes Function(Variables$Query$Search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? search = _undefined}) => _then(Variables$Query$Search._({
        ..._instance._$data,
        if (search != _undefined) 'search': (search as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Search<TRes>
    implements CopyWith$Variables$Query$Search<TRes> {
  _CopyWithStubImpl$Variables$Query$Search(this._res);

  TRes _res;

  call({String? search}) => _res;
}

class Query$Search {
  Query$Search({
    this.anime,
    this.characters,
    this.staff,
    this.$__typename = 'Query',
  });

  factory Query$Search.fromJson(Map<String, dynamic> json) {
    final l$anime = json['anime'];
    final l$characters = json['characters'];
    final l$staff = json['staff'];
    final l$$__typename = json['__typename'];
    return Query$Search(
      anime: l$anime == null
          ? null
          : Query$Search$anime.fromJson((l$anime as Map<String, dynamic>)),
      characters: l$characters == null
          ? null
          : Query$Search$characters.fromJson(
              (l$characters as Map<String, dynamic>)),
      staff: l$staff == null
          ? null
          : Query$Search$staff.fromJson((l$staff as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Search$anime? anime;

  final Query$Search$characters? characters;

  final Query$Search$staff? staff;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$anime = anime;
    _resultData['anime'] = l$anime?.toJson();
    final l$characters = characters;
    _resultData['characters'] = l$characters?.toJson();
    final l$staff = staff;
    _resultData['staff'] = l$staff?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$anime = anime;
    final l$characters = characters;
    final l$staff = staff;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$anime,
      l$characters,
      l$staff,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$anime = anime;
    final lOther$anime = other.anime;
    if (l$anime != lOther$anime) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters != lOther$characters) {
      return false;
    }
    final l$staff = staff;
    final lOther$staff = other.staff;
    if (l$staff != lOther$staff) {
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

extension UtilityExtension$Query$Search on Query$Search {
  CopyWith$Query$Search<Query$Search> get copyWith => CopyWith$Query$Search(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search<TRes> {
  factory CopyWith$Query$Search(
    Query$Search instance,
    TRes Function(Query$Search) then,
  ) = _CopyWithImpl$Query$Search;

  factory CopyWith$Query$Search.stub(TRes res) = _CopyWithStubImpl$Query$Search;

  TRes call({
    Query$Search$anime? anime,
    Query$Search$characters? characters,
    Query$Search$staff? staff,
    String? $__typename,
  });
  CopyWith$Query$Search$anime<TRes> get anime;
  CopyWith$Query$Search$characters<TRes> get characters;
  CopyWith$Query$Search$staff<TRes> get staff;
}

class _CopyWithImpl$Query$Search<TRes> implements CopyWith$Query$Search<TRes> {
  _CopyWithImpl$Query$Search(
    this._instance,
    this._then,
  );

  final Query$Search _instance;

  final TRes Function(Query$Search) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? anime = _undefined,
    Object? characters = _undefined,
    Object? staff = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search(
        anime: anime == _undefined
            ? _instance.anime
            : (anime as Query$Search$anime?),
        characters: characters == _undefined
            ? _instance.characters
            : (characters as Query$Search$characters?),
        staff: staff == _undefined
            ? _instance.staff
            : (staff as Query$Search$staff?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$anime<TRes> get anime {
    final local$anime = _instance.anime;
    return local$anime == null
        ? CopyWith$Query$Search$anime.stub(_then(_instance))
        : CopyWith$Query$Search$anime(local$anime, (e) => call(anime: e));
  }

  CopyWith$Query$Search$characters<TRes> get characters {
    final local$characters = _instance.characters;
    return local$characters == null
        ? CopyWith$Query$Search$characters.stub(_then(_instance))
        : CopyWith$Query$Search$characters(
            local$characters, (e) => call(characters: e));
  }

  CopyWith$Query$Search$staff<TRes> get staff {
    final local$staff = _instance.staff;
    return local$staff == null
        ? CopyWith$Query$Search$staff.stub(_then(_instance))
        : CopyWith$Query$Search$staff(local$staff, (e) => call(staff: e));
  }
}

class _CopyWithStubImpl$Query$Search<TRes>
    implements CopyWith$Query$Search<TRes> {
  _CopyWithStubImpl$Query$Search(this._res);

  TRes _res;

  call({
    Query$Search$anime? anime,
    Query$Search$characters? characters,
    Query$Search$staff? staff,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$anime<TRes> get anime =>
      CopyWith$Query$Search$anime.stub(_res);
  CopyWith$Query$Search$characters<TRes> get characters =>
      CopyWith$Query$Search$characters.stub(_res);
  CopyWith$Query$Search$staff<TRes> get staff =>
      CopyWith$Query$Search$staff.stub(_res);
}

const documentNodeQuerySearch = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Search'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Page'),
        alias: NameNode(value: 'anime'),
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'perPage'),
            value: IntValueNode(value: '12'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'total'),
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
            name: NameNode(value: 'media'),
            alias: NameNode(value: 'results'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: EnumValueNode(name: NameNode(value: 'ANIME')),
              ),
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'search')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'shortMedia'),
                directives: [],
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
        name: NameNode(value: 'Page'),
        alias: NameNode(value: 'characters'),
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'perPage'),
            value: IntValueNode(value: '12'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'total'),
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
            name: NameNode(value: 'characters'),
            alias: NameNode(value: 'results'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'search')),
              )
            ],
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
                name: NameNode(value: 'siteUrl'),
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
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'full'),
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
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'Page'),
        alias: NameNode(value: 'staff'),
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'perPage'),
            value: IntValueNode(value: '12'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'total'),
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
            name: NameNode(value: 'staff'),
            alias: NameNode(value: 'results'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'search')),
              )
            ],
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
                name: NameNode(value: 'siteUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'primaryOccupations'),
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
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'full'),
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
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
  ),
  fragmentDefinitionshortMedia,
]);
Query$Search _parserFn$Query$Search(Map<String, dynamic> data) =>
    Query$Search.fromJson(data);
typedef OnQueryComplete$Query$Search = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Search?,
);

class Options$Query$Search extends graphql.QueryOptions<Query$Search> {
  Options$Query$Search({
    String? operationName,
    Variables$Query$Search? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Search? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Search? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$Search(data),
                  ),
          onError: onError,
          document: documentNodeQuerySearch,
          parserFn: _parserFn$Query$Search,
        );

  final OnQueryComplete$Query$Search? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Search
    extends graphql.WatchQueryOptions<Query$Search> {
  WatchOptions$Query$Search({
    String? operationName,
    Variables$Query$Search? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Search? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerySearch,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Search,
        );
}

class FetchMoreOptions$Query$Search extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Search({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Search? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerySearch,
        );
}

extension ClientExtension$Query$Search on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Search>> query$Search(
          [Options$Query$Search? options]) async =>
      await this.query(options ?? Options$Query$Search());
  graphql.ObservableQuery<Query$Search> watchQuery$Search(
          [WatchOptions$Query$Search? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Search());
  void writeQuery$Search({
    required Query$Search data,
    Variables$Query$Search? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerySearch),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Search? readQuery$Search({
    Variables$Query$Search? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySearch),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Search.fromJson(result);
  }
}

class Query$Search$anime {
  Query$Search$anime({
    this.pageInfo,
    this.results,
    this.$__typename = 'Page',
  });

  factory Query$Search$anime.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$Search$anime(
      pageInfo: l$pageInfo == null
          ? null
          : Query$Search$anime$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      results: (l$results as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Fragment$shortMedia.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Search$anime$pageInfo? pageInfo;

  final List<Fragment$shortMedia?>? results;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$results = results;
    _resultData['results'] = l$results?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$results = results;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$results == null ? null : Object.hashAll(l$results.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$anime) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$results = results;
    final lOther$results = other.results;
    if (l$results != null && lOther$results != null) {
      if (l$results.length != lOther$results.length) {
        return false;
      }
      for (int i = 0; i < l$results.length; i++) {
        final l$results$entry = l$results[i];
        final lOther$results$entry = lOther$results[i];
        if (l$results$entry != lOther$results$entry) {
          return false;
        }
      }
    } else if (l$results != lOther$results) {
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

extension UtilityExtension$Query$Search$anime on Query$Search$anime {
  CopyWith$Query$Search$anime<Query$Search$anime> get copyWith =>
      CopyWith$Query$Search$anime(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search$anime<TRes> {
  factory CopyWith$Query$Search$anime(
    Query$Search$anime instance,
    TRes Function(Query$Search$anime) then,
  ) = _CopyWithImpl$Query$Search$anime;

  factory CopyWith$Query$Search$anime.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$anime;

  TRes call({
    Query$Search$anime$pageInfo? pageInfo,
    List<Fragment$shortMedia?>? results,
    String? $__typename,
  });
  CopyWith$Query$Search$anime$pageInfo<TRes> get pageInfo;
  TRes results(
      Iterable<Fragment$shortMedia?>? Function(
              Iterable<CopyWith$Fragment$shortMedia<Fragment$shortMedia>?>?)
          _fn);
}

class _CopyWithImpl$Query$Search$anime<TRes>
    implements CopyWith$Query$Search$anime<TRes> {
  _CopyWithImpl$Query$Search$anime(
    this._instance,
    this._then,
  );

  final Query$Search$anime _instance;

  final TRes Function(Query$Search$anime) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? results = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$anime(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$Search$anime$pageInfo?),
        results: results == _undefined
            ? _instance.results
            : (results as List<Fragment$shortMedia?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$anime$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$Search$anime$pageInfo.stub(_then(_instance))
        : CopyWith$Query$Search$anime$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes results(
          Iterable<Fragment$shortMedia?>? Function(
                  Iterable<CopyWith$Fragment$shortMedia<Fragment$shortMedia>?>?)
              _fn) =>
      call(
          results: _fn(_instance.results?.map((e) => e == null
              ? null
              : CopyWith$Fragment$shortMedia(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Search$anime<TRes>
    implements CopyWith$Query$Search$anime<TRes> {
  _CopyWithStubImpl$Query$Search$anime(this._res);

  TRes _res;

  call({
    Query$Search$anime$pageInfo? pageInfo,
    List<Fragment$shortMedia?>? results,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$anime$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Search$anime$pageInfo.stub(_res);
  results(_fn) => _res;
}

class Query$Search$anime$pageInfo {
  Query$Search$anime$pageInfo({
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Search$anime$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Search$anime$pageInfo(
      total: (l$total as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$anime$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Query$Search$anime$pageInfo
    on Query$Search$anime$pageInfo {
  CopyWith$Query$Search$anime$pageInfo<Query$Search$anime$pageInfo>
      get copyWith => CopyWith$Query$Search$anime$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$anime$pageInfo<TRes> {
  factory CopyWith$Query$Search$anime$pageInfo(
    Query$Search$anime$pageInfo instance,
    TRes Function(Query$Search$anime$pageInfo) then,
  ) = _CopyWithImpl$Query$Search$anime$pageInfo;

  factory CopyWith$Query$Search$anime$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$anime$pageInfo;

  TRes call({
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$anime$pageInfo<TRes>
    implements CopyWith$Query$Search$anime$pageInfo<TRes> {
  _CopyWithImpl$Query$Search$anime$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Search$anime$pageInfo _instance;

  final TRes Function(Query$Search$anime$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$anime$pageInfo(
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$anime$pageInfo<TRes>
    implements CopyWith$Query$Search$anime$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Search$anime$pageInfo(this._res);

  TRes _res;

  call({
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$characters {
  Query$Search$characters({
    this.pageInfo,
    this.results,
    this.$__typename = 'Page',
  });

  factory Query$Search$characters.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$Search$characters(
      pageInfo: l$pageInfo == null
          ? null
          : Query$Search$characters$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      results: (l$results as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Search$characters$results.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Search$characters$pageInfo? pageInfo;

  final List<Query$Search$characters$results?>? results;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$results = results;
    _resultData['results'] = l$results?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$results = results;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$results == null ? null : Object.hashAll(l$results.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$characters) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$results = results;
    final lOther$results = other.results;
    if (l$results != null && lOther$results != null) {
      if (l$results.length != lOther$results.length) {
        return false;
      }
      for (int i = 0; i < l$results.length; i++) {
        final l$results$entry = l$results[i];
        final lOther$results$entry = lOther$results[i];
        if (l$results$entry != lOther$results$entry) {
          return false;
        }
      }
    } else if (l$results != lOther$results) {
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

extension UtilityExtension$Query$Search$characters on Query$Search$characters {
  CopyWith$Query$Search$characters<Query$Search$characters> get copyWith =>
      CopyWith$Query$Search$characters(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search$characters<TRes> {
  factory CopyWith$Query$Search$characters(
    Query$Search$characters instance,
    TRes Function(Query$Search$characters) then,
  ) = _CopyWithImpl$Query$Search$characters;

  factory CopyWith$Query$Search$characters.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$characters;

  TRes call({
    Query$Search$characters$pageInfo? pageInfo,
    List<Query$Search$characters$results?>? results,
    String? $__typename,
  });
  CopyWith$Query$Search$characters$pageInfo<TRes> get pageInfo;
  TRes results(
      Iterable<Query$Search$characters$results?>? Function(
              Iterable<
                  CopyWith$Query$Search$characters$results<
                      Query$Search$characters$results>?>?)
          _fn);
}

class _CopyWithImpl$Query$Search$characters<TRes>
    implements CopyWith$Query$Search$characters<TRes> {
  _CopyWithImpl$Query$Search$characters(
    this._instance,
    this._then,
  );

  final Query$Search$characters _instance;

  final TRes Function(Query$Search$characters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? results = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$characters(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$Search$characters$pageInfo?),
        results: results == _undefined
            ? _instance.results
            : (results as List<Query$Search$characters$results?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$characters$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$Search$characters$pageInfo.stub(_then(_instance))
        : CopyWith$Query$Search$characters$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes results(
          Iterable<Query$Search$characters$results?>? Function(
                  Iterable<
                      CopyWith$Query$Search$characters$results<
                          Query$Search$characters$results>?>?)
              _fn) =>
      call(
          results: _fn(_instance.results?.map((e) => e == null
              ? null
              : CopyWith$Query$Search$characters$results(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Search$characters<TRes>
    implements CopyWith$Query$Search$characters<TRes> {
  _CopyWithStubImpl$Query$Search$characters(this._res);

  TRes _res;

  call({
    Query$Search$characters$pageInfo? pageInfo,
    List<Query$Search$characters$results?>? results,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$characters$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Search$characters$pageInfo.stub(_res);
  results(_fn) => _res;
}

class Query$Search$characters$pageInfo {
  Query$Search$characters$pageInfo({
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Search$characters$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Search$characters$pageInfo(
      total: (l$total as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$characters$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Query$Search$characters$pageInfo
    on Query$Search$characters$pageInfo {
  CopyWith$Query$Search$characters$pageInfo<Query$Search$characters$pageInfo>
      get copyWith => CopyWith$Query$Search$characters$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$characters$pageInfo<TRes> {
  factory CopyWith$Query$Search$characters$pageInfo(
    Query$Search$characters$pageInfo instance,
    TRes Function(Query$Search$characters$pageInfo) then,
  ) = _CopyWithImpl$Query$Search$characters$pageInfo;

  factory CopyWith$Query$Search$characters$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$characters$pageInfo;

  TRes call({
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$characters$pageInfo<TRes>
    implements CopyWith$Query$Search$characters$pageInfo<TRes> {
  _CopyWithImpl$Query$Search$characters$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Search$characters$pageInfo _instance;

  final TRes Function(Query$Search$characters$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$characters$pageInfo(
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$characters$pageInfo<TRes>
    implements CopyWith$Query$Search$characters$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Search$characters$pageInfo(this._res);

  TRes _res;

  call({
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$characters$results {
  Query$Search$characters$results({
    required this.id,
    this.siteUrl,
    this.description,
    this.name,
    this.image,
    this.$__typename = 'Character',
  });

  factory Query$Search$characters$results.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$siteUrl = json['siteUrl'];
    final l$description = json['description'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$Search$characters$results(
      id: (l$id as int),
      siteUrl: (l$siteUrl as String?),
      description: (l$description as String?),
      name: l$name == null
          ? null
          : Query$Search$characters$results$name.fromJson(
              (l$name as Map<String, dynamic>)),
      image: l$image == null
          ? null
          : Query$Search$characters$results$image.fromJson(
              (l$image as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String? siteUrl;

  final String? description;

  final Query$Search$characters$results$name? name;

  final Query$Search$characters$results$image? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$siteUrl = siteUrl;
    _resultData['siteUrl'] = l$siteUrl;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$name = name;
    _resultData['name'] = l$name?.toJson();
    final l$image = image;
    _resultData['image'] = l$image?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$siteUrl = siteUrl;
    final l$description = description;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$siteUrl,
      l$description,
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$characters$results) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$siteUrl = siteUrl;
    final lOther$siteUrl = other.siteUrl;
    if (l$siteUrl != lOther$siteUrl) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$Search$characters$results
    on Query$Search$characters$results {
  CopyWith$Query$Search$characters$results<Query$Search$characters$results>
      get copyWith => CopyWith$Query$Search$characters$results(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$characters$results<TRes> {
  factory CopyWith$Query$Search$characters$results(
    Query$Search$characters$results instance,
    TRes Function(Query$Search$characters$results) then,
  ) = _CopyWithImpl$Query$Search$characters$results;

  factory CopyWith$Query$Search$characters$results.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$characters$results;

  TRes call({
    int? id,
    String? siteUrl,
    String? description,
    Query$Search$characters$results$name? name,
    Query$Search$characters$results$image? image,
    String? $__typename,
  });
  CopyWith$Query$Search$characters$results$name<TRes> get name;
  CopyWith$Query$Search$characters$results$image<TRes> get image;
}

class _CopyWithImpl$Query$Search$characters$results<TRes>
    implements CopyWith$Query$Search$characters$results<TRes> {
  _CopyWithImpl$Query$Search$characters$results(
    this._instance,
    this._then,
  );

  final Query$Search$characters$results _instance;

  final TRes Function(Query$Search$characters$results) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? siteUrl = _undefined,
    Object? description = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$characters$results(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        siteUrl:
            siteUrl == _undefined ? _instance.siteUrl : (siteUrl as String?),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        name: name == _undefined
            ? _instance.name
            : (name as Query$Search$characters$results$name?),
        image: image == _undefined
            ? _instance.image
            : (image as Query$Search$characters$results$image?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$characters$results$name<TRes> get name {
    final local$name = _instance.name;
    return local$name == null
        ? CopyWith$Query$Search$characters$results$name.stub(_then(_instance))
        : CopyWith$Query$Search$characters$results$name(
            local$name, (e) => call(name: e));
  }

  CopyWith$Query$Search$characters$results$image<TRes> get image {
    final local$image = _instance.image;
    return local$image == null
        ? CopyWith$Query$Search$characters$results$image.stub(_then(_instance))
        : CopyWith$Query$Search$characters$results$image(
            local$image, (e) => call(image: e));
  }
}

class _CopyWithStubImpl$Query$Search$characters$results<TRes>
    implements CopyWith$Query$Search$characters$results<TRes> {
  _CopyWithStubImpl$Query$Search$characters$results(this._res);

  TRes _res;

  call({
    int? id,
    String? siteUrl,
    String? description,
    Query$Search$characters$results$name? name,
    Query$Search$characters$results$image? image,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$characters$results$name<TRes> get name =>
      CopyWith$Query$Search$characters$results$name.stub(_res);
  CopyWith$Query$Search$characters$results$image<TRes> get image =>
      CopyWith$Query$Search$characters$results$image.stub(_res);
}

class Query$Search$characters$results$name {
  Query$Search$characters$results$name({
    this.full,
    this.native,
    this.$__typename = 'CharacterName',
  });

  factory Query$Search$characters$results$name.fromJson(
      Map<String, dynamic> json) {
    final l$full = json['full'];
    final l$native = json['native'];
    final l$$__typename = json['__typename'];
    return Query$Search$characters$results$name(
      full: (l$full as String?),
      native: (l$native as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? full;

  final String? native;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$full = full;
    _resultData['full'] = l$full;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$full = full;
    final l$native = native;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$full,
      l$native,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$characters$results$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$full = full;
    final lOther$full = other.full;
    if (l$full != lOther$full) {
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

extension UtilityExtension$Query$Search$characters$results$name
    on Query$Search$characters$results$name {
  CopyWith$Query$Search$characters$results$name<
          Query$Search$characters$results$name>
      get copyWith => CopyWith$Query$Search$characters$results$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$characters$results$name<TRes> {
  factory CopyWith$Query$Search$characters$results$name(
    Query$Search$characters$results$name instance,
    TRes Function(Query$Search$characters$results$name) then,
  ) = _CopyWithImpl$Query$Search$characters$results$name;

  factory CopyWith$Query$Search$characters$results$name.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$characters$results$name;

  TRes call({
    String? full,
    String? native,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$characters$results$name<TRes>
    implements CopyWith$Query$Search$characters$results$name<TRes> {
  _CopyWithImpl$Query$Search$characters$results$name(
    this._instance,
    this._then,
  );

  final Query$Search$characters$results$name _instance;

  final TRes Function(Query$Search$characters$results$name) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? full = _undefined,
    Object? native = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$characters$results$name(
        full: full == _undefined ? _instance.full : (full as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$characters$results$name<TRes>
    implements CopyWith$Query$Search$characters$results$name<TRes> {
  _CopyWithStubImpl$Query$Search$characters$results$name(this._res);

  TRes _res;

  call({
    String? full,
    String? native,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$characters$results$image {
  Query$Search$characters$results$image({
    this.large,
    this.medium,
    this.$__typename = 'CharacterImage',
  });

  factory Query$Search$characters$results$image.fromJson(
      Map<String, dynamic> json) {
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$$__typename = json['__typename'];
    return Query$Search$characters$results$image(
      large: (l$large as String?),
      medium: (l$medium as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? large;

  final String? medium;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$large = large;
    _resultData['large'] = l$large;
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$large = large;
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$large,
      l$medium,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$characters$results$image) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Search$characters$results$image
    on Query$Search$characters$results$image {
  CopyWith$Query$Search$characters$results$image<
          Query$Search$characters$results$image>
      get copyWith => CopyWith$Query$Search$characters$results$image(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$characters$results$image<TRes> {
  factory CopyWith$Query$Search$characters$results$image(
    Query$Search$characters$results$image instance,
    TRes Function(Query$Search$characters$results$image) then,
  ) = _CopyWithImpl$Query$Search$characters$results$image;

  factory CopyWith$Query$Search$characters$results$image.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$characters$results$image;

  TRes call({
    String? large,
    String? medium,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$characters$results$image<TRes>
    implements CopyWith$Query$Search$characters$results$image<TRes> {
  _CopyWithImpl$Query$Search$characters$results$image(
    this._instance,
    this._then,
  );

  final Query$Search$characters$results$image _instance;

  final TRes Function(Query$Search$characters$results$image) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$characters$results$image(
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$characters$results$image<TRes>
    implements CopyWith$Query$Search$characters$results$image<TRes> {
  _CopyWithStubImpl$Query$Search$characters$results$image(this._res);

  TRes _res;

  call({
    String? large,
    String? medium,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$staff {
  Query$Search$staff({
    this.pageInfo,
    this.results,
    this.$__typename = 'Page',
  });

  factory Query$Search$staff.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$results = json['results'];
    final l$$__typename = json['__typename'];
    return Query$Search$staff(
      pageInfo: l$pageInfo == null
          ? null
          : Query$Search$staff$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      results: (l$results as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Search$staff$results.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Search$staff$pageInfo? pageInfo;

  final List<Query$Search$staff$results?>? results;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$results = results;
    _resultData['results'] = l$results?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$results = results;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$results == null ? null : Object.hashAll(l$results.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$staff) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$results = results;
    final lOther$results = other.results;
    if (l$results != null && lOther$results != null) {
      if (l$results.length != lOther$results.length) {
        return false;
      }
      for (int i = 0; i < l$results.length; i++) {
        final l$results$entry = l$results[i];
        final lOther$results$entry = lOther$results[i];
        if (l$results$entry != lOther$results$entry) {
          return false;
        }
      }
    } else if (l$results != lOther$results) {
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

extension UtilityExtension$Query$Search$staff on Query$Search$staff {
  CopyWith$Query$Search$staff<Query$Search$staff> get copyWith =>
      CopyWith$Query$Search$staff(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Search$staff<TRes> {
  factory CopyWith$Query$Search$staff(
    Query$Search$staff instance,
    TRes Function(Query$Search$staff) then,
  ) = _CopyWithImpl$Query$Search$staff;

  factory CopyWith$Query$Search$staff.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$staff;

  TRes call({
    Query$Search$staff$pageInfo? pageInfo,
    List<Query$Search$staff$results?>? results,
    String? $__typename,
  });
  CopyWith$Query$Search$staff$pageInfo<TRes> get pageInfo;
  TRes results(
      Iterable<Query$Search$staff$results?>? Function(
              Iterable<
                  CopyWith$Query$Search$staff$results<
                      Query$Search$staff$results>?>?)
          _fn);
}

class _CopyWithImpl$Query$Search$staff<TRes>
    implements CopyWith$Query$Search$staff<TRes> {
  _CopyWithImpl$Query$Search$staff(
    this._instance,
    this._then,
  );

  final Query$Search$staff _instance;

  final TRes Function(Query$Search$staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? results = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$staff(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$Search$staff$pageInfo?),
        results: results == _undefined
            ? _instance.results
            : (results as List<Query$Search$staff$results?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$staff$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$Search$staff$pageInfo.stub(_then(_instance))
        : CopyWith$Query$Search$staff$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes results(
          Iterable<Query$Search$staff$results?>? Function(
                  Iterable<
                      CopyWith$Query$Search$staff$results<
                          Query$Search$staff$results>?>?)
              _fn) =>
      call(
          results: _fn(_instance.results?.map((e) => e == null
              ? null
              : CopyWith$Query$Search$staff$results(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Search$staff<TRes>
    implements CopyWith$Query$Search$staff<TRes> {
  _CopyWithStubImpl$Query$Search$staff(this._res);

  TRes _res;

  call({
    Query$Search$staff$pageInfo? pageInfo,
    List<Query$Search$staff$results?>? results,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$staff$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Search$staff$pageInfo.stub(_res);
  results(_fn) => _res;
}

class Query$Search$staff$pageInfo {
  Query$Search$staff$pageInfo({
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Search$staff$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Search$staff$pageInfo(
      total: (l$total as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$staff$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Query$Search$staff$pageInfo
    on Query$Search$staff$pageInfo {
  CopyWith$Query$Search$staff$pageInfo<Query$Search$staff$pageInfo>
      get copyWith => CopyWith$Query$Search$staff$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$staff$pageInfo<TRes> {
  factory CopyWith$Query$Search$staff$pageInfo(
    Query$Search$staff$pageInfo instance,
    TRes Function(Query$Search$staff$pageInfo) then,
  ) = _CopyWithImpl$Query$Search$staff$pageInfo;

  factory CopyWith$Query$Search$staff$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$staff$pageInfo;

  TRes call({
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$staff$pageInfo<TRes>
    implements CopyWith$Query$Search$staff$pageInfo<TRes> {
  _CopyWithImpl$Query$Search$staff$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Search$staff$pageInfo _instance;

  final TRes Function(Query$Search$staff$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$staff$pageInfo(
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$staff$pageInfo<TRes>
    implements CopyWith$Query$Search$staff$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Search$staff$pageInfo(this._res);

  TRes _res;

  call({
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$staff$results {
  Query$Search$staff$results({
    required this.id,
    this.siteUrl,
    this.primaryOccupations,
    this.name,
    this.image,
    this.$__typename = 'Staff',
  });

  factory Query$Search$staff$results.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$siteUrl = json['siteUrl'];
    final l$primaryOccupations = json['primaryOccupations'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$Search$staff$results(
      id: (l$id as int),
      siteUrl: (l$siteUrl as String?),
      primaryOccupations: (l$primaryOccupations as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList(),
      name: l$name == null
          ? null
          : Query$Search$staff$results$name.fromJson(
              (l$name as Map<String, dynamic>)),
      image: l$image == null
          ? null
          : Query$Search$staff$results$image.fromJson(
              (l$image as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String? siteUrl;

  final List<String?>? primaryOccupations;

  final Query$Search$staff$results$name? name;

  final Query$Search$staff$results$image? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$siteUrl = siteUrl;
    _resultData['siteUrl'] = l$siteUrl;
    final l$primaryOccupations = primaryOccupations;
    _resultData['primaryOccupations'] =
        l$primaryOccupations?.map((e) => e).toList();
    final l$name = name;
    _resultData['name'] = l$name?.toJson();
    final l$image = image;
    _resultData['image'] = l$image?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$siteUrl = siteUrl;
    final l$primaryOccupations = primaryOccupations;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$siteUrl,
      l$primaryOccupations == null
          ? null
          : Object.hashAll(l$primaryOccupations.map((v) => v)),
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$staff$results) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$siteUrl = siteUrl;
    final lOther$siteUrl = other.siteUrl;
    if (l$siteUrl != lOther$siteUrl) {
      return false;
    }
    final l$primaryOccupations = primaryOccupations;
    final lOther$primaryOccupations = other.primaryOccupations;
    if (l$primaryOccupations != null && lOther$primaryOccupations != null) {
      if (l$primaryOccupations.length != lOther$primaryOccupations.length) {
        return false;
      }
      for (int i = 0; i < l$primaryOccupations.length; i++) {
        final l$primaryOccupations$entry = l$primaryOccupations[i];
        final lOther$primaryOccupations$entry = lOther$primaryOccupations[i];
        if (l$primaryOccupations$entry != lOther$primaryOccupations$entry) {
          return false;
        }
      }
    } else if (l$primaryOccupations != lOther$primaryOccupations) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Query$Search$staff$results
    on Query$Search$staff$results {
  CopyWith$Query$Search$staff$results<Query$Search$staff$results>
      get copyWith => CopyWith$Query$Search$staff$results(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$staff$results<TRes> {
  factory CopyWith$Query$Search$staff$results(
    Query$Search$staff$results instance,
    TRes Function(Query$Search$staff$results) then,
  ) = _CopyWithImpl$Query$Search$staff$results;

  factory CopyWith$Query$Search$staff$results.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$staff$results;

  TRes call({
    int? id,
    String? siteUrl,
    List<String?>? primaryOccupations,
    Query$Search$staff$results$name? name,
    Query$Search$staff$results$image? image,
    String? $__typename,
  });
  CopyWith$Query$Search$staff$results$name<TRes> get name;
  CopyWith$Query$Search$staff$results$image<TRes> get image;
}

class _CopyWithImpl$Query$Search$staff$results<TRes>
    implements CopyWith$Query$Search$staff$results<TRes> {
  _CopyWithImpl$Query$Search$staff$results(
    this._instance,
    this._then,
  );

  final Query$Search$staff$results _instance;

  final TRes Function(Query$Search$staff$results) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? siteUrl = _undefined,
    Object? primaryOccupations = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$staff$results(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        siteUrl:
            siteUrl == _undefined ? _instance.siteUrl : (siteUrl as String?),
        primaryOccupations: primaryOccupations == _undefined
            ? _instance.primaryOccupations
            : (primaryOccupations as List<String?>?),
        name: name == _undefined
            ? _instance.name
            : (name as Query$Search$staff$results$name?),
        image: image == _undefined
            ? _instance.image
            : (image as Query$Search$staff$results$image?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Search$staff$results$name<TRes> get name {
    final local$name = _instance.name;
    return local$name == null
        ? CopyWith$Query$Search$staff$results$name.stub(_then(_instance))
        : CopyWith$Query$Search$staff$results$name(
            local$name, (e) => call(name: e));
  }

  CopyWith$Query$Search$staff$results$image<TRes> get image {
    final local$image = _instance.image;
    return local$image == null
        ? CopyWith$Query$Search$staff$results$image.stub(_then(_instance))
        : CopyWith$Query$Search$staff$results$image(
            local$image, (e) => call(image: e));
  }
}

class _CopyWithStubImpl$Query$Search$staff$results<TRes>
    implements CopyWith$Query$Search$staff$results<TRes> {
  _CopyWithStubImpl$Query$Search$staff$results(this._res);

  TRes _res;

  call({
    int? id,
    String? siteUrl,
    List<String?>? primaryOccupations,
    Query$Search$staff$results$name? name,
    Query$Search$staff$results$image? image,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Search$staff$results$name<TRes> get name =>
      CopyWith$Query$Search$staff$results$name.stub(_res);
  CopyWith$Query$Search$staff$results$image<TRes> get image =>
      CopyWith$Query$Search$staff$results$image.stub(_res);
}

class Query$Search$staff$results$name {
  Query$Search$staff$results$name({
    this.full,
    this.native,
    this.$__typename = 'StaffName',
  });

  factory Query$Search$staff$results$name.fromJson(Map<String, dynamic> json) {
    final l$full = json['full'];
    final l$native = json['native'];
    final l$$__typename = json['__typename'];
    return Query$Search$staff$results$name(
      full: (l$full as String?),
      native: (l$native as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? full;

  final String? native;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$full = full;
    _resultData['full'] = l$full;
    final l$native = native;
    _resultData['native'] = l$native;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$full = full;
    final l$native = native;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$full,
      l$native,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$staff$results$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$full = full;
    final lOther$full = other.full;
    if (l$full != lOther$full) {
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

extension UtilityExtension$Query$Search$staff$results$name
    on Query$Search$staff$results$name {
  CopyWith$Query$Search$staff$results$name<Query$Search$staff$results$name>
      get copyWith => CopyWith$Query$Search$staff$results$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$staff$results$name<TRes> {
  factory CopyWith$Query$Search$staff$results$name(
    Query$Search$staff$results$name instance,
    TRes Function(Query$Search$staff$results$name) then,
  ) = _CopyWithImpl$Query$Search$staff$results$name;

  factory CopyWith$Query$Search$staff$results$name.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$staff$results$name;

  TRes call({
    String? full,
    String? native,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$staff$results$name<TRes>
    implements CopyWith$Query$Search$staff$results$name<TRes> {
  _CopyWithImpl$Query$Search$staff$results$name(
    this._instance,
    this._then,
  );

  final Query$Search$staff$results$name _instance;

  final TRes Function(Query$Search$staff$results$name) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? full = _undefined,
    Object? native = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$staff$results$name(
        full: full == _undefined ? _instance.full : (full as String?),
        native: native == _undefined ? _instance.native : (native as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$staff$results$name<TRes>
    implements CopyWith$Query$Search$staff$results$name<TRes> {
  _CopyWithStubImpl$Query$Search$staff$results$name(this._res);

  TRes _res;

  call({
    String? full,
    String? native,
    String? $__typename,
  }) =>
      _res;
}

class Query$Search$staff$results$image {
  Query$Search$staff$results$image({
    this.large,
    this.medium,
    this.$__typename = 'StaffImage',
  });

  factory Query$Search$staff$results$image.fromJson(Map<String, dynamic> json) {
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$$__typename = json['__typename'];
    return Query$Search$staff$results$image(
      large: (l$large as String?),
      medium: (l$medium as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? large;

  final String? medium;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$large = large;
    _resultData['large'] = l$large;
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$large = large;
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$large,
      l$medium,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Search$staff$results$image) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$Search$staff$results$image
    on Query$Search$staff$results$image {
  CopyWith$Query$Search$staff$results$image<Query$Search$staff$results$image>
      get copyWith => CopyWith$Query$Search$staff$results$image(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Search$staff$results$image<TRes> {
  factory CopyWith$Query$Search$staff$results$image(
    Query$Search$staff$results$image instance,
    TRes Function(Query$Search$staff$results$image) then,
  ) = _CopyWithImpl$Query$Search$staff$results$image;

  factory CopyWith$Query$Search$staff$results$image.stub(TRes res) =
      _CopyWithStubImpl$Query$Search$staff$results$image;

  TRes call({
    String? large,
    String? medium,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Search$staff$results$image<TRes>
    implements CopyWith$Query$Search$staff$results$image<TRes> {
  _CopyWithImpl$Query$Search$staff$results$image(
    this._instance,
    this._then,
  );

  final Query$Search$staff$results$image _instance;

  final TRes Function(Query$Search$staff$results$image) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Search$staff$results$image(
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Search$staff$results$image<TRes>
    implements CopyWith$Query$Search$staff$results$image<TRes> {
  _CopyWithStubImpl$Query$Search$staff$results$image(this._res);

  TRes _res;

  call({
    String? large,
    String? medium,
    String? $__typename,
  }) =>
      _res;
}
