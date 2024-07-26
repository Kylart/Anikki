import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$Viewer {
  Query$Viewer({
    this.Viewer,
    this.$__typename = 'Query',
  });

  factory Query$Viewer.fromJson(Map<String, dynamic> json) {
    final l$Viewer = json['Viewer'];
    final l$$__typename = json['__typename'];
    return Query$Viewer(
      Viewer: l$Viewer == null
          ? null
          : Query$Viewer$Viewer.fromJson((l$Viewer as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$Viewer$Viewer? Viewer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Viewer = Viewer;
    _resultData['Viewer'] = l$Viewer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Viewer = Viewer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Viewer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Viewer = Viewer;
    final lOther$Viewer = other.Viewer;
    if (l$Viewer != lOther$Viewer) {
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

extension UtilityExtension$Query$Viewer on Query$Viewer {
  CopyWith$Query$Viewer<Query$Viewer> get copyWith => CopyWith$Query$Viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Viewer<TRes> {
  factory CopyWith$Query$Viewer(
    Query$Viewer instance,
    TRes Function(Query$Viewer) then,
  ) = _CopyWithImpl$Query$Viewer;

  factory CopyWith$Query$Viewer.stub(TRes res) = _CopyWithStubImpl$Query$Viewer;

  TRes call({
    Query$Viewer$Viewer? Viewer,
    String? $__typename,
  });
  CopyWith$Query$Viewer$Viewer<TRes> get Viewer;
}

class _CopyWithImpl$Query$Viewer<TRes> implements CopyWith$Query$Viewer<TRes> {
  _CopyWithImpl$Query$Viewer(
    this._instance,
    this._then,
  );

  final Query$Viewer _instance;

  final TRes Function(Query$Viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Viewer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer(
        Viewer: Viewer == _undefined
            ? _instance.Viewer
            : (Viewer as Query$Viewer$Viewer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Viewer$Viewer<TRes> get Viewer {
    final local$Viewer = _instance.Viewer;
    return local$Viewer == null
        ? CopyWith$Query$Viewer$Viewer.stub(_then(_instance))
        : CopyWith$Query$Viewer$Viewer(local$Viewer, (e) => call(Viewer: e));
  }
}

class _CopyWithStubImpl$Query$Viewer<TRes>
    implements CopyWith$Query$Viewer<TRes> {
  _CopyWithStubImpl$Query$Viewer(this._res);

  TRes _res;

  call({
    Query$Viewer$Viewer? Viewer,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Viewer$Viewer<TRes> get Viewer =>
      CopyWith$Query$Viewer$Viewer.stub(_res);
}

const documentNodeQueryViewer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Viewer'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Viewer'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatar'),
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
            name: NameNode(value: 'bannerImage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isBlocked'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'options'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'displayAdultContent'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'airingNotifications'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'profileColor'),
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
]);
Query$Viewer _parserFn$Query$Viewer(Map<String, dynamic> data) =>
    Query$Viewer.fromJson(data);
typedef OnQueryComplete$Query$Viewer = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$Viewer?,
);

class Options$Query$Viewer extends graphql.QueryOptions<Query$Viewer> {
  Options$Query$Viewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Viewer? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$Viewer? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$Viewer(data),
                  ),
          onError: onError,
          document: documentNodeQueryViewer,
          parserFn: _parserFn$Query$Viewer,
        );

  final OnQueryComplete$Query$Viewer? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$Viewer
    extends graphql.WatchQueryOptions<Query$Viewer> {
  WatchOptions$Query$Viewer({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$Viewer? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryViewer,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$Viewer,
        );
}

class FetchMoreOptions$Query$Viewer extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Viewer({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryViewer,
        );
}

extension ClientExtension$Query$Viewer on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Viewer>> query$Viewer(
          [Options$Query$Viewer? options]) async =>
      await this.query(options ?? Options$Query$Viewer());
  graphql.ObservableQuery<Query$Viewer> watchQuery$Viewer(
          [WatchOptions$Query$Viewer? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Viewer());
  void writeQuery$Viewer({
    required Query$Viewer data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryViewer)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$Viewer? readQuery$Viewer({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryViewer)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$Viewer.fromJson(result);
  }
}

class Query$Viewer$Viewer {
  Query$Viewer$Viewer({
    required this.id,
    required this.name,
    this.avatar,
    this.bannerImage,
    this.isBlocked,
    this.options,
    this.$__typename = 'User',
  });

  factory Query$Viewer$Viewer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$avatar = json['avatar'];
    final l$bannerImage = json['bannerImage'];
    final l$isBlocked = json['isBlocked'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Query$Viewer$Viewer(
      id: (l$id as int),
      name: (l$name as String),
      avatar: l$avatar == null
          ? null
          : Query$Viewer$Viewer$avatar.fromJson(
              (l$avatar as Map<String, dynamic>)),
      bannerImage: (l$bannerImage as String?),
      isBlocked: (l$isBlocked as bool?),
      options: l$options == null
          ? null
          : Query$Viewer$Viewer$options.fromJson(
              (l$options as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Query$Viewer$Viewer$avatar? avatar;

  final String? bannerImage;

  final bool? isBlocked;

  final Query$Viewer$Viewer$options? options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$avatar = avatar;
    _resultData['avatar'] = l$avatar?.toJson();
    final l$bannerImage = bannerImage;
    _resultData['bannerImage'] = l$bannerImage;
    final l$isBlocked = isBlocked;
    _resultData['isBlocked'] = l$isBlocked;
    final l$options = options;
    _resultData['options'] = l$options?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$avatar = avatar;
    final l$bannerImage = bannerImage;
    final l$isBlocked = isBlocked;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$avatar,
      l$bannerImage,
      l$isBlocked,
      l$options,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer$Viewer) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$avatar = avatar;
    final lOther$avatar = other.avatar;
    if (l$avatar != lOther$avatar) {
      return false;
    }
    final l$bannerImage = bannerImage;
    final lOther$bannerImage = other.bannerImage;
    if (l$bannerImage != lOther$bannerImage) {
      return false;
    }
    final l$isBlocked = isBlocked;
    final lOther$isBlocked = other.isBlocked;
    if (l$isBlocked != lOther$isBlocked) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options != lOther$options) {
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

extension UtilityExtension$Query$Viewer$Viewer on Query$Viewer$Viewer {
  CopyWith$Query$Viewer$Viewer<Query$Viewer$Viewer> get copyWith =>
      CopyWith$Query$Viewer$Viewer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$Viewer$Viewer<TRes> {
  factory CopyWith$Query$Viewer$Viewer(
    Query$Viewer$Viewer instance,
    TRes Function(Query$Viewer$Viewer) then,
  ) = _CopyWithImpl$Query$Viewer$Viewer;

  factory CopyWith$Query$Viewer$Viewer.stub(TRes res) =
      _CopyWithStubImpl$Query$Viewer$Viewer;

  TRes call({
    int? id,
    String? name,
    Query$Viewer$Viewer$avatar? avatar,
    String? bannerImage,
    bool? isBlocked,
    Query$Viewer$Viewer$options? options,
    String? $__typename,
  });
  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar;
  CopyWith$Query$Viewer$Viewer$options<TRes> get options;
}

class _CopyWithImpl$Query$Viewer$Viewer<TRes>
    implements CopyWith$Query$Viewer$Viewer<TRes> {
  _CopyWithImpl$Query$Viewer$Viewer(
    this._instance,
    this._then,
  );

  final Query$Viewer$Viewer _instance;

  final TRes Function(Query$Viewer$Viewer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? avatar = _undefined,
    Object? bannerImage = _undefined,
    Object? isBlocked = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer$Viewer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        avatar: avatar == _undefined
            ? _instance.avatar
            : (avatar as Query$Viewer$Viewer$avatar?),
        bannerImage: bannerImage == _undefined
            ? _instance.bannerImage
            : (bannerImage as String?),
        isBlocked: isBlocked == _undefined
            ? _instance.isBlocked
            : (isBlocked as bool?),
        options: options == _undefined
            ? _instance.options
            : (options as Query$Viewer$Viewer$options?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar {
    final local$avatar = _instance.avatar;
    return local$avatar == null
        ? CopyWith$Query$Viewer$Viewer$avatar.stub(_then(_instance))
        : CopyWith$Query$Viewer$Viewer$avatar(
            local$avatar, (e) => call(avatar: e));
  }

  CopyWith$Query$Viewer$Viewer$options<TRes> get options {
    final local$options = _instance.options;
    return local$options == null
        ? CopyWith$Query$Viewer$Viewer$options.stub(_then(_instance))
        : CopyWith$Query$Viewer$Viewer$options(
            local$options, (e) => call(options: e));
  }
}

class _CopyWithStubImpl$Query$Viewer$Viewer<TRes>
    implements CopyWith$Query$Viewer$Viewer<TRes> {
  _CopyWithStubImpl$Query$Viewer$Viewer(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$Viewer$Viewer$avatar? avatar,
    String? bannerImage,
    bool? isBlocked,
    Query$Viewer$Viewer$options? options,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$Viewer$Viewer$avatar<TRes> get avatar =>
      CopyWith$Query$Viewer$Viewer$avatar.stub(_res);

  CopyWith$Query$Viewer$Viewer$options<TRes> get options =>
      CopyWith$Query$Viewer$Viewer$options.stub(_res);
}

class Query$Viewer$Viewer$avatar {
  Query$Viewer$Viewer$avatar({
    this.large,
    this.medium,
    this.$__typename = 'UserAvatar',
  });

  factory Query$Viewer$Viewer$avatar.fromJson(Map<String, dynamic> json) {
    final l$large = json['large'];
    final l$medium = json['medium'];
    final l$$__typename = json['__typename'];
    return Query$Viewer$Viewer$avatar(
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
    if (!(other is Query$Viewer$Viewer$avatar) ||
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

extension UtilityExtension$Query$Viewer$Viewer$avatar
    on Query$Viewer$Viewer$avatar {
  CopyWith$Query$Viewer$Viewer$avatar<Query$Viewer$Viewer$avatar>
      get copyWith => CopyWith$Query$Viewer$Viewer$avatar(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  factory CopyWith$Query$Viewer$Viewer$avatar(
    Query$Viewer$Viewer$avatar instance,
    TRes Function(Query$Viewer$Viewer$avatar) then,
  ) = _CopyWithImpl$Query$Viewer$Viewer$avatar;

  factory CopyWith$Query$Viewer$Viewer$avatar.stub(TRes res) =
      _CopyWithStubImpl$Query$Viewer$Viewer$avatar;

  TRes call({
    String? large,
    String? medium,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Viewer$Viewer$avatar<TRes>
    implements CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  _CopyWithImpl$Query$Viewer$Viewer$avatar(
    this._instance,
    this._then,
  );

  final Query$Viewer$Viewer$avatar _instance;

  final TRes Function(Query$Viewer$Viewer$avatar) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? large = _undefined,
    Object? medium = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer$Viewer$avatar(
        large: large == _undefined ? _instance.large : (large as String?),
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Viewer$Viewer$avatar<TRes>
    implements CopyWith$Query$Viewer$Viewer$avatar<TRes> {
  _CopyWithStubImpl$Query$Viewer$Viewer$avatar(this._res);

  TRes _res;

  call({
    String? large,
    String? medium,
    String? $__typename,
  }) =>
      _res;
}

class Query$Viewer$Viewer$options {
  Query$Viewer$Viewer$options({
    this.displayAdultContent,
    this.airingNotifications,
    this.profileColor,
    this.$__typename = 'UserOptions',
  });

  factory Query$Viewer$Viewer$options.fromJson(Map<String, dynamic> json) {
    final l$displayAdultContent = json['displayAdultContent'];
    final l$airingNotifications = json['airingNotifications'];
    final l$profileColor = json['profileColor'];
    final l$$__typename = json['__typename'];
    return Query$Viewer$Viewer$options(
      displayAdultContent: (l$displayAdultContent as bool?),
      airingNotifications: (l$airingNotifications as bool?),
      profileColor: (l$profileColor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? displayAdultContent;

  final bool? airingNotifications;

  final String? profileColor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$displayAdultContent = displayAdultContent;
    _resultData['displayAdultContent'] = l$displayAdultContent;
    final l$airingNotifications = airingNotifications;
    _resultData['airingNotifications'] = l$airingNotifications;
    final l$profileColor = profileColor;
    _resultData['profileColor'] = l$profileColor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$displayAdultContent = displayAdultContent;
    final l$airingNotifications = airingNotifications;
    final l$profileColor = profileColor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$displayAdultContent,
      l$airingNotifications,
      l$profileColor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$Viewer$Viewer$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$displayAdultContent = displayAdultContent;
    final lOther$displayAdultContent = other.displayAdultContent;
    if (l$displayAdultContent != lOther$displayAdultContent) {
      return false;
    }
    final l$airingNotifications = airingNotifications;
    final lOther$airingNotifications = other.airingNotifications;
    if (l$airingNotifications != lOther$airingNotifications) {
      return false;
    }
    final l$profileColor = profileColor;
    final lOther$profileColor = other.profileColor;
    if (l$profileColor != lOther$profileColor) {
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

extension UtilityExtension$Query$Viewer$Viewer$options
    on Query$Viewer$Viewer$options {
  CopyWith$Query$Viewer$Viewer$options<Query$Viewer$Viewer$options>
      get copyWith => CopyWith$Query$Viewer$Viewer$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$Viewer$Viewer$options<TRes> {
  factory CopyWith$Query$Viewer$Viewer$options(
    Query$Viewer$Viewer$options instance,
    TRes Function(Query$Viewer$Viewer$options) then,
  ) = _CopyWithImpl$Query$Viewer$Viewer$options;

  factory CopyWith$Query$Viewer$Viewer$options.stub(TRes res) =
      _CopyWithStubImpl$Query$Viewer$Viewer$options;

  TRes call({
    bool? displayAdultContent,
    bool? airingNotifications,
    String? profileColor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$Viewer$Viewer$options<TRes>
    implements CopyWith$Query$Viewer$Viewer$options<TRes> {
  _CopyWithImpl$Query$Viewer$Viewer$options(
    this._instance,
    this._then,
  );

  final Query$Viewer$Viewer$options _instance;

  final TRes Function(Query$Viewer$Viewer$options) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? displayAdultContent = _undefined,
    Object? airingNotifications = _undefined,
    Object? profileColor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$Viewer$Viewer$options(
        displayAdultContent: displayAdultContent == _undefined
            ? _instance.displayAdultContent
            : (displayAdultContent as bool?),
        airingNotifications: airingNotifications == _undefined
            ? _instance.airingNotifications
            : (airingNotifications as bool?),
        profileColor: profileColor == _undefined
            ? _instance.profileColor
            : (profileColor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$Viewer$Viewer$options<TRes>
    implements CopyWith$Query$Viewer$Viewer$options<TRes> {
  _CopyWithStubImpl$Query$Viewer$Viewer$options(this._res);

  TRes _res;

  call({
    bool? displayAdultContent,
    bool? airingNotifications,
    String? profileColor,
    String? $__typename,
  }) =>
      _res;
}
