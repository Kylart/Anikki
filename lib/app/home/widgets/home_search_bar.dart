import 'dart:ui';

import 'package:anikki/app/search/search.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: show ? 1.0 : 0.0,
      child: SizedBox(
        width: 700,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: TextFormField(
              textAlign: TextAlign.center,
              readOnly: false,
              showCursor: false,
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                suffixIcon: Icon(Ionicons.search),
                hintText: 'Looking for something?',
              ),
              onTap: () async {
                setState(() {
                  show = false;
                });

                await showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      alignment: Alignment.topCenter,
                      child: SearchView(),
                    );
                  },
                );

                setState(() {
                  show = true;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
