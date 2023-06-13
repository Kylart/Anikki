part of 'models.dart';

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

  final TorrentType torrentType;
  final TransmissionSettings transmissionSettings;
  final QBitTorrentSettings qBitTorrentSettings;

  const Settings({
    required this.localDirectory,
    required this.newsLayout,
    required this.userListLayouts,
    required this.theme,
    required this.torrentType,
    required this.transmissionSettings,
    required this.qBitTorrentSettings,
  });

  Settings copyWith({
    String? localDirectory,
    NewsLayouts? newsLayout,
    UserListLayouts? userListLayouts,
    ThemeMode? theme,
    TorrentType? torrentType,
    TransmissionSettings? transmissionSettings,
    QBitTorrentSettings? qBitTorrentSettings,
  }) {
    return Settings(
      localDirectory: localDirectory ?? this.localDirectory,
      newsLayout: newsLayout ?? this.newsLayout,
      userListLayouts: userListLayouts ?? this.userListLayouts,
      theme: theme ?? this.theme,
      torrentType: torrentType ?? this.torrentType,
      transmissionSettings: transmissionSettings ?? this.transmissionSettings,
      qBitTorrentSettings: qBitTorrentSettings ?? this.qBitTorrentSettings,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      localDirectory,
      newsLayout,
      userListLayouts,
      theme,
      torrentType,
      transmissionSettings,
      qBitTorrentSettings,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localDirectory': localDirectory,
      'newsLayout': newsLayout.name,
      'userListLayouts': userListLayouts.name,
      'theme': theme.name,
      'torrentType': torrentType.name,
      'transmissionSettings': transmissionSettings.toMap(),
      'qBitTorrentSettings': qBitTorrentSettings.toMap(),
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      localDirectory: map['localDirectory'] as String,
      newsLayout:
          NewsLayouts.values.where((e) => e.name == map['newsLayout']).first,
      userListLayouts: UserListLayouts.values
          .where((e) => e.name == map['userListLayouts'])
          .first,
      theme: ThemeMode.values.where((e) => e.name == map['theme']).first,
      torrentType:
          TorrentType.values.where((e) => e.name == map['torrentType']).first,
      transmissionSettings: TransmissionSettings.fromMap(
          map['transmissionSettings'] as Map<String, dynamic>),
      qBitTorrentSettings: QBitTorrentSettings.fromMap(
          map['qBitTorrentSettings'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);
}
