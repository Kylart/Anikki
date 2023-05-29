import 'dart:convert';

import 'package:equatable/equatable.dart';

class QBitTorrentSettings extends Equatable {
  final int port;
  final String scheme;
  final String host;
  final String? username;
  final String? password;

  const QBitTorrentSettings({
    this.port = 8080,
    this.scheme = 'http',
    this.host = '127.0.0.1',
    this.username,
    this.password,
  });

  @override
  List<Object> get props => [
        port,
        scheme,
        host,
        if (username != null) username!,
        if (password != null) password!,
      ];

  QBitTorrentSettings copyWith({
    int? port,
    String? scheme,
    String? host,
    String? username,
    String? password,
  }) {
    return QBitTorrentSettings(
      port: port ?? this.port,
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'port': port,
      'scheme': scheme,
      'host': host,
      'username': username,
      'password': password,
    };
  }

  factory QBitTorrentSettings.fromMap(Map<String, dynamic> map) {
    return QBitTorrentSettings(
      port: map['port'] as int,
      scheme: map['scheme'] as String,
      host: map['host'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QBitTorrentSettings.fromJson(String source) =>
      QBitTorrentSettings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QBitTorrentSettings(port: $port, scheme: $scheme, host: $host, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant QBitTorrentSettings other) {
    if (identical(this, other)) return true;

    return other.port == port &&
        other.scheme == scheme &&
        other.host == host &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return port.hashCode ^
        scheme.hashCode ^
        host.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}
