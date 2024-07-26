import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.graphql.dart';

class Variables$Query$GetActivities {
  factory Variables$Query$GetActivities({
    int? userId,
    int? page,
  }) =>
      Variables$Query$GetActivities._({
        if (userId != null) r'userId': userId,
        if (page != null) r'page': page,
      });

  Variables$Query$GetActivities._(this._$data);

  factory Variables$Query$GetActivities.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as int?);
    }
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    return Variables$Query$GetActivities._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get userId => (_$data['userId'] as int?);

  int? get page => (_$data['page'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetActivities<Variables$Query$GetActivities>
      get copyWith => CopyWith$Variables$Query$GetActivities(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
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
    final l$userId = userId;
    final l$page = page;
    return Object.hashAll([
      _$data.containsKey('userId') ? l$userId : const {},
      _$data.containsKey('page') ? l$page : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetActivities<TRes> {
  factory CopyWith$Variables$Query$GetActivities(
    Variables$Query$GetActivities instance,
    TRes Function(Variables$Query$GetActivities) then,
  ) = _CopyWithImpl$Variables$Query$GetActivities;

  factory CopyWith$Variables$Query$GetActivities.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetActivities;

  TRes call({
    int? userId,
    int? page,
  });
}

class _CopyWithImpl$Variables$Query$GetActivities<TRes>
    implements CopyWith$Variables$Query$GetActivities<TRes> {
  _CopyWithImpl$Variables$Query$GetActivities(
    this._instance,
    this._then,
  );

  final Variables$Query$GetActivities _instance;

  final TRes Function(Variables$Query$GetActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? page = _undefined,
  }) =>
      _then(Variables$Query$GetActivities._({
        ..._instance._$data,
        if (userId != _undefined) 'userId': (userId as int?),
        if (page != _undefined) 'page': (page as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetActivities<TRes>
    implements CopyWith$Variables$Query$GetActivities<TRes> {
  _CopyWithStubImpl$Variables$Query$GetActivities(this._res);

  TRes _res;

  call({
    int? userId,
    int? page,
  }) =>
      _res;
}

class Query$GetActivities {
  Query$GetActivities({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$GetActivities.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$GetActivities(
      Page: l$Page == null
          ? null
          : Query$GetActivities$Page.fromJson((l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetActivities$Page? Page;

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
    if (!(other is Query$GetActivities) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetActivities on Query$GetActivities {
  CopyWith$Query$GetActivities<Query$GetActivities> get copyWith =>
      CopyWith$Query$GetActivities(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetActivities<TRes> {
  factory CopyWith$Query$GetActivities(
    Query$GetActivities instance,
    TRes Function(Query$GetActivities) then,
  ) = _CopyWithImpl$Query$GetActivities;

  factory CopyWith$Query$GetActivities.stub(TRes res) =
      _CopyWithStubImpl$Query$GetActivities;

  TRes call({
    Query$GetActivities$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$GetActivities$Page<TRes> get Page;
}

class _CopyWithImpl$Query$GetActivities<TRes>
    implements CopyWith$Query$GetActivities<TRes> {
  _CopyWithImpl$Query$GetActivities(
    this._instance,
    this._then,
  );

  final Query$GetActivities _instance;

  final TRes Function(Query$GetActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetActivities(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$GetActivities$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetActivities$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$GetActivities$Page.stub(_then(_instance))
        : CopyWith$Query$GetActivities$Page(local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$GetActivities<TRes>
    implements CopyWith$Query$GetActivities<TRes> {
  _CopyWithStubImpl$Query$GetActivities(this._res);

  TRes _res;

  call({
    Query$GetActivities$Page? Page,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetActivities$Page<TRes> get Page =>
      CopyWith$Query$GetActivities$Page.stub(_res);
}

const documentNodeQueryGetActivities = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetActivities'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
                name: NameNode(value: 'total'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'perPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
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
            name: NameNode(value: 'activities'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'type_in'),
                value: ListValueNode(values: [
                  EnumValueNode(name: NameNode(value: 'ANIME_LIST'))
                ]),
              ),
              ArgumentNode(
                name: NameNode(value: 'sort'),
                value: EnumValueNode(name: NameNode(value: 'ID_DESC')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'ListActivity'),
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
                    name: NameNode(value: 'type'),
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
                    name: NameNode(value: 'progress'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'createdAt'),
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
Query$GetActivities _parserFn$Query$GetActivities(Map<String, dynamic> data) =>
    Query$GetActivities.fromJson(data);
typedef OnQueryComplete$Query$GetActivities = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetActivities?,
);

class Options$Query$GetActivities
    extends graphql.QueryOptions<Query$GetActivities> {
  Options$Query$GetActivities({
    String? operationName,
    Variables$Query$GetActivities? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetActivities? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetActivities? onComplete,
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
                    data == null ? null : _parserFn$Query$GetActivities(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetActivities,
          parserFn: _parserFn$Query$GetActivities,
        );

  final OnQueryComplete$Query$GetActivities? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetActivities
    extends graphql.WatchQueryOptions<Query$GetActivities> {
  WatchOptions$Query$GetActivities({
    String? operationName,
    Variables$Query$GetActivities? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetActivities? typedOptimisticResult,
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
          document: documentNodeQueryGetActivities,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetActivities,
        );
}

class FetchMoreOptions$Query$GetActivities extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetActivities({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetActivities? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetActivities,
        );
}

extension ClientExtension$Query$GetActivities on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetActivities>> query$GetActivities(
          [Options$Query$GetActivities? options]) async =>
      await this.query(options ?? Options$Query$GetActivities());
  graphql.ObservableQuery<Query$GetActivities> watchQuery$GetActivities(
          [WatchOptions$Query$GetActivities? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetActivities());
  void writeQuery$GetActivities({
    required Query$GetActivities data,
    Variables$Query$GetActivities? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetActivities),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetActivities? readQuery$GetActivities({
    Variables$Query$GetActivities? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetActivities),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetActivities.fromJson(result);
  }
}

class Query$GetActivities$Page {
  Query$GetActivities$Page({
    this.pageInfo,
    this.activities,
    this.$__typename = 'Page',
  });

  factory Query$GetActivities$Page.fromJson(Map<String, dynamic> json) {
    final l$pageInfo = json['pageInfo'];
    final l$activities = json['activities'];
    final l$$__typename = json['__typename'];
    return Query$GetActivities$Page(
      pageInfo: l$pageInfo == null
          ? null
          : Query$GetActivities$Page$pageInfo.fromJson(
              (l$pageInfo as Map<String, dynamic>)),
      activities: (l$activities as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetActivities$Page$activities.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetActivities$Page$pageInfo? pageInfo;

  final List<Query$GetActivities$Page$activities?>? activities;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo?.toJson();
    final l$activities = activities;
    _resultData['activities'] = l$activities?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$pageInfo = pageInfo;
    final l$activities = activities;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$pageInfo,
      l$activities == null ? null : Object.hashAll(l$activities.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$activities = activities;
    final lOther$activities = other.activities;
    if (l$activities != null && lOther$activities != null) {
      if (l$activities.length != lOther$activities.length) {
        return false;
      }
      for (int i = 0; i < l$activities.length; i++) {
        final l$activities$entry = l$activities[i];
        final lOther$activities$entry = lOther$activities[i];
        if (l$activities$entry != lOther$activities$entry) {
          return false;
        }
      }
    } else if (l$activities != lOther$activities) {
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

extension UtilityExtension$Query$GetActivities$Page
    on Query$GetActivities$Page {
  CopyWith$Query$GetActivities$Page<Query$GetActivities$Page> get copyWith =>
      CopyWith$Query$GetActivities$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetActivities$Page<TRes> {
  factory CopyWith$Query$GetActivities$Page(
    Query$GetActivities$Page instance,
    TRes Function(Query$GetActivities$Page) then,
  ) = _CopyWithImpl$Query$GetActivities$Page;

  factory CopyWith$Query$GetActivities$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page;

  TRes call({
    Query$GetActivities$Page$pageInfo? pageInfo,
    List<Query$GetActivities$Page$activities?>? activities,
    String? $__typename,
  });
  CopyWith$Query$GetActivities$Page$pageInfo<TRes> get pageInfo;
  TRes activities(
      Iterable<Query$GetActivities$Page$activities?>? Function(
              Iterable<
                  CopyWith$Query$GetActivities$Page$activities<
                      Query$GetActivities$Page$activities>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetActivities$Page<TRes>
    implements CopyWith$Query$GetActivities$Page<TRes> {
  _CopyWithImpl$Query$GetActivities$Page(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page _instance;

  final TRes Function(Query$GetActivities$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? pageInfo = _undefined,
    Object? activities = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetActivities$Page(
        pageInfo: pageInfo == _undefined
            ? _instance.pageInfo
            : (pageInfo as Query$GetActivities$Page$pageInfo?),
        activities: activities == _undefined
            ? _instance.activities
            : (activities as List<Query$GetActivities$Page$activities?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetActivities$Page$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return local$pageInfo == null
        ? CopyWith$Query$GetActivities$Page$pageInfo.stub(_then(_instance))
        : CopyWith$Query$GetActivities$Page$pageInfo(
            local$pageInfo, (e) => call(pageInfo: e));
  }

  TRes activities(
          Iterable<Query$GetActivities$Page$activities?>? Function(
                  Iterable<
                      CopyWith$Query$GetActivities$Page$activities<
                          Query$GetActivities$Page$activities>?>?)
              _fn) =>
      call(
          activities: _fn(_instance.activities?.map((e) => e == null
              ? null
              : CopyWith$Query$GetActivities$Page$activities(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetActivities$Page<TRes>
    implements CopyWith$Query$GetActivities$Page<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page(this._res);

  TRes _res;

  call({
    Query$GetActivities$Page$pageInfo? pageInfo,
    List<Query$GetActivities$Page$activities?>? activities,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetActivities$Page$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetActivities$Page$pageInfo.stub(_res);

  activities(_fn) => _res;
}

class Query$GetActivities$Page$pageInfo {
  Query$GetActivities$Page$pageInfo({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.hasNextPage,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetActivities$Page$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$total = json['total'];
    final l$perPage = json['perPage'];
    final l$currentPage = json['currentPage'];
    final l$lastPage = json['lastPage'];
    final l$hasNextPage = json['hasNextPage'];
    final l$$__typename = json['__typename'];
    return Query$GetActivities$Page$pageInfo(
      total: (l$total as int?),
      perPage: (l$perPage as int?),
      currentPage: (l$currentPage as int?),
      lastPage: (l$lastPage as int?),
      hasNextPage: (l$hasNextPage as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? total;

  final int? perPage;

  final int? currentPage;

  final int? lastPage;

  final bool? hasNextPage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$total = total;
    _resultData['total'] = l$total;
    final l$perPage = perPage;
    _resultData['perPage'] = l$perPage;
    final l$currentPage = currentPage;
    _resultData['currentPage'] = l$currentPage;
    final l$lastPage = lastPage;
    _resultData['lastPage'] = l$lastPage;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$total = total;
    final l$perPage = perPage;
    final l$currentPage = currentPage;
    final l$lastPage = lastPage;
    final l$hasNextPage = hasNextPage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$total,
      l$perPage,
      l$currentPage,
      l$lastPage,
      l$hasNextPage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page$pageInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$perPage = perPage;
    final lOther$perPage = other.perPage;
    if (l$perPage != lOther$perPage) {
      return false;
    }
    final l$currentPage = currentPage;
    final lOther$currentPage = other.currentPage;
    if (l$currentPage != lOther$currentPage) {
      return false;
    }
    final l$lastPage = lastPage;
    final lOther$lastPage = other.lastPage;
    if (l$lastPage != lOther$lastPage) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
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

extension UtilityExtension$Query$GetActivities$Page$pageInfo
    on Query$GetActivities$Page$pageInfo {
  CopyWith$Query$GetActivities$Page$pageInfo<Query$GetActivities$Page$pageInfo>
      get copyWith => CopyWith$Query$GetActivities$Page$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetActivities$Page$pageInfo<TRes> {
  factory CopyWith$Query$GetActivities$Page$pageInfo(
    Query$GetActivities$Page$pageInfo instance,
    TRes Function(Query$GetActivities$Page$pageInfo) then,
  ) = _CopyWithImpl$Query$GetActivities$Page$pageInfo;

  factory CopyWith$Query$GetActivities$Page$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page$pageInfo;

  TRes call({
    int? total,
    int? perPage,
    int? currentPage,
    int? lastPage,
    bool? hasNextPage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetActivities$Page$pageInfo<TRes>
    implements CopyWith$Query$GetActivities$Page$pageInfo<TRes> {
  _CopyWithImpl$Query$GetActivities$Page$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page$pageInfo _instance;

  final TRes Function(Query$GetActivities$Page$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? total = _undefined,
    Object? perPage = _undefined,
    Object? currentPage = _undefined,
    Object? lastPage = _undefined,
    Object? hasNextPage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetActivities$Page$pageInfo(
        total: total == _undefined ? _instance.total : (total as int?),
        perPage: perPage == _undefined ? _instance.perPage : (perPage as int?),
        currentPage: currentPage == _undefined
            ? _instance.currentPage
            : (currentPage as int?),
        lastPage:
            lastPage == _undefined ? _instance.lastPage : (lastPage as int?),
        hasNextPage: hasNextPage == _undefined
            ? _instance.hasNextPage
            : (hasNextPage as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetActivities$Page$pageInfo<TRes>
    implements CopyWith$Query$GetActivities$Page$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page$pageInfo(this._res);

  TRes _res;

  call({
    int? total,
    int? perPage,
    int? currentPage,
    int? lastPage,
    bool? hasNextPage,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetActivities$Page$activities {
  Query$GetActivities$Page$activities({required this.$__typename});

  factory Query$GetActivities$Page$activities.fromJson(
      Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "ListActivity":
        return Query$GetActivities$Page$activities$$ListActivity.fromJson(json);

      case "TextActivity":
        return Query$GetActivities$Page$activities$$TextActivity.fromJson(json);

      case "MessageActivity":
        return Query$GetActivities$Page$activities$$MessageActivity.fromJson(
            json);

      default:
        final l$$__typename = json['__typename'];
        return Query$GetActivities$Page$activities(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page$activities) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetActivities$Page$activities
    on Query$GetActivities$Page$activities {
  CopyWith$Query$GetActivities$Page$activities<
          Query$GetActivities$Page$activities>
      get copyWith => CopyWith$Query$GetActivities$Page$activities(
            this,
            (i) => i,
          );
  _T when<_T>({
    required _T Function(Query$GetActivities$Page$activities$$ListActivity)
        listActivity,
    required _T Function(Query$GetActivities$Page$activities$$TextActivity)
        textActivity,
    required _T Function(Query$GetActivities$Page$activities$$MessageActivity)
        messageActivity,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ListActivity":
        return listActivity(
            this as Query$GetActivities$Page$activities$$ListActivity);

      case "TextActivity":
        return textActivity(
            this as Query$GetActivities$Page$activities$$TextActivity);

      case "MessageActivity":
        return messageActivity(
            this as Query$GetActivities$Page$activities$$MessageActivity);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$GetActivities$Page$activities$$ListActivity)?
        listActivity,
    _T Function(Query$GetActivities$Page$activities$$TextActivity)?
        textActivity,
    _T Function(Query$GetActivities$Page$activities$$MessageActivity)?
        messageActivity,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "ListActivity":
        if (listActivity != null) {
          return listActivity(
              this as Query$GetActivities$Page$activities$$ListActivity);
        } else {
          return orElse();
        }

      case "TextActivity":
        if (textActivity != null) {
          return textActivity(
              this as Query$GetActivities$Page$activities$$TextActivity);
        } else {
          return orElse();
        }

      case "MessageActivity":
        if (messageActivity != null) {
          return messageActivity(
              this as Query$GetActivities$Page$activities$$MessageActivity);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$GetActivities$Page$activities<TRes> {
  factory CopyWith$Query$GetActivities$Page$activities(
    Query$GetActivities$Page$activities instance,
    TRes Function(Query$GetActivities$Page$activities) then,
  ) = _CopyWithImpl$Query$GetActivities$Page$activities;

  factory CopyWith$Query$GetActivities$Page$activities.stub(TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page$activities;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetActivities$Page$activities<TRes>
    implements CopyWith$Query$GetActivities$Page$activities<TRes> {
  _CopyWithImpl$Query$GetActivities$Page$activities(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page$activities _instance;

  final TRes Function(Query$GetActivities$Page$activities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetActivities$Page$activities(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetActivities$Page$activities<TRes>
    implements CopyWith$Query$GetActivities$Page$activities<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page$activities(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GetActivities$Page$activities$$ListActivity
    implements Query$GetActivities$Page$activities {
  Query$GetActivities$Page$activities$$ListActivity({
    required this.id,
    this.type,
    this.status,
    this.progress,
    required this.createdAt,
    this.media,
    this.$__typename = 'ListActivity',
  });

  factory Query$GetActivities$Page$activities$$ListActivity.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$progress = json['progress'];
    final l$createdAt = json['createdAt'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$GetActivities$Page$activities$$ListActivity(
      id: (l$id as int),
      type: l$type == null
          ? null
          : fromJson$Enum$ActivityType((l$type as String)),
      status: (l$status as String?),
      progress: (l$progress as String?),
      createdAt: (l$createdAt as int),
      media: l$media == null
          ? null
          : Fragment$shortMedia.fromJson((l$media as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Enum$ActivityType? type;

  final String? status;

  final String? progress;

  final int createdAt;

  final Fragment$shortMedia? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] =
        l$type == null ? null : toJson$Enum$ActivityType(l$type);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$media = media;
    _resultData['media'] = l$media?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$status = status;
    final l$progress = progress;
    final l$createdAt = createdAt;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$status,
      l$progress,
      l$createdAt,
      l$media,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page$activities$$ListActivity) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Query$GetActivities$Page$activities$$ListActivity
    on Query$GetActivities$Page$activities$$ListActivity {
  CopyWith$Query$GetActivities$Page$activities$$ListActivity<
          Query$GetActivities$Page$activities$$ListActivity>
      get copyWith =>
          CopyWith$Query$GetActivities$Page$activities$$ListActivity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetActivities$Page$activities$$ListActivity<
    TRes> {
  factory CopyWith$Query$GetActivities$Page$activities$$ListActivity(
    Query$GetActivities$Page$activities$$ListActivity instance,
    TRes Function(Query$GetActivities$Page$activities$$ListActivity) then,
  ) = _CopyWithImpl$Query$GetActivities$Page$activities$$ListActivity;

  factory CopyWith$Query$GetActivities$Page$activities$$ListActivity.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page$activities$$ListActivity;

  TRes call({
    int? id,
    Enum$ActivityType? type,
    String? status,
    String? progress,
    int? createdAt,
    Fragment$shortMedia? media,
    String? $__typename,
  });
  CopyWith$Fragment$shortMedia<TRes> get media;
}

class _CopyWithImpl$Query$GetActivities$Page$activities$$ListActivity<TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$ListActivity<TRes> {
  _CopyWithImpl$Query$GetActivities$Page$activities$$ListActivity(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page$activities$$ListActivity _instance;

  final TRes Function(Query$GetActivities$Page$activities$$ListActivity) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? status = _undefined,
    Object? progress = _undefined,
    Object? createdAt = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetActivities$Page$activities$$ListActivity(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        type:
            type == _undefined ? _instance.type : (type as Enum$ActivityType?),
        status: status == _undefined ? _instance.status : (status as String?),
        progress:
            progress == _undefined ? _instance.progress : (progress as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as int),
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

class _CopyWithStubImpl$Query$GetActivities$Page$activities$$ListActivity<TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$ListActivity<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page$activities$$ListActivity(
      this._res);

  TRes _res;

  call({
    int? id,
    Enum$ActivityType? type,
    String? status,
    String? progress,
    int? createdAt,
    Fragment$shortMedia? media,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Fragment$shortMedia<TRes> get media =>
      CopyWith$Fragment$shortMedia.stub(_res);
}

class Query$GetActivities$Page$activities$$TextActivity
    implements Query$GetActivities$Page$activities {
  Query$GetActivities$Page$activities$$TextActivity(
      {this.$__typename = 'TextActivity'});

  factory Query$GetActivities$Page$activities$$TextActivity.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$GetActivities$Page$activities$$TextActivity(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page$activities$$TextActivity) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetActivities$Page$activities$$TextActivity
    on Query$GetActivities$Page$activities$$TextActivity {
  CopyWith$Query$GetActivities$Page$activities$$TextActivity<
          Query$GetActivities$Page$activities$$TextActivity>
      get copyWith =>
          CopyWith$Query$GetActivities$Page$activities$$TextActivity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetActivities$Page$activities$$TextActivity<
    TRes> {
  factory CopyWith$Query$GetActivities$Page$activities$$TextActivity(
    Query$GetActivities$Page$activities$$TextActivity instance,
    TRes Function(Query$GetActivities$Page$activities$$TextActivity) then,
  ) = _CopyWithImpl$Query$GetActivities$Page$activities$$TextActivity;

  factory CopyWith$Query$GetActivities$Page$activities$$TextActivity.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page$activities$$TextActivity;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetActivities$Page$activities$$TextActivity<TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$TextActivity<TRes> {
  _CopyWithImpl$Query$GetActivities$Page$activities$$TextActivity(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page$activities$$TextActivity _instance;

  final TRes Function(Query$GetActivities$Page$activities$$TextActivity) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetActivities$Page$activities$$TextActivity(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetActivities$Page$activities$$TextActivity<TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$TextActivity<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page$activities$$TextActivity(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GetActivities$Page$activities$$MessageActivity
    implements Query$GetActivities$Page$activities {
  Query$GetActivities$Page$activities$$MessageActivity(
      {this.$__typename = 'MessageActivity'});

  factory Query$GetActivities$Page$activities$$MessageActivity.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Query$GetActivities$Page$activities$$MessageActivity(
        $__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetActivities$Page$activities$$MessageActivity) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetActivities$Page$activities$$MessageActivity
    on Query$GetActivities$Page$activities$$MessageActivity {
  CopyWith$Query$GetActivities$Page$activities$$MessageActivity<
          Query$GetActivities$Page$activities$$MessageActivity>
      get copyWith =>
          CopyWith$Query$GetActivities$Page$activities$$MessageActivity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetActivities$Page$activities$$MessageActivity<
    TRes> {
  factory CopyWith$Query$GetActivities$Page$activities$$MessageActivity(
    Query$GetActivities$Page$activities$$MessageActivity instance,
    TRes Function(Query$GetActivities$Page$activities$$MessageActivity) then,
  ) = _CopyWithImpl$Query$GetActivities$Page$activities$$MessageActivity;

  factory CopyWith$Query$GetActivities$Page$activities$$MessageActivity.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetActivities$Page$activities$$MessageActivity;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GetActivities$Page$activities$$MessageActivity<TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$MessageActivity<TRes> {
  _CopyWithImpl$Query$GetActivities$Page$activities$$MessageActivity(
    this._instance,
    this._then,
  );

  final Query$GetActivities$Page$activities$$MessageActivity _instance;

  final TRes Function(Query$GetActivities$Page$activities$$MessageActivity)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Query$GetActivities$Page$activities$$MessageActivity(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$GetActivities$Page$activities$$MessageActivity<
        TRes>
    implements
        CopyWith$Query$GetActivities$Page$activities$$MessageActivity<TRes> {
  _CopyWithStubImpl$Query$GetActivities$Page$activities$$MessageActivity(
      this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
