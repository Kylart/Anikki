import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/settings/settings.dart';
import 'package:anikki/core/widgets/fade_overlay.dart';
import 'package:anikki/core/helpers/connectivity_bloc/connectivity_bloc.dart';
import 'package:anikki/features/search/search.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    void showSearch() {
      showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            alignment: Alignment.topCenter,
            child: SearchPage(),
          );
        },
      );
    }

    void showSettings() {
      Navigator.of(context).push(
        FadeOverlay(
          child: Column(
            children: [
              AppBar(
                title: const Text('Settings'),
              ),
              const Expanded(child: SettingsView()),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      child: Row(
        children: [
          const Spacer(),
          BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              return Offstage(
                offstage: state is ConnectivityOnline,
                child: const Tooltip(
                  message:
                      'No internet connection detected. Some features will not work.',
                  child: Icon(Icons.signal_wifi_connected_no_internet_4),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton.filledTonal(
              onPressed: showSearch,
              icon: const Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton.filledTonal(
              onPressed: showSettings,
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
