import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Trending {
  factory Variables$Query$Trending({int? page}) => Variables$Query$Trending._({
        if (page != null) r'page': page,
      });

  Variables$Query$Trending._(this._$data);

  factory Variables$Query$Trending.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    return Variables$Query$Trending._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get page => (_$data['page'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    return result$data;
  }

  CopyWith$Variables$Query$Trending<Variables$Query$Trending> get copyWith =>
      CopyWith$Variables$Query$Trending(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Trending) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (_$data.containsKey('page') != other._$data.containsKey('page')) {
      return false;
    }
    if (l$page != lOther$page) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    return Object.hashAll([_$data.containsKey('page') ? l$page : const {}]);
  }
}

abstract class CopyWith$Variables$Query$Trending<TRes> {
  factory CopyWith$Variables$Query$Trending(
    Variables$Query$Trending instance,
    TRes Function(Variables$Query$Trending) then,
  ) = _CopyWithImpl$Variables$Query$Trending;

  factory CopyWith$Variables$Query$Trending.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Trending;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$Trending<TRes>
    implements CopyWith$Variables$Query$Trending<TRes> {
  _CopyWithImpl$Variables$Query$Trending(
    this._instance,
    this._then,
  );

  final Variables$Query$Trending _instance;

  final TRes Function(Variables$Query$Trending) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) => _then(Variables$Query$Trending._({
        ..._instance._$data,
        if (page != _undefined) 'page': (page as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Trending<TRes>
    implements CopyWith$Variables$Query$Trending<TRes> {
  _CopyWithStubImpl$Variables$Query$Trending(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$Trending {
  Query$Trending({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$Trending.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$Trending(
      Page: l$Page == null
          ? null
          : Query$Trending$Page.fromJson((l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Trending$Page? Page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Page = Page;
    _resultData['Page'] = l$Page?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Page = Page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Trending) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Page = Page;
    final lOther$Page = other.Page;
    if (l$Page != lOther$Page) {
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

extension UtilityExtension$Query$Trending on Query$Trending {
  CopyWith$Query$Trending<Query$Trending> get copyWith =>
      CopyWith$Query$Trending(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Trending<TRes> {
  factory CopyWith$Query$Trending(
    Query$Trending instance,
    TRes Function(Query$Trending) then,
  ) = _CopyWithImpl$Query$Trending;

  factory CopyWith$Query$Trending.stub(TRes res) =
      _CopyWithStubImpl$Query$Trending;

  TRes call({
    Query$Trending$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$Trending$Page<TRes> get Page;
}

class _CopyWithImpl$Query$Trending<TRes>
    implements CopyWith$Query$Trending<TRes> {
  _CopyWithImpl$Query$Trending(
    this._instance,
    this._then,
  );

  final Query$Trending _instance;

  final TRes Function(Query$Trending) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Trending(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$Trending$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Trending$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$Trending$Page.stub(_then(_instance))
        : CopyWith$Query$Trending$Page(local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$Trending<TRes>
    implements CopyWith$Query$Trending<TRes> {
  _CopyWithStubImpl$Query$Trending(this._res);

  TRes _res;

  call({
    Query$Trending$Page? Page,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Trending$Page<TRes> get Page =>
      CopyWith$Query$Trending$Page.stub(_res);
}

const documentNodeQueryTrending = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Trending'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'page')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'page'),
            value: VariableNode(name: NameNode(value: 'page')),
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
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'mediaTrends'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'trending'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
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
Query$Trending _parserFn$Query$Trending(Map<String, dynamic> data) =>
    Query$Trending.fromJson(data);
typedef OnQueryComplete$Query$Trending = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Trending?,
);

class Options$Query$Trending extends graphql.QueryOptions<Query$Trending> {
  Options$Query$Trending({
    String? operationName,
    Variables$Query$Trending? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Trending? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Trending? onComplete,
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
                    data == null ? null : _parserFn$Query$Trending(data),
                  ),
          onError: onError,
          document: documentNodeQueryTrending,
          parserFn: _parserFn$Query$Trending,
        );

  final OnQueryComplete$Query$Trending? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Trending
    extends graphql.WatchQueryOptions<Query$Trending> {
  WatchOptions$Query$Trending({
    String? operationName,
    Variables$Query$Trending? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Trending? typedOptimisticResult,
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
          document: documentNodeQueryTrending,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Trending,
        );
}

class FetchMoreOptions$Query$Trending extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Trending({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Trending? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryTrending,
        );
}

extension ClientExtension$Query$Trending on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Trending>> query$Trending(
          [Options$Query$Trending? options]) async =>
      await this.query(options ?? Options$Query$Trending());
  graphql.ObservableQuery<Query$Trending> watchQuery$Trending(
          [WatchOptions$Query$Trending? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Trending());
  void writeQuery$Trending({
    required Query$Trending data,
    Variables$Query$Trending? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryTrending),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Trending? readQuery$Trending({
    Variables$Query$Trending? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryTrending),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Trending.fromJson(result);
  }
}

class Query$Trending$Page {
  Query$Trending$Page({
    this.pageInfo,
    this.mediaTrends,
    this.$__typename = 'Page',
  });

  factory Query$Trending$Page.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$mediaTrends = json['mediaTrends'];
    final l$$__typename = json['__typename'];
    return Query$Trending$Page(
      pageInfo: l$pageInfo == null
          ? null
          : Query$Trending$Page$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      mediaTrends: (l$mediaTrends as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Trending$Page$mediaTrends.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Trending$Page$pageInfo? pageInfo;

  final List<Query$Trending$Page$mediaTrends?>? mediaTrends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$mediaTrends = mediaTrends;
    _resultData['mediaTrends'] =
        l$mediaTrends?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$mediaTrends = mediaTrends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$mediaTrends == null
          ? null
          : Object.hashAll(l$mediaTrends.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Trending$Page) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$mediaTrends = mediaTrends;
    final lOther$mediaTrends = other.mediaTrends;
    if (l$mediaTrends != null && lOther$mediaTrends != null) {
      if (l$mediaTrends.length != lOther$mediaTrends.length) {
        return false;
      }
      for (int i = 0; i < l$mediaTrends.length; i++) {
        final l$mediaTrends$entry = l$mediaTrends[i];
        final lOther$mediaTrends$entry = lOther$mediaTrends[i];
        if (l$mediaTrends$entry != lOther$mediaTrends$entry) {
          return false;
        }
      }
    } else if (l$mediaTrends != lOther$mediaTrends) {
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

extension UtilityExtension$Query$Trending$Page on Query$Trending$Page {
  CopyWith$Query$Trending$Page<Query$Trending$Page> get copyWith =>
      CopyWith$Query$Trending$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Trending$Page<TRes> {
  factory CopyWith$Query$Trending$Page(
    Query$Trending$Page instance,
    TRes Function(Query$Trending$Page) then,
  ) = _CopyWithImpl$Query$Trending$Page;

  factory CopyWith$Query$Trending$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$Trending$Page;

  TRes call({
    Query$Trending$Page$pageInfo? pageInfo,
    List<Query$Trending$Page$mediaTrends?>? mediaTrends,
    String? $__typename,
  });
  CopyWith$Query$Trending$Page$pageInfo<TRes> get pageInfo;
  TRes mediaTrends(
      Iterable<Query$Trending$Page$mediaTrends?>? Function(
              Iterable<
                  CopyWith$Query$Trending$Page$mediaTrends<
                      Query$Trending$Page$mediaTrends>?>?)
          _fn);
}

class _CopyWithImpl$Query$Trending$Page<TRes>
    implements CopyWith$Query$Trending$Page<TRes> {
  _CopyWithImpl$Query$Trending$Page(
    this._instance,
    this._then,
  );

  final Query$Trending$Page _instance;

  final TRes Function(Query$Trending$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? mediaTrends = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Trending$Page(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$Trending$Page$pageInfo?),
        mediaTrends: mediaTrends == _undefined
            ? _instance.mediaTrends
            : (mediaTrends as List<Query$Trending$Page$mediaTrends?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Trending$Page$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$Trending$Page$pageInfo.stub(_then(_instance))
        : CopyWith$Query$Trending$Page$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes mediaTrends(
          Iterable<Query$Trending$Page$mediaTrends?>? Function(
                  Iterable<
                      CopyWith$Query$Trending$Page$mediaTrends<
                          Query$Trending$Page$mediaTrends>?>?)
              _fn) =>
      call(
          mediaTrends: _fn(_instance.mediaTrends?.map((e) => e == null
              ? null
              : CopyWith$Query$Trending$Page$mediaTrends(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Trending$Page<TRes>
    implements CopyWith$Query$Trending$Page<TRes> {
  _CopyWithStubImpl$Query$Trending$Page(this._res);

  TRes _res;

  call({
    Query$Trending$Page$pageInfo? pageInfo,
    List<Query$Trending$Page$mediaTrends?>? mediaTrends,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Trending$Page$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Trending$Page$pageInfo.stub(_res);

  mediaTrends(_fn) => _res;
}

class Query$Trending$Page$pageInfo {
  Query$Trending$Page$pageInfo({
    this.hasNextPage,
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Trending$Page$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Trending$Page$pageInfo(
      hasNextPage: (l$hasNextPage as bool?),
      total: (l$total as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? hasNextPage;

  final int? total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Trending$Page$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
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

extension UtilityExtension$Query$Trending$Page$pageInfo
    on Query$Trending$Page$pageInfo {
  CopyWith$Query$Trending$Page$pageInfo<Query$Trending$Page$pageInfo>
      get copyWith => CopyWith$Query$Trending$Page$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Trending$Page$pageInfo<TRes> {
  factory CopyWith$Query$Trending$Page$pageInfo(
    Query$Trending$Page$pageInfo instance,
    TRes Function(Query$Trending$Page$pageInfo) then,
  ) = _CopyWithImpl$Query$Trending$Page$pageInfo;

  factory CopyWith$Query$Trending$Page$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Trending$Page$pageInfo;

  TRes call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Trending$Page$pageInfo<TRes>
    implements CopyWith$Query$Trending$Page$pageInfo<TRes> {
  _CopyWithImpl$Query$Trending$Page$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Trending$Page$pageInfo _instance;

  final TRes Function(Query$Trending$Page$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Trending$Page$pageInfo(
        hasNextPage: hasNextPage == _undefined
            ? _instance.hasNextPage
            : (hasNextPage as bool?),
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Trending$Page$pageInfo<TRes>
    implements CopyWith$Query$Trending$Page$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Trending$Page$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$Trending$Page$mediaTrends {
  Query$Trending$Page$mediaTrends({
    required this.trending,
    this.media,
    this.$__typename = 'MediaTrend',
  });

  factory Query$Trending$Page$mediaTrends.fromJson(Map<String, dynamic> json) {
    final l$trending = json['trending'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$Trending$Page$mediaTrends(
      trending: (l$trending as int),
      media: l$media == null
          ? null
          : Fragment$shortMedia.fromJson((l$media as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int trending;

  final Fragment$shortMedia? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$trending = trending;
    _resultData['trending'] = l$trending;
    final l$media = media;
    _resultData['media'] = l$media?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$trending = trending;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$trending,
      l$media,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Trending$Page$mediaTrends) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$trending = trending;
    final lOther$trending = other.trending;
    if (l$trending != lOther$trending) {
      return false;
    }
    final l$media = media;
    final lOther$media = other.media;
    if (l$media != lOther$media) {
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

extension UtilityExtension$Query$Trending$Page$mediaTrends
    on Query$Trending$Page$mediaTrends {
  CopyWith$Query$Trending$Page$mediaTrends<Query$Trending$Page$mediaTrends>
      get copyWith => CopyWith$Query$Trending$Page$mediaTrends(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Trending$Page$mediaTrends<TRes> {
  factory CopyWith$Query$Trending$Page$mediaTrends(
    Query$Trending$Page$mediaTrends instance,
    TRes Function(Query$Trending$Page$mediaTrends) then,
  ) = _CopyWithImpl$Query$Trending$Page$mediaTrends;

  factory CopyWith$Query$Trending$Page$mediaTrends.stub(TRes res) =
      _CopyWithStubImpl$Query$Trending$Page$mediaTrends;

  TRes call({
    int? trending,
    Fragment$shortMedia? media,
    String? $__typename,
  });
  CopyWith$Fragment$shortMedia<TRes> get media;
}

class _CopyWithImpl$Query$Trending$Page$mediaTrends<TRes>
    implements CopyWith$Query$Trending$Page$mediaTrends<TRes> {
  _CopyWithImpl$Query$Trending$Page$mediaTrends(
    this._instance,
    this._then,
  );

  final Query$Trending$Page$mediaTrends _instance;

  final TRes Function(Query$Trending$Page$mediaTrends) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? trending = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Trending$Page$mediaTrends(
        trending: trending == _undefined || trending == null
            ? _instance.trending
            : (trending as int),
        media: media == _undefined
            ? _instance.media
            : (media as Fragment$shortMedia?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Fragment$shortMedia<TRes> get media {
    final local$media = _instance.media;
    return local$media == null
        ? CopyWith$Fragment$shortMedia.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia(local$media, (e) => call(media: e));
  }
}

class _CopyWithStubImpl$Query$Trending$Page$mediaTrends<TRes>
    implements CopyWith$Query$Trending$Page$mediaTrends<TRes> {
  _CopyWithStubImpl$Query$Trending$Page$mediaTrends(this._res);

  TRes _res;

  call({
    int? trending,
    Fragment$shortMedia? media,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$shortMedia<TRes> get media =>
      CopyWith$Fragment$shortMedia.stub(_res);
}
