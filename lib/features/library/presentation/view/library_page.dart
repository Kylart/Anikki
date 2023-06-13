import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/features/library/presentation/view/library_view.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LibraryBloc, LibraryState>(
      listener: (context, state) {
        if (state is LibraryLoaded) {
          final settingsBloc = BlocProvider.of<SettingsBloc>(context);

          settingsBloc.add(
            SettingsUpdated(
              settingsBloc.state.settings.copyWith(
                localDirectory: state.path,
              ),
            ),
          );
        }
      },
      child: const LibraryView(),
    );
  }
}
