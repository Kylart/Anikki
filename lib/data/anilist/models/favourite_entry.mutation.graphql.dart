import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$ToggleFavourite {
  factory Variables$Mutation$ToggleFavourite({int? animeId}) =>
      Variables$Mutation$ToggleFavourite._({
        if (animeId != null) r'animeId': animeId,
      });

  Variables$Mutation$ToggleFavourite._(this._$data);

  factory Variables$Mutation$ToggleFavourite.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('animeId')) {
      final l$animeId = data['animeId'];
      result$data['animeId'] = (l$animeId as int?);
    }
    return Variables$Mutation$ToggleFavourite._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get animeId => (_$data['animeId'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('animeId')) {
      final l$animeId = animeId;
      result$data['animeId'] = l$animeId;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$ToggleFavourite<
          Variables$Mutation$ToggleFavourite>
      get copyWith => CopyWith$Variables$Mutation$ToggleFavourite(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$ToggleFavourite) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$animeId = animeId;
    final lOther$animeId = other.animeId;
    if (_$data.containsKey('animeId') != other._$data.containsKey('animeId')) {
      return false;
    }
    if (l$animeId != lOther$animeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$animeId = animeId;
    return Object.hashAll(
        [_$data.containsKey('animeId') ? l$animeId : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$ToggleFavourite<TRes> {
  factory CopyWith$Variables$Mutation$ToggleFavourite(
    Variables$Mutation$ToggleFavourite instance,
    TRes Function(Variables$Mutation$ToggleFavourite) then,
  ) = _CopyWithImpl$Variables$Mutation$ToggleFavourite;

  factory CopyWith$Variables$Mutation$ToggleFavourite.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ToggleFavourite;

  TRes call({int? animeId});
}

class _CopyWithImpl$Variables$Mutation$ToggleFavourite<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavourite<TRes> {
  _CopyWithImpl$Variables$Mutation$ToggleFavourite(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ToggleFavourite _instance;

  final TRes Function(Variables$Mutation$ToggleFavourite) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? animeId = _undefined}) =>
      _then(Variables$Mutation$ToggleFavourite._({
        ..._instance._$data,
        if (animeId != _undefined) 'animeId': (animeId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ToggleFavourite<TRes>
    implements CopyWith$Variables$Mutation$ToggleFavourite<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ToggleFavourite(this._res);

  TRes _res;

  call({int? animeId}) => _res;
}

class Mutation$ToggleFavourite {
  Mutation$ToggleFavourite({
    this.ToggleFavourite,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ToggleFavourite.fromJson(Map<String, dynamic> json) {
    final l$ToggleFavourite = json['ToggleFavourite'];
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavourite(
      ToggleFavourite: l$ToggleFavourite == null
          ? null
          : Mutation$ToggleFavourite$ToggleFavourite.fromJson(
              (l$ToggleFavourite as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ToggleFavourite$ToggleFavourite? ToggleFavourite;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$ToggleFavourite = ToggleFavourite;
    _resultData['ToggleFavourite'] = l$ToggleFavourite?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$ToggleFavourite = ToggleFavourite;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$ToggleFavourite,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ToggleFavourite) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ToggleFavourite = ToggleFavourite;
    final lOther$ToggleFavourite = other.ToggleFavourite;
    if (l$ToggleFavourite != lOther$ToggleFavourite) {
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

extension UtilityExtension$Mutation$ToggleFavourite
    on Mutation$ToggleFavourite {
  CopyWith$Mutation$ToggleFavourite<Mutation$ToggleFavourite> get copyWith =>
      CopyWith$Mutation$ToggleFavourite(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ToggleFavourite<TRes> {
  factory CopyWith$Mutation$ToggleFavourite(
    Mutation$ToggleFavourite instance,
    TRes Function(Mutation$ToggleFavourite) then,
  ) = _CopyWithImpl$Mutation$ToggleFavourite;

  factory CopyWith$Mutation$ToggleFavourite.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ToggleFavourite;

  TRes call({
    Mutation$ToggleFavourite$ToggleFavourite? ToggleFavourite,
    String? $__typename,
  });
  CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> get ToggleFavourite;
}

class _CopyWithImpl$Mutation$ToggleFavourite<TRes>
    implements CopyWith$Mutation$ToggleFavourite<TRes> {
  _CopyWithImpl$Mutation$ToggleFavourite(
    this._instance,
    this._then,
  );

  final Mutation$ToggleFavourite _instance;

  final TRes Function(Mutation$ToggleFavourite) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ToggleFavourite = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ToggleFavourite(
        ToggleFavourite: ToggleFavourite == _undefined
            ? _instance.ToggleFavourite
            : (ToggleFavourite as Mutation$ToggleFavourite$ToggleFavourite?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> get ToggleFavourite {
    final local$ToggleFavourite = _instance.ToggleFavourite;
    return local$ToggleFavourite == null
        ? CopyWith$Mutation$ToggleFavourite$ToggleFavourite.stub(
            _then(_instance))
        : CopyWith$Mutation$ToggleFavourite$ToggleFavourite(
            local$ToggleFavourite, (e) => call(ToggleFavourite: e));
  }
}

class _CopyWithStubImpl$Mutation$ToggleFavourite<TRes>
    implements CopyWith$Mutation$ToggleFavourite<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavourite(this._res);

  TRes _res;

  call({
    Mutation$ToggleFavourite$ToggleFavourite? ToggleFavourite,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> get ToggleFavourite =>
      CopyWith$Mutation$ToggleFavourite$ToggleFavourite.stub(_res);
}

const documentNodeMutationToggleFavourite = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ToggleFavourite'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'animeId')),
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
        name: NameNode(value: 'ToggleFavourite'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'animeId'),
            value: VariableNode(name: NameNode(value: 'animeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
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
Mutation$ToggleFavourite _parserFn$Mutation$ToggleFavourite(
        Map<String, dynamic> data) =>
    Mutation$ToggleFavourite.fromJson(data);
typedef OnMutationCompleted$Mutation$ToggleFavourite = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ToggleFavourite?,
);

class Options$Mutation$ToggleFavourite
    extends graphql.MutationOptions<Mutation$ToggleFavourite> {
  Options$Mutation$ToggleFavourite({
    String? operationName,
    Variables$Mutation$ToggleFavourite? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavourite? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ToggleFavourite? onCompleted,
    graphql.OnMutationUpdate<Mutation$ToggleFavourite>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ToggleFavourite(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationToggleFavourite,
          parserFn: _parserFn$Mutation$ToggleFavourite,
        );

  final OnMutationCompleted$Mutation$ToggleFavourite? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ToggleFavourite
    extends graphql.WatchQueryOptions<Mutation$ToggleFavourite> {
  WatchOptions$Mutation$ToggleFavourite({
    String? operationName,
    Variables$Mutation$ToggleFavourite? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ToggleFavourite? typedOptimisticResult,
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
          document: documentNodeMutationToggleFavourite,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ToggleFavourite,
        );
}

extension ClientExtension$Mutation$ToggleFavourite on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ToggleFavourite>> mutate$ToggleFavourite(
          [Options$Mutation$ToggleFavourite? options]) async =>
      await this.mutate(options ?? Options$Mutation$ToggleFavourite());
  graphql.ObservableQuery<
      Mutation$ToggleFavourite> watchMutation$ToggleFavourite(
          [WatchOptions$Mutation$ToggleFavourite? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$ToggleFavourite());
}

class Mutation$ToggleFavourite$ToggleFavourite {
  Mutation$ToggleFavourite$ToggleFavourite({this.$__typename = 'Favourites'});

  factory Mutation$ToggleFavourite$ToggleFavourite.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return Mutation$ToggleFavourite$ToggleFavourite(
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
    if (!(other is Mutation$ToggleFavourite$ToggleFavourite) ||
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

extension UtilityExtension$Mutation$ToggleFavourite$ToggleFavourite
    on Mutation$ToggleFavourite$ToggleFavourite {
  CopyWith$Mutation$ToggleFavourite$ToggleFavourite<
          Mutation$ToggleFavourite$ToggleFavourite>
      get copyWith => CopyWith$Mutation$ToggleFavourite$ToggleFavourite(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> {
  factory CopyWith$Mutation$ToggleFavourite$ToggleFavourite(
    Mutation$ToggleFavourite$ToggleFavourite instance,
    TRes Function(Mutation$ToggleFavourite$ToggleFavourite) then,
  ) = _CopyWithImpl$Mutation$ToggleFavourite$ToggleFavourite;

  factory CopyWith$Mutation$ToggleFavourite$ToggleFavourite.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ToggleFavourite$ToggleFavourite;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Mutation$ToggleFavourite$ToggleFavourite<TRes>
    implements CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> {
  _CopyWithImpl$Mutation$ToggleFavourite$ToggleFavourite(
    this._instance,
    this._then,
  );

  final Mutation$ToggleFavourite$ToggleFavourite _instance;

  final TRes Function(Mutation$ToggleFavourite$ToggleFavourite) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(Mutation$ToggleFavourite$ToggleFavourite(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Mutation$ToggleFavourite$ToggleFavourite<TRes>
    implements CopyWith$Mutation$ToggleFavourite$ToggleFavourite<TRes> {
  _CopyWithStubImpl$Mutation$ToggleFavourite$ToggleFavourite(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
