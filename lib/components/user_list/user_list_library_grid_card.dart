import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/grid_card_action.dart';
import 'package:kawanime/providers/local/types/file.dart';

class UserListLibraryGridCard extends StatefulWidget {
  const UserListLibraryGridCard({super.key, required this.entry});

  final LocalFile entry;

  @override
  State<UserListLibraryGridCard> createState() =>
      _UserListLibraryGridCardState();
}

class _UserListLibraryGridCardState extends State<UserListLibraryGridCard> {
  bool isHovered = false;
  final transitionDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final coverImage = entry.media?.coverImage?.extraLarge ??
        entry.media?.coverImage?.large ??
        entry.media?.coverImage?.medium;
    final title = entry.media?.title?.romaji ??
        entry.media?.title?.english ??
        entry.title;

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
              : const DecorationImage(
                  opacity: 0.7,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/placeholder.png'),
                ),
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
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    children: [
                      const GridCardAction(icon: Icons.play_arrow),
                      const GridCardAction(icon: Icons.edit),
                      GridCardAction(
                        icon: Icons.delete,
                        iconColor: Theme.of(context).colorScheme.error,
                        hoverColor:
                            Theme.of(context).colorScheme.errorContainer,
                      ),
                      const GridCardAction(icon: Icons.more_horiz),
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
