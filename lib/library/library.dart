import 'package:empty_widget/empty_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:anikki/providers/user_preferences/user_preferences.dart';
import 'package:anikki/components/error_tile.dart';
import 'package:anikki/helpers/errors/library_directory_does_not_exist_exception.dart';
import 'package:anikki/library/library_layout.dart';
import 'package:anikki/library/store.dart';

class Library extends StatelessWidget {
  const Library({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final path = context.watch<LocalDirectory>().path;

    return FutureBuilder(
      future: context.read<LocalStore>().getFiles(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          if (snapshot.error!.runtimeType == LibraryDoesNotExistException) {
            final error = snapshot.error! as LibraryDoesNotExistException;

            return ErrorTile(
              title: error.cause,
            );
          }

          return const ErrorTile();
        }

        if (snapshot.data!.isEmpty) {
          return Center(
            child: EmptyWidget(
              packageImage: PackageImage.Image_2,
              title: 'No File',
              subTitle: 'Could not find any video.',
            ),
          );
        } else {
          return const LibraryLayout();
        }
      },
    );
  }
}
