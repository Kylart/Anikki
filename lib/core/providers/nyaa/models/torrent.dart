import 'dart:convert';

import 'package:anitomy/anitomy.dart';

class NyaaTorrent {
  String id;
  String name;
  String date;
  String filesize;
  String magnet;
  String torrent;
  String seeders;
  String leechers;
  String completed;
  String status;
  Anitomy parsed;

  NyaaTorrent({
    required this.id,
    required this.name,
    required this.date,
    required this.filesize,
    required this.magnet,
    required this.torrent,
    required this.seeders,
    required this.leechers,
    required this.completed,
    required this.status,
    required this.parsed,
  });

  NyaaTorrent copyWith({
    String? id,
    String? name,
    String? date,
    String? filesize,
    String? magnet,
    String? torrent,
    String? seeders,
    String? leechers,
    String? completed,
    String? status,
    Anitomy? parsed,
  }) {
    return NyaaTorrent(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      filesize: filesize ?? this.filesize,
      magnet: magnet ?? this.magnet,
      torrent: torrent ?? this.torrent,
      seeders: seeders ?? this.seeders,
      leechers: leechers ?? this.leechers,
      completed: completed ?? this.completed,
      status: status ?? this.status,
      parsed: parsed ?? this.parsed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'date': date,
      'filesize': filesize,
      'magnet': magnet,
      'torrent': torrent,
      'seeders': seeders,
      'leechers': leechers,
      'completed': completed,
      'status': status,
      'parsed': parsed.toMap(),
    };
  }

  factory NyaaTorrent.fromMap(Map<String, dynamic> map) {
    return NyaaTorrent(
      id: map['id'] as String,
      name: map['name'] as String,
      date: map['date'] as String,
      filesize: map['filesize'] as String,
      magnet: map['magnet'] as String,
      torrent: map['torrent'] as String,
      seeders: map['seeders'] as String,
      leechers: map['leechers'] as String,
      completed: map['completed'] as String,
      status: map['status'] as String,
      parsed: Anitomy(inputString: map['name'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory NyaaTorrent.fromJson(String source) =>
      NyaaTorrent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Torrent(id: $id, name: $name, date: $date, filesize: $filesize, magnet: $magnet, torrent: $torrent, seeders: $seeders, leechers: $leechers, completed: $completed, status: $status, parsed: $parsed)';
  }

  @override
  bool operator ==(covariant NyaaTorrent other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.date == date &&
        other.filesize == filesize &&
        other.magnet == magnet &&
        other.torrent == torrent &&
        other.seeders == seeders &&
        other.leechers == leechers &&
        other.completed == completed &&
        other.status == status &&
        other.parsed == parsed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        date.hashCode ^
        filesize.hashCode ^
        magnet.hashCode ^
        torrent.hashCode ^
        seeders.hashCode ^
        leechers.hashCode ^
        completed.hashCode ^
        status.hashCode ^
        parsed.hashCode;
  }
}
