import 'dart:async';
import 'media.fragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.graphql.dart';

class Variables$Query$GetLists {
  factory Variables$Query$GetLists({String? username}) =>
      Variables$Query$GetLists._({
        if (username != null) r'username': username,
      });

  Variables$Query$GetLists._(this._$data);

  factory Variables$Query$GetLists.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('username')) {
      final l$username = data['username'];
      result$data['username'] = (l$username as String?);
    }
    return Variables$Query$GetLists._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get username => (_$data['username'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('username')) {
      final l$username = username;
      result$data['username'] = l$username;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetLists<Variables$Query$GetLists> get copyWith =>
      CopyWith$Variables$Query$GetLists(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetLists) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (_$data.containsKey('username') !=
        other._$data.containsKey('username')) {
      return false;
    }
    if (l$username != lOther$username) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$username = username;
    return Object.hashAll(
        [_$data.containsKey('username') ? l$username : const {}]);
  }
}

abstract class CopyWith$Variables$Query$GetLists<TRes> {
  factory CopyWith$Variables$Query$GetLists(
    Variables$Query$GetLists instance,
    TRes Function(Variables$Query$GetLists) then,
  ) = _CopyWithImpl$Variables$Query$GetLists;

  factory CopyWith$Variables$Query$GetLists.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetLists;

  TRes call({String? username});
}

class _CopyWithImpl$Variables$Query$GetLists<TRes>
    implements CopyWith$Variables$Query$GetLists<TRes> {
  _CopyWithImpl$Variables$Query$GetLists(
    this._instance,
    this._then,
  );

  final Variables$Query$GetLists _instance;

  final TRes Function(Variables$Query$GetLists) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? username = _undefined}) =>
      _then(Variables$Query$GetLists._({
        ..._instance._$data,
        if (username != _undefined) 'username': (username as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetLists<TRes>
    implements CopyWith$Variables$Query$GetLists<TRes> {
  _CopyWithStubImpl$Variables$Query$GetLists(this._res);

  TRes _res;

  call({String? username}) => _res;
}

class Query$GetLists {
  Query$GetLists({
    this.MediaListCollection,
    this.$__typename = 'Query',
  });

  factory Query$GetLists.fromJson(Map<String, dynamic> json) {
    final l$MediaListCollection = json['MediaListCollection'];
    final l$$__typename = json['__typename'];
    return Query$GetLists(
      MediaListCollection: l$MediaListCollection == null
          ? null
          : Query$GetLists$MediaListCollection.fromJson(
              (l$MediaListCollection as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetLists$MediaListCollection? MediaListCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$MediaListCollection = MediaListCollection;
    _resultData['MediaListCollection'] = l$MediaListCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$MediaListCollection = MediaListCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$MediaListCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetLists) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$MediaListCollection = MediaListCollection;
    final lOther$MediaListCollection = other.MediaListCollection;
    if (l$MediaListCollection != lOther$MediaListCollection) {
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

extension UtilityExtension$Query$GetLists on Query$GetLists {
  CopyWith$Query$GetLists<Query$GetLists> get copyWith =>
      CopyWith$Query$GetLists(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetLists<TRes> {
  factory CopyWith$Query$GetLists(
    Query$GetLists instance,
    TRes Function(Query$GetLists) then,
  ) = _CopyWithImpl$Query$GetLists;

  factory CopyWith$Query$GetLists.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLists;

  TRes call({
    Query$GetLists$MediaListCollection? MediaListCollection,
    String? $__typename,
  });
  CopyWith$Query$GetLists$MediaListCollection<TRes> get MediaListCollection;
}

class _CopyWithImpl$Query$GetLists<TRes>
    implements CopyWith$Query$GetLists<TRes> {
  _CopyWithImpl$Query$GetLists(
    this._instance,
    this._then,
  );

  final Query$GetLists _instance;

  final TRes Function(Query$GetLists) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? MediaListCollection = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists(
        MediaListCollection: MediaListCollection == _undefined
            ? _instance.MediaListCollection
            : (MediaListCollection as Query$GetLists$MediaListCollection?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetLists$MediaListCollection<TRes> get MediaListCollection {
    final local$MediaListCollection = _instance.MediaListCollection;
    return local$MediaListCollection == null
        ? CopyWith$Query$GetLists$MediaListCollection.stub(_then(_instance))
        : CopyWith$Query$GetLists$MediaListCollection(
            local$MediaListCollection, (e) => call(MediaListCollection: e));
  }
}

class _CopyWithStubImpl$Query$GetLists<TRes>
    implements CopyWith$Query$GetLists<TRes> {
  _CopyWithStubImpl$Query$GetLists(this._res);

  TRes _res;

  call({
    Query$GetLists$MediaListCollection? MediaListCollection,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetLists$MediaListCollection<TRes> get MediaListCollection =>
      CopyWith$Query$GetLists$MediaListCollection.stub(_res);
}

const documentNodeQueryGetLists = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetLists'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
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
        name: NameNode(value: 'MediaListCollection'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userName'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'type'),
            value: EnumValueNode(name: NameNode(value: 'ANIME')),
          ),
          ArgumentNode(
            name: NameNode(value: 'sort'),
            value: EnumValueNode(name: NameNode(value: 'UPDATED_TIME_DESC')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'lists'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'entries'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'score'),
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
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'notes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'repeat'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'private'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'updatedAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'startedAt'),
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
                    name: NameNode(value: 'completedAt'),
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
Query$GetLists _parserFn$Query$GetLists(Map<String, dynamic> data) =>
    Query$GetLists.fromJson(data);
typedef OnQueryComplete$Query$GetLists = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetLists?,
);

class Options$Query$GetLists extends graphql.QueryOptions<Query$GetLists> {
  Options$Query$GetLists({
    String? operationName,
    Variables$Query$GetLists? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetLists? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetLists? onComplete,
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
                    data == null ? null : _parserFn$Query$GetLists(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetLists,
          parserFn: _parserFn$Query$GetLists,
        );

  final OnQueryComplete$Query$GetLists? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetLists
    extends graphql.WatchQueryOptions<Query$GetLists> {
  WatchOptions$Query$GetLists({
    String? operationName,
    Variables$Query$GetLists? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetLists? typedOptimisticResult,
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
          document: documentNodeQueryGetLists,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetLists,
        );
}

class FetchMoreOptions$Query$GetLists extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetLists({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetLists? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetLists,
        );
}

extension ClientExtension$Query$GetLists on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetLists>> query$GetLists(
          [Options$Query$GetLists? options]) async =>
      await this.query(options ?? Options$Query$GetLists());
  graphql.ObservableQuery<Query$GetLists> watchQuery$GetLists(
          [WatchOptions$Query$GetLists? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetLists());
  void writeQuery$GetLists({
    required Query$GetLists data,
    Variables$Query$GetLists? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetLists),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetLists? readQuery$GetLists({
    Variables$Query$GetLists? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetLists),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetLists.fromJson(result);
  }
}

class Query$GetLists$MediaListCollection {
  Query$GetLists$MediaListCollection({
    this.lists,
    this.$__typename = 'MediaListCollection',
  });

  factory Query$GetLists$MediaListCollection.fromJson(
      Map<String, dynamic> json) {
    final l$lists = json['lists'];
    final l$$__typename = json['__typename'];
    return Query$GetLists$MediaListCollection(
      lists: (l$lists as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetLists$MediaListCollection$lists.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetLists$MediaListCollection$lists?>? lists;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$lists = lists;
    _resultData['lists'] = l$lists?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$lists = lists;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$lists == null ? null : Object.hashAll(l$lists.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetLists$MediaListCollection) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lists = lists;
    final lOther$lists = other.lists;
    if (l$lists != null && lOther$lists != null) {
      if (l$lists.length != lOther$lists.length) {
        return false;
      }
      for (int i = 0; i < l$lists.length; i++) {
        final l$lists$entry = l$lists[i];
        final lOther$lists$entry = lOther$lists[i];
        if (l$lists$entry != lOther$lists$entry) {
          return false;
        }
      }
    } else if (l$lists != lOther$lists) {
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

extension UtilityExtension$Query$GetLists$MediaListCollection
    on Query$GetLists$MediaListCollection {
  CopyWith$Query$GetLists$MediaListCollection<
          Query$GetLists$MediaListCollection>
      get copyWith => CopyWith$Query$GetLists$MediaListCollection(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLists$MediaListCollection<TRes> {
  factory CopyWith$Query$GetLists$MediaListCollection(
    Query$GetLists$MediaListCollection instance,
    TRes Function(Query$GetLists$MediaListCollection) then,
  ) = _CopyWithImpl$Query$GetLists$MediaListCollection;

  factory CopyWith$Query$GetLists$MediaListCollection.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLists$MediaListCollection;

  TRes call({
    List<Query$GetLists$MediaListCollection$lists?>? lists,
    String? $__typename,
  });
  TRes lists(
      Iterable<Query$GetLists$MediaListCollection$lists?>? Function(
              Iterable<
                  CopyWith$Query$GetLists$MediaListCollection$lists<
                      Query$GetLists$MediaListCollection$lists>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetLists$MediaListCollection<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection<TRes> {
  _CopyWithImpl$Query$GetLists$MediaListCollection(
    this._instance,
    this._then,
  );

  final Query$GetLists$MediaListCollection _instance;

  final TRes Function(Query$GetLists$MediaListCollection) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? lists = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists$MediaListCollection(
        lists: lists == _undefined
            ? _instance.lists
            : (lists as List<Query$GetLists$MediaListCollection$lists?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes lists(
          Iterable<Query$GetLists$MediaListCollection$lists?>? Function(
                  Iterable<
                      CopyWith$Query$GetLists$MediaListCollection$lists<
                          Query$GetLists$MediaListCollection$lists>?>?)
              _fn) =>
      call(
          lists: _fn(_instance.lists?.map((e) => e == null
              ? null
              : CopyWith$Query$GetLists$MediaListCollection$lists(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetLists$MediaListCollection<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection<TRes> {
  _CopyWithStubImpl$Query$GetLists$MediaListCollection(this._res);

  TRes _res;

  call({
    List<Query$GetLists$MediaListCollection$lists?>? lists,
    String? $__typename,
  }) =>
      _res;

  lists(_fn) => _res;
}

class Query$GetLists$MediaListCollection$lists {
  Query$GetLists$MediaListCollection$lists({
    this.entries,
    this.$__typename = 'MediaListGroup',
  });

  factory Query$GetLists$MediaListCollection$lists.fromJson(
      Map<String, dynamic> json) {
    final l$entries = json['entries'];
    final l$$__typename = json['__typename'];
    return Query$GetLists$MediaListCollection$lists(
      entries: (l$entries as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetLists$MediaListCollection$lists$entries.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetLists$MediaListCollection$lists$entries?>? entries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$entries = entries;
    _resultData['entries'] = l$entries?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$entries = entries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$entries == null ? null : Object.hashAll(l$entries.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetLists$MediaListCollection$lists) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$entries = entries;
    final lOther$entries = other.entries;
    if (l$entries != null && lOther$entries != null) {
      if (l$entries.length != lOther$entries.length) {
        return false;
      }
      for (int i = 0; i < l$entries.length; i++) {
        final l$entries$entry = l$entries[i];
        final lOther$entries$entry = lOther$entries[i];
        if (l$entries$entry != lOther$entries$entry) {
          return false;
        }
      }
    } else if (l$entries != lOther$entries) {
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

extension UtilityExtension$Query$GetLists$MediaListCollection$lists
    on Query$GetLists$MediaListCollection$lists {
  CopyWith$Query$GetLists$MediaListCollection$lists<
          Query$GetLists$MediaListCollection$lists>
      get copyWith => CopyWith$Query$GetLists$MediaListCollection$lists(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLists$MediaListCollection$lists<TRes> {
  factory CopyWith$Query$GetLists$MediaListCollection$lists(
    Query$GetLists$MediaListCollection$lists instance,
    TRes Function(Query$GetLists$MediaListCollection$lists) then,
  ) = _CopyWithImpl$Query$GetLists$MediaListCollection$lists;

  factory CopyWith$Query$GetLists$MediaListCollection$lists.stub(TRes res) =
      _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists;

  TRes call({
    List<Query$GetLists$MediaListCollection$lists$entries?>? entries,
    String? $__typename,
  });
  TRes entries(
      Iterable<Query$GetLists$MediaListCollection$lists$entries?>? Function(
              Iterable<
                  CopyWith$Query$GetLists$MediaListCollection$lists$entries<
                      Query$GetLists$MediaListCollection$lists$entries>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetLists$MediaListCollection$lists<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection$lists<TRes> {
  _CopyWithImpl$Query$GetLists$MediaListCollection$lists(
    this._instance,
    this._then,
  );

  final Query$GetLists$MediaListCollection$lists _instance;

  final TRes Function(Query$GetLists$MediaListCollection$lists) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? entries = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists$MediaListCollection$lists(
        entries: entries == _undefined
            ? _instance.entries
            : (entries
                as List<Query$GetLists$MediaListCollection$lists$entries?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes entries(
          Iterable<Query$GetLists$MediaListCollection$lists$entries?>? Function(
                  Iterable<
                      CopyWith$Query$GetLists$MediaListCollection$lists$entries<
                          Query$GetLists$MediaListCollection$lists$entries>?>?)
              _fn) =>
      call(
          entries: _fn(_instance.entries?.map((e) => e == null
              ? null
              : CopyWith$Query$GetLists$MediaListCollection$lists$entries(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection$lists<TRes> {
  _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists(this._res);

  TRes _res;

  call({
    List<Query$GetLists$MediaListCollection$lists$entries?>? entries,
    String? $__typename,
  }) =>
      _res;

  entries(_fn) => _res;
}

class Query$GetLists$MediaListCollection$lists$entries {
  Query$GetLists$MediaListCollection$lists$entries({
    this.score,
    this.progress,
    this.status,
    this.notes,
    this.repeat,
    this.private,
    this.updatedAt,
    this.startedAt,
    this.completedAt,
    this.media,
    this.$__typename = 'MediaList',
  });

  factory Query$GetLists$MediaListCollection$lists$entries.fromJson(
      Map<String, dynamic> json) {
    final l$score = json['score'];
    final l$progress = json['progress'];
    final l$status = json['status'];
    final l$notes = json['notes'];
    final l$repeat = json['repeat'];
    final l$private = json['private'];
    final l$updatedAt = json['updatedAt'];
    final l$startedAt = json['startedAt'];
    final l$completedAt = json['completedAt'];
    final l$media = json['media'];
    final l$$__typename = json['__typename'];
    return Query$GetLists$MediaListCollection$lists$entries(
      score: (l$score as num?)?.toDouble(),
      progress: (l$progress as int?),
      status: l$status == null
          ? null
          : fromJson$Enum$MediaListStatus((l$status as String)),
      notes: (l$notes as String?),
      repeat: (l$repeat as int?),
      private: (l$private as bool?),
      updatedAt: (l$updatedAt as int?),
      startedAt: l$startedAt == null
          ? null
          : Query$GetLists$MediaListCollection$lists$entries$startedAt.fromJson(
              (l$startedAt as Map<String, dynamic>)),
      completedAt: l$completedAt == null
          ? null
          : Query$GetLists$MediaListCollection$lists$entries$completedAt
              .fromJson((l$completedAt as Map<String, dynamic>)),
      media: l$media == null
          ? null
          : Fragment$shortMedia.fromJson((l$media as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final double? score;

  final int? progress;

  final Enum$MediaListStatus? status;

  final String? notes;

  final int? repeat;

  final bool? private;

  final int? updatedAt;

  final Query$GetLists$MediaListCollection$lists$entries$startedAt? startedAt;

  final Query$GetLists$MediaListCollection$lists$entries$completedAt?
      completedAt;

  final Fragment$shortMedia? media;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$score = score;
    _resultData['score'] = l$score;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$status = status;
    _resultData['status'] =
        l$status == null ? null : toJson$Enum$MediaListStatus(l$status);
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$repeat = repeat;
    _resultData['repeat'] = l$repeat;
    final l$private = private;
    _resultData['private'] = l$private;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$startedAt = startedAt;
    _resultData['startedAt'] = l$startedAt?.toJson();
    final l$completedAt = completedAt;
    _resultData['completedAt'] = l$completedAt?.toJson();
    final l$media = media;
    _resultData['media'] = l$media?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$score = score;
    final l$progress = progress;
    final l$status = status;
    final l$notes = notes;
    final l$repeat = repeat;
    final l$private = private;
    final l$updatedAt = updatedAt;
    final l$startedAt = startedAt;
    final l$completedAt = completedAt;
    final l$media = media;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$score,
      l$progress,
      l$status,
      l$notes,
      l$repeat,
      l$private,
      l$updatedAt,
      l$startedAt,
      l$completedAt,
      l$media,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetLists$MediaListCollection$lists$entries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$score = score;
    final lOther$score = other.score;
    if (l$score != lOther$score) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$repeat = repeat;
    final lOther$repeat = other.repeat;
    if (l$repeat != lOther$repeat) {
      return false;
    }
    final l$private = private;
    final lOther$private = other.private;
    if (l$private != lOther$private) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$startedAt = startedAt;
    final lOther$startedAt = other.startedAt;
    if (l$startedAt != lOther$startedAt) {
      return false;
    }
    final l$completedAt = completedAt;
    final lOther$completedAt = other.completedAt;
    if (l$completedAt != lOther$completedAt) {
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

extension UtilityExtension$Query$GetLists$MediaListCollection$lists$entries
    on Query$GetLists$MediaListCollection$lists$entries {
  CopyWith$Query$GetLists$MediaListCollection$lists$entries<
          Query$GetLists$MediaListCollection$lists$entries>
      get copyWith => CopyWith$Query$GetLists$MediaListCollection$lists$entries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLists$MediaListCollection$lists$entries<TRes> {
  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries(
    Query$GetLists$MediaListCollection$lists$entries instance,
    TRes Function(Query$GetLists$MediaListCollection$lists$entries) then,
  ) = _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries;

  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries;

  TRes call({
    double? score,
    int? progress,
    Enum$MediaListStatus? status,
    String? notes,
    int? repeat,
    bool? private,
    int? updatedAt,
    Query$GetLists$MediaListCollection$lists$entries$startedAt? startedAt,
    Query$GetLists$MediaListCollection$lists$entries$completedAt? completedAt,
    Fragment$shortMedia? media,
    String? $__typename,
  });
  CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<TRes>
      get startedAt;
  CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<TRes>
      get completedAt;
  CopyWith$Fragment$shortMedia<TRes> get media;
}

class _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection$lists$entries<TRes> {
  _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries(
    this._instance,
    this._then,
  );

  final Query$GetLists$MediaListCollection$lists$entries _instance;

  final TRes Function(Query$GetLists$MediaListCollection$lists$entries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? score = _undefined,
    Object? progress = _undefined,
    Object? status = _undefined,
    Object? notes = _undefined,
    Object? repeat = _undefined,
    Object? private = _undefined,
    Object? updatedAt = _undefined,
    Object? startedAt = _undefined,
    Object? completedAt = _undefined,
    Object? media = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists$MediaListCollection$lists$entries(
        score: score == _undefined ? _instance.score : (score as double?),
        progress:
            progress == _undefined ? _instance.progress : (progress as int?),
        status: status == _undefined
            ? _instance.status
            : (status as Enum$MediaListStatus?),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        repeat: repeat == _undefined ? _instance.repeat : (repeat as int?),
        private: private == _undefined ? _instance.private : (private as bool?),
        updatedAt:
            updatedAt == _undefined ? _instance.updatedAt : (updatedAt as int?),
        startedAt: startedAt == _undefined
            ? _instance.startedAt
            : (startedAt
                as Query$GetLists$MediaListCollection$lists$entries$startedAt?),
        completedAt: completedAt == _undefined
            ? _instance.completedAt
            : (completedAt
                as Query$GetLists$MediaListCollection$lists$entries$completedAt?),
        media: media == _undefined
            ? _instance.media
            : (media as Fragment$shortMedia?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<TRes>
      get startedAt {
    final local$startedAt = _instance.startedAt;
    return local$startedAt == null
        ? CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt
            .stub(_then(_instance))
        : CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt(
            local$startedAt, (e) => call(startedAt: e));
  }

  CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<TRes>
      get completedAt {
    final local$completedAt = _instance.completedAt;
    return local$completedAt == null
        ? CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt
            .stub(_then(_instance))
        : CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt(
            local$completedAt, (e) => call(completedAt: e));
  }

  CopyWith$Fragment$shortMedia<TRes> get media {
    final local$media = _instance.media;
    return local$media == null
        ? CopyWith$Fragment$shortMedia.stub(_then(_instance))
        : CopyWith$Fragment$shortMedia(local$media, (e) => call(media: e));
  }
}

class _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries<TRes>
    implements CopyWith$Query$GetLists$MediaListCollection$lists$entries<TRes> {
  _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries(this._res);

  TRes _res;

  call({
    double? score,
    int? progress,
    Enum$MediaListStatus? status,
    String? notes,
    int? repeat,
    bool? private,
    int? updatedAt,
    Query$GetLists$MediaListCollection$lists$entries$startedAt? startedAt,
    Query$GetLists$MediaListCollection$lists$entries$completedAt? completedAt,
    Fragment$shortMedia? media,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<TRes>
      get startedAt =>
          CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt
              .stub(_res);

  CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<TRes>
      get completedAt =>
          CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt
              .stub(_res);

  CopyWith$Fragment$shortMedia<TRes> get media =>
      CopyWith$Fragment$shortMedia.stub(_res);
}

class Query$GetLists$MediaListCollection$lists$entries$startedAt {
  Query$GetLists$MediaListCollection$lists$entries$startedAt({
    this.year,
    this.month,
    this.day,
    this.$__typename = 'FuzzyDate',
  });

  factory Query$GetLists$MediaListCollection$lists$entries$startedAt.fromJson(
      Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Query$GetLists$MediaListCollection$lists$entries$startedAt(
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
    if (!(other
            is Query$GetLists$MediaListCollection$lists$entries$startedAt) ||
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

extension UtilityExtension$Query$GetLists$MediaListCollection$lists$entries$startedAt
    on Query$GetLists$MediaListCollection$lists$entries$startedAt {
  CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<
          Query$GetLists$MediaListCollection$lists$entries$startedAt>
      get copyWith =>
          CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<
    TRes> {
  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt(
    Query$GetLists$MediaListCollection$lists$entries$startedAt instance,
    TRes Function(Query$GetLists$MediaListCollection$lists$entries$startedAt)
        then,
  ) = _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt;

  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt;

  TRes call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt<
        TRes>
    implements
        CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<
            TRes> {
  _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt(
    this._instance,
    this._then,
  );

  final Query$GetLists$MediaListCollection$lists$entries$startedAt _instance;

  final TRes Function(
      Query$GetLists$MediaListCollection$lists$entries$startedAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists$MediaListCollection$lists$entries$startedAt(
        year: year == _undefined ? _instance.year : (year as int?),
        month: month == _undefined ? _instance.month : (month as int?),
        day: day == _undefined ? _instance.day : (day as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt<
        TRes>
    implements
        CopyWith$Query$GetLists$MediaListCollection$lists$entries$startedAt<
            TRes> {
  _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$startedAt(
      this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetLists$MediaListCollection$lists$entries$completedAt {
  Query$GetLists$MediaListCollection$lists$entries$completedAt({
    this.year,
    this.month,
    this.day,
    this.$__typename = 'FuzzyDate',
  });

  factory Query$GetLists$MediaListCollection$lists$entries$completedAt.fromJson(
      Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$$__typename = json['__typename'];
    return Query$GetLists$MediaListCollection$lists$entries$completedAt(
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
    if (!(other
            is Query$GetLists$MediaListCollection$lists$entries$completedAt) ||
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

extension UtilityExtension$Query$GetLists$MediaListCollection$lists$entries$completedAt
    on Query$GetLists$MediaListCollection$lists$entries$completedAt {
  CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<
          Query$GetLists$MediaListCollection$lists$entries$completedAt>
      get copyWith =>
          CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<
    TRes> {
  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt(
    Query$GetLists$MediaListCollection$lists$entries$completedAt instance,
    TRes Function(Query$GetLists$MediaListCollection$lists$entries$completedAt)
        then,
  ) = _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt;

  factory CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt;

  TRes call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt<
        TRes>
    implements
        CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<
            TRes> {
  _CopyWithImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt(
    this._instance,
    this._then,
  );

  final Query$GetLists$MediaListCollection$lists$entries$completedAt _instance;

  final TRes Function(
      Query$GetLists$MediaListCollection$lists$entries$completedAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? year = _undefined,
    Object? month = _undefined,
    Object? day = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetLists$MediaListCollection$lists$entries$completedAt(
        year: year == _undefined ? _instance.year : (year as int?),
        month: month == _undefined ? _instance.month : (month as int?),
        day: day == _undefined ? _instance.day : (day as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt<
        TRes>
    implements
        CopyWith$Query$GetLists$MediaListCollection$lists$entries$completedAt<
            TRes> {
  _CopyWithStubImpl$Query$GetLists$MediaListCollection$lists$entries$completedAt(
      this._res);

  TRes _res;

  call({
    int? year,
    int? month,
    int? day,
    String? $__typename,
  }) =>
      _res;
}
