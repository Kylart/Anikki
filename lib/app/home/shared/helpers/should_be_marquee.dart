import 'package:anikki/app/layouts/bloc/layout_bloc.dart';

bool shouldBeMarquee(LayoutState layoutState, int nbEntries) {
  final minNumberOfEntries = layoutState is LayoutLandscape ? 5 : 2;

  return nbEntries > minNumberOfEntries;
}
