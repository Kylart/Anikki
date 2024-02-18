import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

const kWidthBreakpoint = 800;

extension LayoutStateHelpers on BuildContext {
  /// Is `true` when layout bloc is in [LayoutPortrait] state
  bool get portrait =>
      BlocProvider.of<LayoutBloc>(this).state is LayoutPortrait;

  /// Is `true` when layout bloc is in [LayoutLandscape] state
  bool get landscape =>
      BlocProvider.of<LayoutBloc>(this).state is LayoutLandscape;
}
