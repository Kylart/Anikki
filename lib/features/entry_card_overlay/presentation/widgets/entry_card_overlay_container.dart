import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/entry_card_overlay/presentation/bloc/entry_card_overlay_bloc.dart';

class EntryCardOverlayContainer extends StatelessWidget {
  const EntryCardOverlayContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => BlocProvider.of<EntryCardOverlayBloc>(context).add(
                EntryCardOverlayClosed(),
              ),
              child: Container(
                color: Colors.black26,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
