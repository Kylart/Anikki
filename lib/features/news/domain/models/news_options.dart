part of 'models.dart';

class NewsOptions extends Equatable {
  const NewsOptions({
    this.showOnlyBookmarked = false,
    this.showOnlyUnseen = false,
    this.showAdult = false,
    this.showOnlyJap = true,
    this.autoRefresh = true,
  });

  final bool showOnlyBookmarked;
  final bool showOnlyUnseen;
  final bool showAdult;
  final bool showOnlyJap;
  final bool autoRefresh;

  @override
  List<Object> get props {
    return [
      showOnlyBookmarked,
      showOnlyUnseen,
      showAdult,
      showOnlyJap,
      autoRefresh,
    ];
  }

  NewsOptions copyWith({
    bool? showOnlyBookmarked,
    bool? showOnlyUnseen,
    bool? showAdult,
    bool? showOnlyJap,
    bool? autoRefresh,
  }) {
    return NewsOptions(
      showOnlyBookmarked: showOnlyBookmarked ?? this.showOnlyBookmarked,
      showOnlyUnseen: showOnlyUnseen ?? this.showOnlyUnseen,
      showAdult: showAdult ?? this.showAdult,
      showOnlyJap: showOnlyJap ?? this.showOnlyJap,
      autoRefresh: autoRefresh ?? this.autoRefresh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showOnlyBookmarked': showOnlyBookmarked,
      'showOnlySeen': showOnlyUnseen,
      'showAdult': showAdult,
      'showOnlyJap': showOnlyJap,
      'autoRefresh': autoRefresh,
    };
  }

  factory NewsOptions.fromMap(Map<String, dynamic> map) {
    return NewsOptions(
      showOnlyBookmarked: map['showOnlyBookmarked'] as bool,
      showOnlyUnseen: map['showOnlySeen'] as bool,
      showAdult: map['showAdult'] as bool,
      showOnlyJap: map['showOnlyJap'] as bool,
      autoRefresh: map['autoRefresh'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsOptions.fromJson(String source) =>
      NewsOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
