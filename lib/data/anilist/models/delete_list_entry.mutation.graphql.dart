import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$DeleteEntry {
  factory Variables$Mutation$DeleteEntry({int? mediaId}) =>
      Variables$Mutation$DeleteEntry._({
        if (mediaId != null) r'mediaId': mediaId,
      });

  Variables$Mutation$DeleteEntry._(this._$data);

  factory Variables$Mutation$DeleteEntry.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('mediaId')) {
      final l$mediaId = data['mediaId'];
      result$data['mediaId'] = (l$mediaId as int?);
    }
    return Variables$Mutation$DeleteEntry._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get mediaId => (_$data['mediaId'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('mediaId')) {
      final l$mediaId = mediaId;
      result$data['mediaId'] = l$mediaId;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteEntry<Variables$Mutation$DeleteEntry>
      get copyWith => CopyWith$Variables$Mutation$DeleteEntry(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteEntry) ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$mediaId = mediaId;
    return Object.hashAll(
        [_$data.containsKey('mediaId') ? l$mediaId : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteEntry<TRes> {
  factory CopyWith$Variables$Mutation$DeleteEntry(
    Variables$Mutation$DeleteEntry instance,
    TRes Function(Variables$Mutation$DeleteEntry) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteEntry;

  factory CopyWith$Variables$Mutation$DeleteEntry.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteEntry;

  TRes call({int? mediaId});
}

class _CopyWithImpl$Variables$Mutation$DeleteEntry<TRes>
    implements CopyWith$Variables$Mutation$DeleteEntry<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteEntry(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteEntry _instance;

  final TRes Function(Variables$Mutation$DeleteEntry) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? mediaId = _undefined}) =>
      _then(Variables$Mutation$DeleteEntry._({
        ..._instance._$data,
        if (mediaId != _undefined) 'mediaId': (mediaId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteEntry<TRes>
    implements CopyWith$Variables$Mutation$DeleteEntry<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteEntry(this._res);

  TRes _res;

  call({int? mediaId}) => _res;
}

class Mutation$DeleteEntry {
  Mutation$DeleteEntry({
    this.DeleteMediaListEntry,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteEntry.fromJson(Map<String, dynamic> json) {
    final l$DeleteMediaListEntry = json['DeleteMediaListEntry'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteEntry(
      DeleteMediaListEntry: l$DeleteMediaListEntry == null
          ? null
          : Mutation$DeleteEntry$DeleteMediaListEntry.fromJson(
              (l$DeleteMediaListEntry as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteEntry$DeleteMediaListEntry? DeleteMediaListEntry;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$DeleteMediaListEntry = DeleteMediaListEntry;
    _resultData['DeleteMediaListEntry'] = l$DeleteMediaListEntry?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$DeleteMediaListEntry = DeleteMediaListEntry;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$DeleteMediaListEntry,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteEntry) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$DeleteMediaListEntry = DeleteMediaListEntry;
    final lOther$DeleteMediaListEntry = other.DeleteMediaListEntry;
    if (l$DeleteMediaListEntry != lOther$DeleteMediaListEntry) {
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

extension UtilityExtension$Mutation$DeleteEntry on Mutation$DeleteEntry {
  CopyWith$Mutation$DeleteEntry<Mutation$DeleteEntry> get copyWith =>
      CopyWith$Mutation$DeleteEntry(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteEntry<TRes> {
  factory CopyWith$Mutation$DeleteEntry(
    Mutation$DeleteEntry instance,
    TRes Function(Mutation$DeleteEntry) then,
  ) = _CopyWithImpl$Mutation$DeleteEntry;

  factory CopyWith$Mutation$DeleteEntry.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteEntry;

  TRes call({
    Mutation$DeleteEntry$DeleteMediaListEntry? DeleteMediaListEntry,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes>
      get DeleteMediaListEntry;
}

class _CopyWithImpl$Mutation$DeleteEntry<TRes>
    implements CopyWith$Mutation$DeleteEntry<TRes> {
  _CopyWithImpl$Mutation$DeleteEntry(
    this._instance,
    this._then,
  );

  final Mutation$DeleteEntry _instance;

  final TRes Function(Mutation$DeleteEntry) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? DeleteMediaListEntry = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteEntry(
        DeleteMediaListEntry: DeleteMediaListEntry == _undefined
            ? _instance.DeleteMediaListEntry
            : (DeleteMediaListEntry
                as Mutation$DeleteEntry$DeleteMediaListEntry?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes>
      get DeleteMediaListEntry {
    final local$DeleteMediaListEntry = _instance.DeleteMediaListEntry;
    return local$DeleteMediaListEntry == null
        ? CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry(
            local$DeleteMediaListEntry, (e) => call(DeleteMediaListEntry: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteEntry<TRes>
    implements CopyWith$Mutation$DeleteEntry<TRes> {
  _CopyWithStubImpl$Mutation$DeleteEntry(this._res);

  TRes _res;

  call({
    Mutation$DeleteEntry$DeleteMediaListEntry? DeleteMediaListEntry,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes>
      get DeleteMediaListEntry =>
          CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry.stub(_res);
}

const documentNodeMutationDeleteEntry = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteEntry'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
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
        name: NameNode(value: 'DeleteMediaListEntry'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
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
]);
Mutation$DeleteEntry _parserFn$Mutation$DeleteEntry(
        Map<String, dynamic> data) =>
    Mutation$DeleteEntry.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteEntry = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteEntry?,
);

class Options$Mutation$DeleteEntry
    extends graphql.MutationOptions<Mutation$DeleteEntry> {
  Options$Mutation$DeleteEntry({
    String? operationName,
    Variables$Mutation$DeleteEntry? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteEntry? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteEntry? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteEntry>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$DeleteEntry(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteEntry,
          parserFn: _parserFn$Mutation$DeleteEntry,
        );

  final OnMutationCompleted$Mutation$DeleteEntry? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteEntry
    extends graphql.WatchQueryOptions<Mutation$DeleteEntry> {
  WatchOptions$Mutation$DeleteEntry({
    String? operationName,
    Variables$Mutation$DeleteEntry? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteEntry? typedOptimisticResult,
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
          document: documentNodeMutationDeleteEntry,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteEntry,
        );
}

extension ClientExtension$Mutation$DeleteEntry on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteEntry>> mutate$DeleteEntry(
          [Options$Mutation$DeleteEntry? options]) async =>
      await this.mutate(options ?? Options$Mutation$DeleteEntry());
  graphql.ObservableQuery<Mutation$DeleteEntry> watchMutation$DeleteEntry(
          [WatchOptions$Mutation$DeleteEntry? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$DeleteEntry());
}

class Mutation$DeleteEntry$DeleteMediaListEntry {
  Mutation$DeleteEntry$DeleteMediaListEntry({
    this.deleted,
    this.$__typename = 'Deleted',
  });

  factory Mutation$DeleteEntry$DeleteMediaListEntry.fromJson(
      Map<String, dynamic> json) {
    final l$deleted = json['deleted'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteEntry$DeleteMediaListEntry(
      deleted: (l$deleted as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleted = deleted;
    _resultData['deleted'] = l$deleted;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleted = deleted;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleted,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteEntry$DeleteMediaListEntry) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleted = deleted;
    final lOther$deleted = other.deleted;
    if (l$deleted != lOther$deleted) {
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

extension UtilityExtension$Mutation$DeleteEntry$DeleteMediaListEntry
    on Mutation$DeleteEntry$DeleteMediaListEntry {
  CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<
          Mutation$DeleteEntry$DeleteMediaListEntry>
      get copyWith => CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes> {
  factory CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry(
    Mutation$DeleteEntry$DeleteMediaListEntry instance,
    TRes Function(Mutation$DeleteEntry$DeleteMediaListEntry) then,
  ) = _CopyWithImpl$Mutation$DeleteEntry$DeleteMediaListEntry;

  factory CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteEntry$DeleteMediaListEntry;

  TRes call({
    bool? deleted,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteEntry$DeleteMediaListEntry<TRes>
    implements CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes> {
  _CopyWithImpl$Mutation$DeleteEntry$DeleteMediaListEntry(
    this._instance,
    this._then,
  );

  final Mutation$DeleteEntry$DeleteMediaListEntry _instance;

  final TRes Function(Mutation$DeleteEntry$DeleteMediaListEntry) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleted = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteEntry$DeleteMediaListEntry(
        deleted: deleted == _undefined ? _instance.deleted : (deleted as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteEntry$DeleteMediaListEntry<TRes>
    implements CopyWith$Mutation$DeleteEntry$DeleteMediaListEntry<TRes> {
  _CopyWithStubImpl$Mutation$DeleteEntry$DeleteMediaListEntry(this._res);

  TRes _res;

  call({
    bool? deleted,
    String? $__typename,
  }) =>
      _res;
}
