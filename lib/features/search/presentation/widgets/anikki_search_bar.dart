import 'dart:async';

import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnikkiSearchBar extends StatefulWidget {
  const AnikkiSearchBar({super.key});

  @override
  State<AnikkiSearchBar> createState() => _AnikkiSearchBarState();
}

class _AnikkiSearchBarState extends State<AnikkiSearchBar> {
  final controller = TextEditingController();

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextField(
        controller: controller,
        autofocus: true,
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
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          filled: false,
          fillColor: Colors.transparent,
          hintText: 'Search anything',
          suffixIcon: IconButton(
            onPressed: () {
              if (_debounce?.isActive ?? false) {
                _debounce!.cancel();
              }

              controller.clear();

              BlocProvider.of<SearchBloc>(context)
                  .add(const SearchRequested(''));
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    );
  }
}
