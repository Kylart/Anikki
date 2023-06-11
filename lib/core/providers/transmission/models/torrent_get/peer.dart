import 'dart:convert';

import 'package:equatable/equatable.dart';

class Peer extends Equatable {
  final String? address;
  final bool? clientIsChoked;
  final bool? clientIsInterested;
  final String? clientName;
  final String? flagStr;
  final bool? isDownloadingFrom;
  final bool? isEncrypted;
  final bool? isIncoming;
  final bool? isUtp;
  final bool? isUploadingTo;
  final bool? peerIsChoked;
  final bool? peerIsInterested;
  final int? port;
  final double? progress;
  final int? rateToClient;
  final int? rateToPeer;

  const Peer({
    this.address,
    this.clientIsChoked,
    this.clientIsInterested,
    this.clientName,
    this.flagStr,
    this.isDownloadingFrom,
    this.isEncrypted,
    this.isIncoming,
    this.isUtp,
    this.isUploadingTo,
    this.peerIsChoked,
    this.peerIsInterested,
    this.port,
    this.progress,
    this.rateToClient,
    this.rateToPeer,
  });

  factory Peer.fromMap(Map<String, dynamic> data) => Peer(
        address: data['address'] as String?,
        clientIsChoked: data['clientIsChoked'] as bool?,
        clientIsInterested: data['clientIsInterested'] as bool?,
        clientName: data['clientName'] as String?,
        flagStr: data['flagStr'] as String?,
        isDownloadingFrom: data['isDownloadingFrom'] as bool?,
        isEncrypted: data['isEncrypted'] as bool?,
        isIncoming: data['isIncoming'] as bool?,
        isUtp: data['isUTP'] as bool?,
        isUploadingTo: data['isUploadingTo'] as bool?,
        peerIsChoked: data['peerIsChoked'] as bool?,
        peerIsInterested: data['peerIsInterested'] as bool?,
        port: data['port'] as int?,
        progress: (data['progress'] as num?)?.toDouble(),
        rateToClient: data['rateToClient'] as int?,
        rateToPeer: data['rateToPeer'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'address': address,
        'clientIsChoked': clientIsChoked,
        'clientIsInterested': clientIsInterested,
        'clientName': clientName,
        'flagStr': flagStr,
        'isDownloadingFrom': isDownloadingFrom,
        'isEncrypted': isEncrypted,
        'isIncoming': isIncoming,
        'isUTP': isUtp,
        'isUploadingTo': isUploadingTo,
        'peerIsChoked': peerIsChoked,
        'peerIsInterested': peerIsInterested,
        'port': port,
        'progress': progress,
        'rateToClient': rateToClient,
        'rateToPeer': rateToPeer,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Peer].
  factory Peer.fromJson(String data) {
    return Peer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Peer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      address,
      clientIsChoked,
      clientIsInterested,
      clientName,
      flagStr,
      isDownloadingFrom,
      isEncrypted,
      isIncoming,
      isUtp,
      isUploadingTo,
      peerIsChoked,
      peerIsInterested,
      port,
      progress,
      rateToClient,
      rateToPeer,
    ];
  }
}
