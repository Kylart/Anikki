import 'package:transmission/transmission.dart';

void main(List<String> arguments) async {
  final tranmission = Transmission(
    uri: Uri(
      scheme: 'http',
      host: 'localhost',
      port: 9096,
      path: 'transmission/rpc',
    ),
    username: 'admin',
    password: 'Freedent3107',
  );

  // final session = await tranmission.getSession();
  final added = await tranmission.addTorrent(
      "magnet:?xt=urn:btih:f2f58a3c6aaf1379b6e8235462d5bff80cf2ec3e&dn=%5BSubsPlease%5D%20Isekai%20Shoukan%20wa%20Nidome%20desu%20-%2008%20%281080p%29%20%5B844CEC42%5D.mkv&tr=http%3A%2F%2Fnyaa.tracker.wf%3A7777%2Fannounce&tr=udp%3A%2F%2Fopen.stealth.si%3A80%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce");
  final id = added.arguments?.torrentAdded?.id;

  print('added torrent $id');

  if (id != null) await tranmission.stopTorrent(id);
  // if (id != null) await tranmission.startTorrent(id);

  // final torrents = await tranmission.getTorrents();

  if (id != null) await tranmission.removeTorrent(id, true);
}
