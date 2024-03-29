import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';

void main() {
  group('unit test: Layout Bloc', () {
    blocTest(
      'emits [LayoutLandscape] when [LayoutSizeChanged] is added with big size',
      build: () => LayoutBloc(),
      act: (bloc) => bloc.add(
        const LayoutSizeChanged(
          BoxConstraints(maxWidth: kWidthBreakpoint * 2),
        ),
      ),
      expect: () => [const LayoutLandscape()],
    );

    blocTest(
      'emits [LayoutPortrait] when [LayoutSizeChanged] is added with small size',
      build: () => LayoutBloc(),
      act: (bloc) => bloc.add(
        const LayoutSizeChanged(
          BoxConstraints(maxWidth: kWidthBreakpoint - 20),
        ),
      ),
      expect: () => [const LayoutPortrait()],
    );
  });
}
