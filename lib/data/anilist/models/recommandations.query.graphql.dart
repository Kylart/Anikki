import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$Recommendations {
  factory Variables$Query$Recommendations({int? page}) =>
      Variables$Query$Recommendations._({
        if (page != null) r'page': page,
      });

  Variables$Query$Recommendations._(this._$data);

  factory Variables$Query$Recommendations.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    return Variables$Query$Recommendations._(result$data);
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

  CopyWith$Variables$Query$Recommendations<Variables$Query$Recommendations>
      get copyWith => CopyWith$Variables$Query$Recommendations(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$Recommendations) ||
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

abstract class CopyWith$Variables$Query$Recommendations<TRes> {
  factory CopyWith$Variables$Query$Recommendations(
    Variables$Query$Recommendations instance,
    TRes Function(Variables$Query$Recommendations) then,
  ) = _CopyWithImpl$Variables$Query$Recommendations;

  factory CopyWith$Variables$Query$Recommendations.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$Recommendations;

  TRes call({int? page});
}

class _CopyWithImpl$Variables$Query$Recommendations<TRes>
    implements CopyWith$Variables$Query$Recommendations<TRes> {
  _CopyWithImpl$Variables$Query$Recommendations(
    this._instance,
    this._then,
  );

  final Variables$Query$Recommendations _instance;

  final TRes Function(Variables$Query$Recommendations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined}) =>
      _then(Variables$Query$Recommendations._({
        ..._instance._$data,
        if (page != _undefined) 'page': (page as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$Recommendations<TRes>
    implements CopyWith$Variables$Query$Recommendations<TRes> {
  _CopyWithStubImpl$Variables$Query$Recommendations(this._res);

  TRes _res;

  call({int? page}) => _res;
}

class Query$Recommendations {
  Query$Recommendations({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$Recommendations.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$Recommendations(
      Page: l$Page == null
          ? null
          : Query$Recommendations$Page.fromJson(
              (l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Recommendations$Page? Page;

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
    if (!(other is Query$Recommendations) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$Recommendations on Query$Recommendations {
  CopyWith$Query$Recommendations<Query$Recommendations> get copyWith =>
      CopyWith$Query$Recommendations(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Recommendations<TRes> {
  factory CopyWith$Query$Recommendations(
    Query$Recommendations instance,
    TRes Function(Query$Recommendations) then,
  ) = _CopyWithImpl$Query$Recommendations;

  factory CopyWith$Query$Recommendations.stub(TRes res) =
      _CopyWithStubImpl$Query$Recommendations;

  TRes call({
    Query$Recommendations$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$Recommendations$Page<TRes> get Page;
}

class _CopyWithImpl$Query$Recommendations<TRes>
    implements CopyWith$Query$Recommendations<TRes> {
  _CopyWithImpl$Query$Recommendations(
    this._instance,
    this._then,
  );

  final Query$Recommendations _instance;

  final TRes Function(Query$Recommendations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Recommendations(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$Recommendations$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Recommendations$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$Recommendations$Page.stub(_then(_instance))
        : CopyWith$Query$Recommendations$Page(local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$Recommendations<TRes>
    implements CopyWith$Query$Recommendations<TRes> {
  _CopyWithStubImpl$Query$Recommendations(this._res);

  TRes _res;

  call({
    Query$Recommendations$Page? Page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Recommendations$Page<TRes> get Page =>
      CopyWith$Query$Recommendations$Page.stub(_res);
}

const documentNodeQueryRecommendations = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Recommendations'),
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
            name: NameNode(value: 'recommendations'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'mediaRecommendation'),
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
Query$Recommendations _parserFn$Query$Recommendations(
        Map<String, dynamic> data) =>
    Query$Recommendations.fromJson(data);
typedef OnQueryComplete$Query$Recommendations = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Recommendations?,
);

class Options$Query$Recommendations
    extends graphql.QueryOptions<Query$Recommendations> {
  Options$Query$Recommendations({
    String? operationName,
    Variables$Query$Recommendations? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Recommendations? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Recommendations? onComplete,
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
                    data == null ? null : _parserFn$Query$Recommendations(data),
                  ),
          onError: onError,
          document: documentNodeQueryRecommendations,
          parserFn: _parserFn$Query$Recommendations,
        );

  final OnQueryComplete$Query$Recommendations? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Recommendations
    extends graphql.WatchQueryOptions<Query$Recommendations> {
  WatchOptions$Query$Recommendations({
    String? operationName,
    Variables$Query$Recommendations? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Recommendations? typedOptimisticResult,
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
          document: documentNodeQueryRecommendations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Recommendations,
        );
}

class FetchMoreOptions$Query$Recommendations extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Recommendations({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$Recommendations? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryRecommendations,
        );
}

extension ClientExtension$Query$Recommendations on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Recommendations>> query$Recommendations(
          [Options$Query$Recommendations? options]) async =>
      await this.query(options ?? Options$Query$Recommendations());
  graphql.ObservableQuery<Query$Recommendations> watchQuery$Recommendations(
          [WatchOptions$Query$Recommendations? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Recommendations());
  void writeQuery$Recommendations({
    required Query$Recommendations data,
    Variables$Query$Recommendations? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryRecommendations),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Recommendations? readQuery$Recommendations({
    Variables$Query$Recommendations? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryRecommendations),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Recommendations.fromJson(result);
  }
}

class Query$Recommendations$Page {
  Query$Recommendations$Page({
    this.pageInfo,
    this.recommendations,
    this.$__typename = 'Page',
  });

  factory Query$Recommendations$Page.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$recommendations = json['recommendations'];
    final l$$__typename = json['__typename'];
    return Query$Recommendations$Page(
      pageInfo: l$pageInfo == null
          ? null
          : Query$Recommendations$Page$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      recommendations: (l$recommendations as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Recommendations$Page$recommendations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Recommendations$Page$pageInfo? pageInfo;

  final List<Query$Recommendations$Page$recommendations?>? recommendations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$recommendations = recommendations;
    _resultData['recommendations'] =
        l$recommendations?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$recommendations = recommendations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$recommendations == null
          ? null
          : Object.hashAll(l$recommendations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Recommendations$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$recommendations = recommendations;
    final lOther$recommendations = other.recommendations;
    if (l$recommendations != null && lOther$recommendations != null) {
      if (l$recommendations.length != lOther$recommendations.length) {
        return false;
      }
      for (int i = 0; i < l$recommendations.length; i++) {
        final l$recommendations$entry = l$recommendations[i];
        final lOther$recommendations$entry = lOther$recommendations[i];
        if (l$recommendations$entry != lOther$recommendations$entry) {
          return false;
        }
      }
    } else if (l$recommendations != lOther$recommendations) {
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

extension UtilityExtension$Query$Recommendations$Page
    on Query$Recommendations$Page {
  CopyWith$Query$Recommendations$Page<Query$Recommendations$Page>
      get copyWith => CopyWith$Query$Recommendations$Page(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Recommendations$Page<TRes> {
  factory CopyWith$Query$Recommendations$Page(
    Query$Recommendations$Page instance,
    TRes Function(Query$Recommendations$Page) then,
  ) = _CopyWithImpl$Query$Recommendations$Page;

  factory CopyWith$Query$Recommendations$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$Recommendations$Page;

  TRes call({
    Query$Recommendations$Page$pageInfo? pageInfo,
    List<Query$Recommendations$Page$recommendations?>? recommendations,
    String? $__typename,
  });
  CopyWith$Query$Recommendations$Page$pageInfo<TRes> get pageInfo;
  TRes recommendations(
      Iterable<Query$Recommendations$Page$recommendations?>? Function(
              Iterable<
                  CopyWith$Query$Recommendations$Page$recommendations<
                      Query$Recommendations$Page$recommendations>?>?)
          _fn);
}

class _CopyWithImpl$Query$Recommendations$Page<TRes>
    implements CopyWith$Query$Recommendations$Page<TRes> {
  _CopyWithImpl$Query$Recommendations$Page(
    this._instance,
    this._then,
  );

  final Query$Recommendations$Page _instance;

  final TRes Function(Query$Recommendations$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? recommendations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Recommendations$Page(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$Recommendations$Page$pageInfo?),
        recommendations: recommendations == _undefined
            ? _instance.recommendations
            : (recommendations
                as List<Query$Recommendations$Page$recommendations?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$Recommendations$Page$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$Recommendations$Page$pageInfo.stub(_then(_instance))
        : CopyWith$Query$Recommendations$Page$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes recommendations(
          Iterable<Query$Recommendations$Page$recommendations?>? Function(
                  Iterable<
                      CopyWith$Query$Recommendations$Page$recommendations<
                          Query$Recommendations$Page$recommendations>?>?)
              _fn) =>
      call(
          recommendations: _fn(_instance.recommendations?.map((e) => e == null
              ? null
              : CopyWith$Query$Recommendations$Page$recommendations(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$Recommendations$Page<TRes>
    implements CopyWith$Query$Recommendations$Page<TRes> {
  _CopyWithStubImpl$Query$Recommendations$Page(this._res);

  TRes _res;

  call({
    Query$Recommendations$Page$pageInfo? pageInfo,
    List<Query$Recommendations$Page$recommendations?>? recommendations,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$Recommendations$Page$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$Recommendations$Page$pageInfo.stub(_res);
  recommendations(_fn) => _res;
}

class Query$Recommendations$Page$pageInfo {
  Query$Recommendations$Page$pageInfo({
    this.hasNextPage,
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$Recommendations$Page$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$Recommendations$Page$pageInfo(
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
    if (!(other is Query$Recommendations$Page$pageInfo) ||
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

extension UtilityExtension$Query$Recommendations$Page$pageInfo
    on Query$Recommendations$Page$pageInfo {
  CopyWith$Query$Recommendations$Page$pageInfo<
          Query$Recommendations$Page$pageInfo>
      get copyWith => CopyWith$Query$Recommendations$Page$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Recommendations$Page$pageInfo<TRes> {
  factory CopyWith$Query$Recommendations$Page$pageInfo(
    Query$Recommendations$Page$pageInfo instance,
    TRes Function(Query$Recommendations$Page$pageInfo) then,
  ) = _CopyWithImpl$Query$Recommendations$Page$pageInfo;

  factory CopyWith$Query$Recommendations$Page$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$Recommendations$Page$pageInfo;

  TRes call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Recommendations$Page$pageInfo<TRes>
    implements CopyWith$Query$Recommendations$Page$pageInfo<TRes> {
  _CopyWithImpl$Query$Recommendations$Page$pageInfo(
    this._instance,
    this._then,
  );

  final Query$Recommendations$Page$pageInfo _instance;

  final TRes Function(Query$Recommendations$Page$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Recommendations$Page$pageInfo(
        hasNextPage: hasNextPage == _undefined
            ? _instance.hasNextPage
            : (hasNextPage as bool?),
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Recommendations$Page$pageInfo<TRes>
    implements CopyWith$Query$Recommendations$Page$pageInfo<TRes> {
  _CopyWithStubImpl$Query$Recommendations$Page$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$Recommendations$Page$recommendations {
  Query$Recommendations$Page$recommendations({
    this.mediaRecommendation,
    this.media,
    this.$__typename = 'Recommendation',
  });

  factory Query$Recommendations$Page$recommendations.fromJson(
      Map<String, dynamic> json) {
    final l$mediaRecommendation = json['mediaRecommendation'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$Recommendations$Page$recommendations(
      mediaRecommendation: l$mediaRecommendation == null
          ? null
          : Fragment$shortMedia.fromJson(
              (l$mediaRecommendation as Map<String, dynamic>)),
      media: l$media == null
          ? null
          : Fragment$shortMedia.fromJson((l$media as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$shortMedia? mediaRecommendation;

  final Fragment$shortMedia? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mediaRecommendation = mediaRecommendation;
    _resultData['mediaRecommendation'] = l$mediaRecommendation?.toJson();
    final l$media = media;
    _resultData['media'] = l$media?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mediaRecommendation = mediaRecommendation;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$mediaRecommendation,
      l$media,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Recommendations$Page$recommendations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mediaRecommendation = mediaRecommendation;
    final lOther$mediaRecommendation = other.mediaRecommendation;
    if (l$mediaRecommendation != lOther$mediaRecommendation) {
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

extension UtilityExtension$Query$Recommendations$Page$recommendations
    on Query$Recommendations$Page$recommendations {
  CopyWith$Query$Recommendations$Page$recommendations<
          Query$Recommendations$Page$recommendations>
      get copyWith => CopyWith$Query$Recommendations$Page$recommendations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Recommendations$Page$recommendations<TRes> {
  factory CopyWith$Query$Recommendations$Page$recommendations(
    Query$Recommendations$Page$recommendations instance,
    TRes Function(Query$Recommendations$Page$recommendations) then,
  ) = _CopyWithImpl$Query$Recommendations$Page$recommendations;

  factory CopyWith$Query$Recommendations$Page$recommendations.stub(TRes res) =
      _CopyWithStubImpl$Query$Recommendations$Page$recommendations;

  TRes call({
    Fragment$shortMedia? mediaRecommendation,
    Fragment$shortMedia? media,
    String? $__typename,
  });
  CopyWith$Fragment$shortMedia<TRes> get mediaRecommendation;
  CopyWith$Fragment$shortMedia<TRes> get media;
}

class _CopyWithImpl$Query$Recommendations$Page$recommendations<TRes>
    implements CopyWith$Query$Recommendations$Page$recommendations<TRes> {
  _CopyWithImpl$Query$Recommendations$Page$recommendations(
    this._instance,
    this._then,
  );

  final Query$Recommendations$Page$recommendations _instance;

  final TRes Function(Query$Recommendations$Page$recommendations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mediaRecommendation = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Recommendations$Page$recommendations(
        mediaRecommendation: mediaRecommendation == _undefined
            ? _instance.mediaRecommendation
            : (mediaRecommendation as Fragment$shortMedia?),
        media: media == _undefined
            ? _instance.media
            : (media as Fragment$shortMedia?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$shortMedia<TRes> get mediaRecommendation {
    final local$mediaRecommendation = _instance.mediaRecommendation;
    return local$mediaRecommendation == null
        ? CopyWith$Fragment$shortMedia.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia(
            local$mediaRecommendation, (e) => call(mediaRecommendation: e));
  }

  CopyWith$Fragment$shortMedia<TRes> get media {
    final local$media = _instance.media;
    return local$media == null
        ? CopyWith$Fragment$shortMedia.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia(local$media, (e) => call(media: e));
  }
}

class _CopyWithStubImpl$Query$Recommendations$Page$recommendations<TRes>
    implements CopyWith$Query$Recommendations$Page$recommendations<TRes> {
  _CopyWithStubImpl$Query$Recommendations$Page$recommendations(this._res);

  TRes _res;

  call({
    Fragment$shortMedia? mediaRecommendation,
    Fragment$shortMedia? media,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$shortMedia<TRes> get mediaRecommendation =>
      CopyWith$Fragment$shortMedia.stub(_res);
  CopyWith$Fragment$shortMedia<TRes> get media =>
      CopyWith$Fragment$shortMedia.stub(_res);
}
