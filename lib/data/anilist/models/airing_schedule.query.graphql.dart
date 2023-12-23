import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$AiringSchedule {
  factory Variables$Query$AiringSchedule({
    int? start,
    int? end,
    int? page,
  }) =>
      Variables$Query$AiringSchedule._({
        if (start != null) r'start': start,
        if (end != null) r'end': end,
        if (page != null) r'page': page,
      });

  Variables$Query$AiringSchedule._(this._$data);

  factory Variables$Query$AiringSchedule.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('start')) {
      final l$start = data['start'];
      result$data['start'] = (l$start as int?);
    }
    if (data.containsKey('end')) {
      final l$end = data['end'];
      result$data['end'] = (l$end as int?);
    }
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    return Variables$Query$AiringSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get start => (_$data['start'] as int?);

  int? get end => (_$data['end'] as int?);

  int? get page => (_$data['page'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('start')) {
      final l$start = start;
      result$data['start'] = l$start;
    }
    if (_$data.containsKey('end')) {
      final l$end = end;
      result$data['end'] = l$end;
    }
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    return result$data;
  }

  CopyWith$Variables$Query$AiringSchedule<Variables$Query$AiringSchedule>
      get copyWith => CopyWith$Variables$Query$AiringSchedule(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$AiringSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$start = start;
    final lOther$start = other.start;
    if (_$data.containsKey('start') != other._$data.containsKey('start')) {
      return false;
    }
    if (l$start != lOther$start) {
      return false;
    }
    final l$end = end;
    final lOther$end = other.end;
    if (_$data.containsKey('end') != other._$data.containsKey('end')) {
      return false;
    }
    if (l$end != lOther$end) {
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
    final l$start = start;
    final l$end = end;
    final l$page = page;
    return Object.hashAll([
      _$data.containsKey('start') ? l$start : const {},
      _$data.containsKey('end') ? l$end : const {},
      _$data.containsKey('page') ? l$page : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$AiringSchedule<TRes> {
  factory CopyWith$Variables$Query$AiringSchedule(
    Variables$Query$AiringSchedule instance,
    TRes Function(Variables$Query$AiringSchedule) then,
  ) = _CopyWithImpl$Variables$Query$AiringSchedule;

  factory CopyWith$Variables$Query$AiringSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$AiringSchedule;

  TRes call({
    int? start,
    int? end,
    int? page,
  });
}

class _CopyWithImpl$Variables$Query$AiringSchedule<TRes>
    implements CopyWith$Variables$Query$AiringSchedule<TRes> {
  _CopyWithImpl$Variables$Query$AiringSchedule(
    this._instance,
    this._then,
  );

  final Variables$Query$AiringSchedule _instance;

  final TRes Function(Variables$Query$AiringSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? page = _undefined,
  }) =>
      _then(Variables$Query$AiringSchedule._({
        ..._instance._$data,
        if (start != _undefined) 'start': (start as int?),
        if (end != _undefined) 'end': (end as int?),
        if (page != _undefined) 'page': (page as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$AiringSchedule<TRes>
    implements CopyWith$Variables$Query$AiringSchedule<TRes> {
  _CopyWithStubImpl$Variables$Query$AiringSchedule(this._res);

  TRes _res;

  call({
    int? start,
    int? end,
    int? page,
  }) =>
      _res;
}

class Query$AiringSchedule {
  Query$AiringSchedule({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$AiringSchedule.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$AiringSchedule(
      Page: l$Page == null
          ? null
          : Query$AiringSchedule$Page.fromJson(
              (l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AiringSchedule$Page? Page;

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
    if (!(other is Query$AiringSchedule) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$AiringSchedule on Query$AiringSchedule {
  CopyWith$Query$AiringSchedule<Query$AiringSchedule> get copyWith =>
      CopyWith$Query$AiringSchedule(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$AiringSchedule<TRes> {
  factory CopyWith$Query$AiringSchedule(
    Query$AiringSchedule instance,
    TRes Function(Query$AiringSchedule) then,
  ) = _CopyWithImpl$Query$AiringSchedule;

  factory CopyWith$Query$AiringSchedule.stub(TRes res) =
      _CopyWithStubImpl$Query$AiringSchedule;

  TRes call({
    Query$AiringSchedule$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$AiringSchedule$Page<TRes> get Page;
}

class _CopyWithImpl$Query$AiringSchedule<TRes>
    implements CopyWith$Query$AiringSchedule<TRes> {
  _CopyWithImpl$Query$AiringSchedule(
    this._instance,
    this._then,
  );

  final Query$AiringSchedule _instance;

  final TRes Function(Query$AiringSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AiringSchedule(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$AiringSchedule$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AiringSchedule$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$AiringSchedule$Page.stub(_then(_instance))
        : CopyWith$Query$AiringSchedule$Page(local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$AiringSchedule<TRes>
    implements CopyWith$Query$AiringSchedule<TRes> {
  _CopyWithStubImpl$Query$AiringSchedule(this._res);

  TRes _res;

  call({
    Query$AiringSchedule$Page? Page,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AiringSchedule$Page<TRes> get Page =>
      CopyWith$Query$AiringSchedule$Page.stub(_res);
}

const documentNodeQueryAiringSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'AiringSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'start')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'end')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'page')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
            name: NameNode(value: 'airingSchedules'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'airingAt_greater'),
                value: VariableNode(name: NameNode(value: 'start')),
              ),
              ArgumentNode(
                name: NameNode(value: 'airingAt_lesser'),
                value: VariableNode(name: NameNode(value: 'end')),
              ),
              ArgumentNode(
                name: NameNode(value: 'sort'),
                value: EnumValueNode(name: NameNode(value: 'TIME_DESC')),
              ),
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
                name: NameNode(value: 'episode'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'airingAt'),
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
Query$AiringSchedule _parserFn$Query$AiringSchedule(
        Map<String, dynamic> data) =>
    Query$AiringSchedule.fromJson(data);
typedef OnQueryComplete$Query$AiringSchedule = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$AiringSchedule?,
);

class Options$Query$AiringSchedule
    extends graphql.QueryOptions<Query$AiringSchedule> {
  Options$Query$AiringSchedule({
    String? operationName,
    Variables$Query$AiringSchedule? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AiringSchedule? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$AiringSchedule? onComplete,
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
                    data == null ? null : _parserFn$Query$AiringSchedule(data),
                  ),
          onError: onError,
          document: documentNodeQueryAiringSchedule,
          parserFn: _parserFn$Query$AiringSchedule,
        );

  final OnQueryComplete$Query$AiringSchedule? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$AiringSchedule
    extends graphql.WatchQueryOptions<Query$AiringSchedule> {
  WatchOptions$Query$AiringSchedule({
    String? operationName,
    Variables$Query$AiringSchedule? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$AiringSchedule? typedOptimisticResult,
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
          document: documentNodeQueryAiringSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$AiringSchedule,
        );
}

class FetchMoreOptions$Query$AiringSchedule extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$AiringSchedule({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$AiringSchedule? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryAiringSchedule,
        );
}

extension ClientExtension$Query$AiringSchedule on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$AiringSchedule>> query$AiringSchedule(
          [Options$Query$AiringSchedule? options]) async =>
      await this.query(options ?? Options$Query$AiringSchedule());
  graphql.ObservableQuery<Query$AiringSchedule> watchQuery$AiringSchedule(
          [WatchOptions$Query$AiringSchedule? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$AiringSchedule());
  void writeQuery$AiringSchedule({
    required Query$AiringSchedule data,
    Variables$Query$AiringSchedule? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryAiringSchedule),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$AiringSchedule? readQuery$AiringSchedule({
    Variables$Query$AiringSchedule? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryAiringSchedule),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$AiringSchedule.fromJson(result);
  }
}

class Query$AiringSchedule$Page {
  Query$AiringSchedule$Page({
    this.pageInfo,
    this.airingSchedules,
    this.$__typename = 'Page',
  });

  factory Query$AiringSchedule$Page.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$airingSchedules = json['airingSchedules'];
    final l$$__typename = json['__typename'];
    return Query$AiringSchedule$Page(
      pageInfo: l$pageInfo == null
          ? null
          : Query$AiringSchedule$Page$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      airingSchedules: (l$airingSchedules as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$AiringSchedule$Page$airingSchedules.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$AiringSchedule$Page$pageInfo? pageInfo;

  final List<Query$AiringSchedule$Page$airingSchedules?>? airingSchedules;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$airingSchedules = airingSchedules;
    _resultData['airingSchedules'] =
        l$airingSchedules?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$airingSchedules = airingSchedules;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$airingSchedules == null
          ? null
          : Object.hashAll(l$airingSchedules.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$AiringSchedule$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$airingSchedules = airingSchedules;
    final lOther$airingSchedules = other.airingSchedules;
    if (l$airingSchedules != null && lOther$airingSchedules != null) {
      if (l$airingSchedules.length != lOther$airingSchedules.length) {
        return false;
      }
      for (int i = 0; i < l$airingSchedules.length; i++) {
        final l$airingSchedules$entry = l$airingSchedules[i];
        final lOther$airingSchedules$entry = lOther$airingSchedules[i];
        if (l$airingSchedules$entry != lOther$airingSchedules$entry) {
          return false;
        }
      }
    } else if (l$airingSchedules != lOther$airingSchedules) {
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

extension UtilityExtension$Query$AiringSchedule$Page
    on Query$AiringSchedule$Page {
  CopyWith$Query$AiringSchedule$Page<Query$AiringSchedule$Page> get copyWith =>
      CopyWith$Query$AiringSchedule$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$AiringSchedule$Page<TRes> {
  factory CopyWith$Query$AiringSchedule$Page(
    Query$AiringSchedule$Page instance,
    TRes Function(Query$AiringSchedule$Page) then,
  ) = _CopyWithImpl$Query$AiringSchedule$Page;

  factory CopyWith$Query$AiringSchedule$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$AiringSchedule$Page;

  TRes call({
    Query$AiringSchedule$Page$pageInfo? pageInfo,
    List<Query$AiringSchedule$Page$airingSchedules?>? airingSchedules,
    String? $__typename,
  });
  CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> get pageInfo;
  TRes airingSchedules(
      Iterable<Query$AiringSchedule$Page$airingSchedules?>? Function(
              Iterable<
                  CopyWith$Query$AiringSchedule$Page$airingSchedules<
                      Query$AiringSchedule$Page$airingSchedules>?>?)
          _fn);
}

class _CopyWithImpl$Query$AiringSchedule$Page<TRes>
    implements CopyWith$Query$AiringSchedule$Page<TRes> {
  _CopyWithImpl$Query$AiringSchedule$Page(
    this._instance,
    this._then,
  );

  final Query$AiringSchedule$Page _instance;

  final TRes Function(Query$AiringSchedule$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? airingSchedules = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AiringSchedule$Page(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$AiringSchedule$Page$pageInfo?),
        airingSchedules: airingSchedules == _undefined
            ? _instance.airingSchedules
            : (airingSchedules
                as List<Query$AiringSchedule$Page$airingSchedules?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$AiringSchedule$Page$pageInfo.stub(_then(_instance))
        : CopyWith$Query$AiringSchedule$Page$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes airingSchedules(
          Iterable<Query$AiringSchedule$Page$airingSchedules?>? Function(
                  Iterable<
                      CopyWith$Query$AiringSchedule$Page$airingSchedules<
                          Query$AiringSchedule$Page$airingSchedules>?>?)
              _fn) =>
      call(
          airingSchedules: _fn(_instance.airingSchedules?.map((e) => e == null
              ? null
              : CopyWith$Query$AiringSchedule$Page$airingSchedules(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$AiringSchedule$Page<TRes>
    implements CopyWith$Query$AiringSchedule$Page<TRes> {
  _CopyWithStubImpl$Query$AiringSchedule$Page(this._res);

  TRes _res;

  call({
    Query$AiringSchedule$Page$pageInfo? pageInfo,
    List<Query$AiringSchedule$Page$airingSchedules?>? airingSchedules,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$AiringSchedule$Page$pageInfo.stub(_res);

  airingSchedules(_fn) => _res;
}

class Query$AiringSchedule$Page$pageInfo {
  Query$AiringSchedule$Page$pageInfo({
    this.hasNextPage,
    this.total,
    this.$__typename = 'PageInfo',
  });

  factory Query$AiringSchedule$Page$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Query$AiringSchedule$Page$pageInfo(
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
    if (!(other is Query$AiringSchedule$Page$pageInfo) ||
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

extension UtilityExtension$Query$AiringSchedule$Page$pageInfo
    on Query$AiringSchedule$Page$pageInfo {
  CopyWith$Query$AiringSchedule$Page$pageInfo<
          Query$AiringSchedule$Page$pageInfo>
      get copyWith => CopyWith$Query$AiringSchedule$Page$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> {
  factory CopyWith$Query$AiringSchedule$Page$pageInfo(
    Query$AiringSchedule$Page$pageInfo instance,
    TRes Function(Query$AiringSchedule$Page$pageInfo) then,
  ) = _CopyWithImpl$Query$AiringSchedule$Page$pageInfo;

  factory CopyWith$Query$AiringSchedule$Page$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$AiringSchedule$Page$pageInfo;

  TRes call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$AiringSchedule$Page$pageInfo<TRes>
    implements CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> {
  _CopyWithImpl$Query$AiringSchedule$Page$pageInfo(
    this._instance,
    this._then,
  );

  final Query$AiringSchedule$Page$pageInfo _instance;

  final TRes Function(Query$AiringSchedule$Page$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AiringSchedule$Page$pageInfo(
        hasNextPage: hasNextPage == _undefined
            ? _instance.hasNextPage
            : (hasNextPage as bool?),
        total: total == _undefined ? _instance.total : (total as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$AiringSchedule$Page$pageInfo<TRes>
    implements CopyWith$Query$AiringSchedule$Page$pageInfo<TRes> {
  _CopyWithStubImpl$Query$AiringSchedule$Page$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    int? total,
    String? $__typename,
  }) =>
      _res;
}

class Query$AiringSchedule$Page$airingSchedules {
  Query$AiringSchedule$Page$airingSchedules({
    required this.id,
    required this.episode,
    required this.airingAt,
    this.media,
    this.$__typename = 'AiringSchedule',
  });

  factory Query$AiringSchedule$Page$airingSchedules.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$episode = json['episode'];
    final l$airingAt = json['airingAt'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$AiringSchedule$Page$airingSchedules(
      id: (l$id as int),
      episode: (l$episode as int),
      airingAt: (l$airingAt as int),
      media: l$media == null
          ? null
          : Fragment$shortMedia.fromJson((l$media as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final int episode;

  final int airingAt;

  final Fragment$shortMedia? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$episode = episode;
    _resultData['episode'] = l$episode;
    final l$airingAt = airingAt;
    _resultData['airingAt'] = l$airingAt;
    final l$media = media;
    _resultData['media'] = l$media?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$episode = episode;
    final l$airingAt = airingAt;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$episode,
      l$airingAt,
      l$media,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$AiringSchedule$Page$airingSchedules) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) {
      return false;
    }
    final l$airingAt = airingAt;
    final lOther$airingAt = other.airingAt;
    if (l$airingAt != lOther$airingAt) {
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

extension UtilityExtension$Query$AiringSchedule$Page$airingSchedules
    on Query$AiringSchedule$Page$airingSchedules {
  CopyWith$Query$AiringSchedule$Page$airingSchedules<
          Query$AiringSchedule$Page$airingSchedules>
      get copyWith => CopyWith$Query$AiringSchedule$Page$airingSchedules(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$AiringSchedule$Page$airingSchedules<TRes> {
  factory CopyWith$Query$AiringSchedule$Page$airingSchedules(
    Query$AiringSchedule$Page$airingSchedules instance,
    TRes Function(Query$AiringSchedule$Page$airingSchedules) then,
  ) = _CopyWithImpl$Query$AiringSchedule$Page$airingSchedules;

  factory CopyWith$Query$AiringSchedule$Page$airingSchedules.stub(TRes res) =
      _CopyWithStubImpl$Query$AiringSchedule$Page$airingSchedules;

  TRes call({
    int? id,
    int? episode,
    int? airingAt,
    Fragment$shortMedia? media,
    String? $__typename,
  });
  CopyWith$Fragment$shortMedia<TRes> get media;
}

class _CopyWithImpl$Query$AiringSchedule$Page$airingSchedules<TRes>
    implements CopyWith$Query$AiringSchedule$Page$airingSchedules<TRes> {
  _CopyWithImpl$Query$AiringSchedule$Page$airingSchedules(
    this._instance,
    this._then,
  );

  final Query$AiringSchedule$Page$airingSchedules _instance;

  final TRes Function(Query$AiringSchedule$Page$airingSchedules) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? episode = _undefined,
    Object? airingAt = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$AiringSchedule$Page$airingSchedules(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        episode: episode == _undefined || episode == null
            ? _instance.episode
            : (episode as int),
        airingAt: airingAt == _undefined || airingAt == null
            ? _instance.airingAt
            : (airingAt as int),
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

class _CopyWithStubImpl$Query$AiringSchedule$Page$airingSchedules<TRes>
    implements CopyWith$Query$AiringSchedule$Page$airingSchedules<TRes> {
  _CopyWithStubImpl$Query$AiringSchedule$Page$airingSchedules(this._res);

  TRes _res;

  call({
    int? id,
    int? episode,
    int? airingAt,
    Fragment$shortMedia? media,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$shortMedia<TRes> get media =>
      CopyWith$Fragment$shortMedia.stub(_res);
}
