import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/search/bloc/search_bloc.dart';
import 'package:anikki/features/search/view/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryBloc = BlocProvider.of<LibraryBloc>(context);

    return BlocProvider(
      create: (context) => SearchBloc(
        nyaa: Nyaa(),
        anilist: Anilist(client: getAnilistClient()),
        libraryBloc: libraryBloc,
      ),
      child: const SearchView(),
    );
  }
}
