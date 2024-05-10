import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/loader_tile.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 50,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 18,
          childAspectRatio: 11 / 16,
        ),
        itemBuilder: (context, index) => const LoaderTile(),
      ),
    );
  }
}
