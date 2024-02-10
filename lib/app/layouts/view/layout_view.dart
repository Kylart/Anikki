import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/widgets/landscape/layout.dart';
import 'package:anikki/app/layouts/widgets/portrait/layout.dart';

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

            return switch (state) {
              LayoutLandscape() => const LandscapeLayout(),
              LayoutPortrait() => const PortraitLayout(),
            };
          },
        );
      },
    );
  }
}
