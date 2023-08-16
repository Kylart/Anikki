import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeFeedOptions extends Equatable {
  const HomeFeedOptions({
    this.showAdult = false,
    this.showOnlyJap = true,
    this.autoRefresh = true,
  });

  final bool showAdult;
  final bool showOnlyJap;
  final bool autoRefresh;

  @override
  List<Object> get props {
    return [
      showAdult,
      showOnlyJap,
      autoRefresh,
    ];
  }

  HomeFeedOptions copyWith({
    bool? showAdult,
    bool? showOnlyJap,
    bool? autoRefresh,
  }) {
    return HomeFeedOptions(
      showAdult: showAdult ?? this.showAdult,
      showOnlyJap: showOnlyJap ?? this.showOnlyJap,
      autoRefresh: autoRefresh ?? this.autoRefresh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showAdult': showAdult,
      'showOnlyJap': showOnlyJap,
      'autoRefresh': autoRefresh,
    };
  }

  factory HomeFeedOptions.fromMap(Map<String, dynamic> map) {
    return HomeFeedOptions(
      showAdult: map['showAdult'] as bool,
      showOnlyJap: map['showOnlyJap'] as bool,
      autoRefresh: map['autoRefresh'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeFeedOptions.fromJson(String source) =>
      HomeFeedOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
