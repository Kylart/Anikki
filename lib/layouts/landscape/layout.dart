import 'package:flutter/material.dart';
import 'package:kawanime/layouts/landscape/custom_app_bar.dart';
import 'package:kawanime/layouts/landscape/library_list.dart';
import 'package:kawanime/layouts/landscape/news.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    LibraryList(),
                    News(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
