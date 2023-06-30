part of 'models.dart';

class Torrent {
  Torrent({
    required this.magnet,
    required this.id,
    required this.hash,
    required this.progress,
    required this.status,
    required this.path,
    required this.name,
  });

  final String magnet;
  final String id;
  final String hash;
  final double progress;
  final String status;
  final String path;
  final String name;

  Torrent copyWith({
    String? magnet,
    String? id,
    String? hash,
    double? progress,
    String? status,
    String? path,
    String? name,
  }) {
    return Torrent(
      magnet: magnet ?? this.magnet,
      id: id ?? this.id,
      hash: hash ?? this.hash,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      path: path ?? this.path,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'magnet': magnet,
      'id': id,
      'hash': hash,
      'progress': progress,
      'status': status,
      'path': path,
      'name': name,
    };
  }

  factory Torrent.fromMap(Map<String, dynamic> map) {
    return Torrent(
      magnet: map['magnet'] as String,
      id: map['id'] as String,
      hash: map['hash'] as String,
      progress: map['progress'] as double,
      status: map['status'] as String,
      path: map['path'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Torrent.fromJson(String source) => Torrent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Torrent(magnet: $magnet, id: $id, hash: $hash, progress: $progress, status: $status, path: $path, name: $name)';
  }

  @override
  bool operator ==(covariant Torrent other) {
    if (identical(this, other)) return true;
  
    return 
      other.magnet == magnet &&
      other.id == id &&
      other.hash == hash &&
      other.progress == progress &&
      other.status == status &&
      other.path == path &&
      other.name == name;
  }

  @override
  int get hashCode {
    return magnet.hashCode ^
      id.hashCode ^
      hash.hashCode ^
      progress.hashCode ^
      status.hashCode ^
      path.hashCode ^
      name.hashCode;
  }
}
