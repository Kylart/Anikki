import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/core/widgets/layout_card.dart';

class SearchViewContainer extends StatelessWidget {
  const SearchViewContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(builder: (context, state) {
      final landscape = state is LayoutLandscape;
      if (landscape) {
        return LayoutCard(
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
