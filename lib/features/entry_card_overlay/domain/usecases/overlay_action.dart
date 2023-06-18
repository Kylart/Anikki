import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';

void overlayAction(void Function() callback, BuildContext context) {
  callback();
  BlocProvider.of<EntryCardOverlayBloc>(context).add(EntryCardOverlayClosed());
}
