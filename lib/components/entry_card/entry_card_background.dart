import 'package:flutter/material.dart';

import 'package:anikki/components/glass_circle.dart';

class EntryCardBackground extends StatelessWidget {
  const EntryCardBackground({super.key, this.episode, required this.title});

  final String? episode;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
      trailing: episode != null
          ? GlassCircle(
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(episode!),
                ),
              ),
            )
          : null,
    );
  }
}
