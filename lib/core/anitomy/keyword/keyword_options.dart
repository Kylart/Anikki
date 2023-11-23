part of 'keyword.dart';

class KeywordOptions {
  const KeywordOptions({
    this.identifiable = true,
    this.searchable = true,
    this.valid = true,
  });

  final bool identifiable;
  final bool searchable;
  final bool valid;

  KeywordOptions copyWith({
    bool? identifiable,
    bool? searchable,
    bool? valid,
  }) {
    return KeywordOptions(
      identifiable: identifiable ?? this.identifiable,
      searchable: searchable ?? this.searchable,
      valid: valid ?? this.valid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifiable': identifiable,
      'searchable': searchable,
      'valid': valid,
    };
  }

  factory KeywordOptions.fromMap(Map<String, dynamic> map) {
    return KeywordOptions(
      identifiable: map['identifiable'] as bool,
      searchable: map['searchable'] as bool,
      valid: map['valid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory KeywordOptions.fromJson(String source) =>
      KeywordOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'KeywordOption(identifiable: $identifiable, searchable: $searchable, valid: $valid)';

  @override
  bool operator ==(covariant KeywordOptions other) {
    if (identical(this, other)) return true;

    return other.identifiable == identifiable &&
        other.searchable == searchable &&
        other.valid == valid;
  }

  @override
  int get hashCode =>
      identifiable.hashCode ^ searchable.hashCode ^ valid.hashCode;
}
