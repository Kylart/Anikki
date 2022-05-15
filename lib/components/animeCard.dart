import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kawanime/components/shared/expandableFab.dart';

import 'package:kawanime/services/externals/anilist/types/media/media.dart';
import 'package:kawanime/services/externals/anilist/types/schedule_entry.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AnimeCard extends StatefulWidget {
  const AnimeCard({Key? key, required this.entry}) : super(key: key);

  final ScheduleEntry entry;

  @override
  State<AnimeCard> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  @override
  Widget build(BuildContext context) {
    ScheduleEntry entry = widget.entry;
    Media? media = entry.media;

    String title = media?.title?.romaji ?? media?.title?.english ?? 'N/A';
    DateTime airingTime =
        DateTime.fromMillisecondsSinceEpoch((entry.airingAt ?? 0) * 1000);

    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 5,
        right: 5,
        left: 5,
      ),
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Stack(
        children: [
          BackgroundImage(media: media),
          TextCard(title: title, entry: entry, airingTime: airingTime),
          const CardButton(),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 35, right: 15),
      child: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          ActionButton(
            icon: const Icon(Icons.file_download),
            onPressed: () {},
          ),
          ActionButton(
            icon: const Icon(Icons.watch),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.title,
    required this.entry,
    required this.airingTime,
  }) : super(key: key);

  final String title;
  final ScheduleEntry entry;
  final DateTime airingTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: FractionallySizedBox(
        alignment: Alignment.bottomLeft,
        heightFactor: 0.25,
        widthFactor: 0.8,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 247, 247),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(
                color: const Color.fromARGB(255, 227, 226, 226),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    entry.airingAt != null
                        ? Text(
                            'Airing at ${DateFormat('HH:mm').format(airingTime)}',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                            ),
                          )
                        : const Spacer(),
                    Text(
                      'Episode ${entry.episode}',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media? media;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            color: media?.coverImage?.color != null
                ? HexColor.fromHex(media?.coverImage?.color ?? '#000000')
                : null,
            child: CachedNetworkImage(
              alignment: Alignment.topCenter,
              height: double.infinity,
              fit: BoxFit.contain,
              imageUrl: media?.coverImage?.extraLarge ??
                  media?.coverImage?.large ??
                  '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
