import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/core.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(const LayoutLandscape()) {
    on<LayoutSizeChanged>((event, emit) {
      if (event.constraints.maxWidth >= kWidthBreakpoint) {
        emit(LayoutLandscape(
          drawerMedia: state.drawerMedia,
          drawerLibraryEntry: state.drawerLibraryEntry,
        ));
      } else {
        emit(LayoutPortrait(
          drawerMedia: state.drawerMedia,
          drawerLibraryEntry: state.drawerLibraryEntry,
        ));
      }
    });

    on<LayoutDrawerMediaChanged>((event, emit) {
      emit(
        switch (state) {
          LayoutLandscape() => LayoutLandscape(
              drawerMedia: event.media,
              drawerLibraryEntry: event.libraryEntry,
            ),
          LayoutPortrait() => LayoutPortrait(
              drawerMedia: event.media,
              drawerLibraryEntry: event.libraryEntry,
            ),
        },
      );
    });
  }
}
