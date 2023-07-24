import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

const kWidthBreakpoint = 800;

bool isPortrait(BuildContext context) {
  return BlocProvider.of<LayoutBloc>(context).state.runtimeType ==
      LayoutPortrait;
}

bool isLandscape(BuildContext context) {
  return BlocProvider.of<LayoutBloc>(context).state.runtimeType ==
      LayoutLandscape;
}
