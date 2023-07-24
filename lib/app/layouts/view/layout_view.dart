import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/widgets/landscape/layout.dart';
import 'package:anikki/app/layouts/widgets/portrait/layout.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            BlocProvider.of<LayoutBloc>(context).add(
              LayoutSizeChanged(constraints),
            );

            switch (state.runtimeType) {
              case LayoutLandscape:
                return const LandscapeLayout();
              case LayoutPortrait:
                return const PortraitLayout();
              default:
                return const SizedBox();
            }
          },
        );
      },
    );
  }
}
