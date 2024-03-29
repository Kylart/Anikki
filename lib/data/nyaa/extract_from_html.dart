import 'package:anitomy/anitomy.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import 'models/models.dart';
import 'errors/nyaa_no_result_exception.dart';

HtmlResult extractFromHtml({required String data, required String baseUrl}) {
  List<NyaaTorrent> torrents = [];
  Document document = parse(data);

  final rawTorrents = document.querySelectorAll('tr');

  if (rawTorrents.isEmpty) throw NyaaNoResultException();

  rawTorrents.sublist(1).forEach((element) {
    final Element nameElement = element.children[1].children.length == 2
        ? element.children[1].children[1]
        : element.children[1].children[0];
    final name = nameElement.attributes['title'].toString();

    torrents.add(
      NyaaTorrent(
        id: element.children[1].children[0].attributes['href']
                ?.replaceAll('/view/', '') ??
            '000',
        name: name,
        date: (int.parse(
                    (element.children[4].attributes['data-timestamp'] ?? '0')) *
                1000)
            .toString(),
        filesize: element.children[3].text,
        magnet: element.children[2].children.last.attributes['href'] ?? '',
        torrent: baseUrl +
            (element.children[2].children.first.attributes['href'] ?? ''),
        seeders: element.children[5].text,
        leechers: element.children[6].text,
        completed: element.children[7].text,
        status: element.attributes['class'].toString(),
        parsed: Anitomy(inputString: name),
      ),
    );
  });

  final Element? pagination = document.querySelector('ul.pagination');
  final bool hasPagination = pagination != null;
  int maxPage = 1;

  if (hasPagination) {
    final int nbChildren = pagination.children.length;
    maxPage = int.parse(pagination.children[nbChildren - 2].text);
  }

  return HtmlResult(
    torrents: torrents,
    maxPage: maxPage,
  );
}
