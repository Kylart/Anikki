import 'dart:convert';

import 'package:equatable/equatable.dart';

class Units extends Equatable {
  final int? memoryBytes;
  final List<String>? memoryUnits;
  final int? sizeBytes;
  final List<String>? sizeUnits;
  final int? speedBytes;
  final List<String>? speedUnits;

  const Units({
    this.memoryBytes,
    this.memoryUnits,
    this.sizeBytes,
    this.sizeUnits,
    this.speedBytes,
    this.speedUnits,
  });

  factory Units.fromMap(Map<String, dynamic> data) => Units(
        memoryBytes: data['memory-bytes'] as int?,
        memoryUnits: data['memory-units'] == null
            ? null
            : List<String>.from(data['memory-units']),
        sizeBytes: data['size-bytes'] as int?,
        sizeUnits: data['size-units'] == null
            ? null
            : List<String>.from(data['size-units']),
        speedBytes: data['speed-bytes'] as int?,
        speedUnits: data['speed-units'] == null
            ? null
            : List<String>.from(data['speed-units']),
      );

  Map<String, dynamic> toMap() => {
        'memory-bytes': memoryBytes,
        'memory-units': memoryUnits,
        'size-bytes': sizeBytes,
        'size-units': sizeUnits,
        'speed-bytes': speedBytes,
        'speed-units': speedUnits,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Units].
  factory Units.fromJson(String data) {
    return Units.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Units] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      memoryBytes,
      memoryUnits,
      sizeBytes,
      sizeUnits,
      speedBytes,
      speedUnits,
    ];
  }
}
