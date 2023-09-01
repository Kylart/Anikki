import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeFeedOptions extends Equatable {
  const HomeFeedOptions({
    this.showAdult = false,
    this.showOnlyJap = true,
  });

  final bool showAdult;
  final bool showOnlyJap;

  @override
  List<Object> get props {
    return [
      showAdult,
      showOnlyJap,
    ];
  }

  HomeFeedOptions copyWith({
    bool? showAdult,
    bool? showOnlyJap,
  }) {
    return HomeFeedOptions(
      showAdult: showAdult ?? this.showAdult,
      showOnlyJap: showOnlyJap ?? this.showOnlyJap,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showAdult': showAdult,
      'showOnlyJap': showOnlyJap,
    };
  }

  factory HomeFeedOptions.fromMap(Map<String, dynamic> map) {
    return HomeFeedOptions(
      showAdult: map['showAdult'] as bool,
      showOnlyJap: map['showOnlyJap'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeFeedOptions.fromJson(String source) =>
      HomeFeedOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
