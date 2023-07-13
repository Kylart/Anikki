import 'package:anikki/features/search/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/search/presentation/bloc/search_bloc.dart';
import 'package:anikki/features/search/presentation/view/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        SearchRepository(
          nyaa: Nyaa(),
          anilist: Anilist(
            client: getAnilistClient(),
          ),
        ),
      ),
      child: const SearchView(),
    );
  }
}
