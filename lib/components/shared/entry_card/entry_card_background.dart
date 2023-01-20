import 'package:flutter/material.dart';

class EntryCardBackground extends StatelessWidget {
  const EntryCardBackground({super.key, this.episode, required this.title});

  final String? episode;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              if (episode != null)
                CircleAvatar(
                  child: Text(
                    episode!,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
