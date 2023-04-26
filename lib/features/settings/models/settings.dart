// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum NewsLayouts {
  grid,
  list,
}

enum UserListLayouts {
  grid,
  list,
}

class Settings extends Equatable {
  final String localDirectory;
  final NewsLayouts newsLayout;
  final UserListLayouts userListLayouts;
  final ThemeMode theme;

  const Settings({
    required this.localDirectory,
    required this.newsLayout,
    required this.userListLayouts,
    required this.theme,
  });

  Settings copyWith({
    String? localDirectory,
    NewsLayouts? newsLayout,
    UserListLayouts? userListLayouts,
    ThemeMode? theme,
  }) {
    return Settings(
      localDirectory: localDirectory ?? this.localDirectory,
      newsLayout: newsLayout ?? this.newsLayout,
      userListLayouts: userListLayouts ?? this.userListLayouts,
      theme: theme ?? this.theme,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [localDirectory, newsLayout, userListLayouts, theme];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localDirectory': localDirectory,
      'newsLayout': newsLayout.name,
      'userListLayouts': userListLayouts.name,
      'theme': theme.name,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      localDirectory: map['localDirectory'] as String,
      newsLayout: NewsLayouts.values.where((e) => e.name == map['newsLayout']).first,
      userListLayouts:
          UserListLayouts.values.where((e) => e.name == map['userListLayouts']).first,
      theme: ThemeMode.values.where((e) => e.name == map['theme']).first,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);
}
