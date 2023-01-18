import 'package:flutter/material.dart';
import 'package:kawanime/providers/anilist/types/schedule_entry.dart';

class NewsGridCard extends StatefulWidget {
  const NewsGridCard({super.key, required this.entry});

  final ScheduleEntry entry;

  @override
  State<NewsGridCard> createState() => _NewsGridCardState();
}

class _NewsGridCardState extends State<NewsGridCard> {
  bool isHovered = false;
  final transitionDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title =
        entry.media?.title?.romaji ?? entry.media?.title?.english ?? '';

    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          image: coverImage != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(coverImage),
                )
              : null,
        ),
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: transitionDuration,
              opacity: isHovered ? 0 : 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black38,
                          Colors.black87,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        if (entry.episode != null)
                          CircleAvatar(
                            child: Text(
                              entry.episode.toString(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: AnimatedOpacity(
                duration: transitionDuration,
                opacity: isHovered ? 1 : 0,
                child: Container(
                  color: Colors.black87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      NewsGridCardAction(icon: Icons.file_download),
                      NewsGridCardAction(icon: Icons.edit),
                      NewsGridCardAction(icon: Icons.more_horiz),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsGridCardAction extends StatefulWidget {
  const NewsGridCardAction({super.key, required this.icon});

  final IconData icon;

  @override
  State<NewsGridCardAction> createState() => _NewsGridCardActionState();
}

class _NewsGridCardActionState extends State<NewsGridCardAction> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Container(
          width: double.infinity,
          color: isHovered ? Colors.white54 : null,
          child: Icon(widget.icon),
        ),
      ),
    );
  }
}
