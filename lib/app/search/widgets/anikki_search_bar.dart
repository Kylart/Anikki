import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/search/bloc/search_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class AnikkiSearchBar extends StatefulWidget {
  const AnikkiSearchBar({super.key});

  @override
  State<AnikkiSearchBar> createState() => _AnikkiSearchBarState();
}

class _AnikkiSearchBarState extends State<AnikkiSearchBar> {
  final borderRadius = const BorderRadius.all(Radius.circular(40));

  final controller = TextEditingController();
  late String text;

  bool get hasText => text.isNotEmpty;

  Timer? _debounce;

  void updateText() {
    setState(() {
      text = controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(updateText);

    updateText();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.removeListener(updateText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: !hasText
              ? ImageFilter.blur(sigmaX: 40, sigmaY: 40)
              : ImageFilter.blur(),
          child: TextField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();

              _debounce = Timer(
                const Duration(milliseconds: 300),
                () {
                  final libraryBloc = BlocProvider.of<LibraryBloc>(context);
                  final searchBloc = BlocProvider.of<SearchBloc>(context);

                  searchBloc.add(
                    SearchRequested(
                      controller.text,
                      libraryEntries: libraryBloc.state is LibraryLoaded
                          ? (libraryBloc.state as LibraryLoaded).entries
                          : const [],
                    ),
                  );
                },
              );
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: borderRadius,
              ),
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              hintText: 'Looking for something?',
              suffixIcon: IconButton(
                onPressed: () {
                  if (_debounce?.isActive ?? false) {
                    _debounce!.cancel();
                  }

                  controller.clear();

                  BlocProvider.of<SearchBloc>(context)
                      .add(const SearchRequested(''));
                },
                icon: const Icon(HugeIcons.strokeRoundedCancel01),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
