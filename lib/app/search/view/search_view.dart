import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/search/widgets/anikki_search_bar.dart';
import 'package:anikki/app/search/bloc/search_bloc.dart';
import 'package:anikki/app/search/widgets/search_results.dart';
import 'package:anikki/core/widgets/loader.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return SearchViewContainer(
          isEmpty:
              state is SearchSuccess ? state.isEmpty : state is SearchEmptyTerm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AnikkiSearchBar(),
              if (state is! SearchEmptyTerm) const Divider(),
              if (state is SearchLoading)
                const Expanded(
                  child: Loader(),
                ),
              if (state is SearchSuccess)
                Expanded(
                  child: state.isEmpty
                      ? SizedBox(
                          width: 300,
                          child: EmptyWidget(
                            title: 'Could not find anything...',
                          ),
                        )
                      : SearchResults(
                          state: state,
                        ),
                ),
              if (state is SearchError)
                ErrorTile(
                  description: state.message,
                ),
            ],
          ),
        );
      },
    );
  }
}

class SearchViewContainer extends StatelessWidget {
  const SearchViewContainer({
    super.key,
    required this.child,
    this.isEmpty = true,
  });

  final bool isEmpty;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(builder: (context, state) {
      final landscape = state is LayoutLandscape;
      if (landscape) {
        return LayoutCard(
          transparent: isEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 800,
              child: child,
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: child,
        );
      }
    });
  }
}
