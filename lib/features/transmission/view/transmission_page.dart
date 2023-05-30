import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/torrent/bloc/torrent_bloc.dart';
import 'package:anikki/features/torrent/models/transmission_wrapper.dart';
import 'package:anikki/features/transmission/bloc/transmission_bloc.dart';
import 'package:anikki/features/transmission/view/transmission_view.dart';
import 'package:anikki/widgets/error_tile.dart';

class TransmissionPage extends StatelessWidget {
  const TransmissionPage({
    super.key,
    required this.wrapper,
  });

  final TransmissionWrapper wrapper;

  @override
  Widget build(BuildContext context) {
    if (!wrapper.isAuthorized) {
      return const ErrorTile(
        title: 'Cannot log into Transmission client',
        description: 'Please enter the right credentials in the settings.',
      );
    }

    return BlocProvider(
      create: (context) => TransmissionBloc(
          wrapper.transmission, BlocProvider.of<TorrentBloc>(context)),
      child: const TransmissionView(),
    );
  }
}
