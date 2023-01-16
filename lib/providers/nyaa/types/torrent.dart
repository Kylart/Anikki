import 'dart:convert';

import 'package:kawanime/providers/anilist/types.dart';

class Torrent {
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

  Media? anilistInfo;

  Torrent({
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
    this.anilistInfo,
  });

  Torrent copyWith({
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
    Media? anilistInfo,
  }) {
    return Torrent(
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
      anilistInfo: anilistInfo ?? this.anilistInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
      // TODO: later
      // 'anilistInfo': anilistInfo?.toMap(),
    };
  }

  factory Torrent.fromMap(Map<String, dynamic> map) {
    return Torrent(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      filesize: map['filesize'],
      magnet: map['magnet'],
      torrent: map['torrent'],
      seeders: map['seeders'],
      leechers: map['leechers'],
      completed: map['completed'],
      status: map['status'],
      // anilistInfo: Media.fromMap(map['anilistInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Torrent.fromJson(String source) =>
      Torrent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Torrent(id: $id, name: $name, date: $date, filesize: $filesize, magnet: $magnet, torrent: $torrent, seeders: $seeders, leechers: $leechers, completed: $completed, status: $status, anilistInfo: $anilistInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Torrent &&
        other.id == id &&
        other.name == name &&
        other.date == date &&
        other.filesize == filesize &&
        other.magnet == magnet &&
        other.torrent == torrent &&
        other.seeders == seeders &&
        other.leechers == leechers &&
        other.completed == completed &&
        other.status == status &&
        other.anilistInfo == anilistInfo;
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
        anilistInfo.hashCode;
  }
}
