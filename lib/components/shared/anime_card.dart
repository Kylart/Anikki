import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/expandable_fab.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key});

  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  
  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 170,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            elevation: 25,
            child: Stack(
              children: [
                Image.network(
                  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx20047-QcFqHoZNuCIH.png',
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: Text('12'),
                  ),
                ),
                Positioned(
                  height: 112.0,
                  width: 112.0,
                  bottom: 4,
                  right: 4,
                  child: ExpandableFab(
                    distance: 56.0,
                    children: [
                      ActionButton(
                        onPressed: () => _showAction(context, 0),
                        icon: const Icon(Icons.format_size),
                      ),
                      ActionButton(
                        onPressed: () => _showAction(context, 1),
                        icon: const Icon(Icons.insert_photo),
                      ),
                      ActionButton(
                        onPressed: () => _showAction(context, 2),
                        icon: const Icon(Icons.videocam),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Sakura Trick is a very long name',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
