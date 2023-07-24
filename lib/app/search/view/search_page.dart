import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:anikki/app/search/bloc/search_bloc.dart';
import 'package:anikki/app/search/view/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        AnimeInformationRepository(
          Anilist(
            client: getAnilistClient(),
          ),
          Nyaa(),
        ),
      ),
      child: const SearchView(),
    );
  }
}
