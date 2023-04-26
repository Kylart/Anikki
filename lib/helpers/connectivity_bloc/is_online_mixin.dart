import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/helpers/connectivity_bloc/connectivity_bloc.dart';

mixin IsOnlineMixin<T extends StatefulWidget> on State<T> {
  bool isOnline = false;

  StreamSubscription<ConnectivityState>? onlineSubscriptionSteam;

  @override
  void initState() {
    super.initState();

    onlineSubscriptionSteam =
        BlocProvider.of<ConnectivityBloc>(context).stream.listen((state) {
      setState(() {
        isOnline = state is ConnectivityOnline;
      });
    });
  }

  @override
  void dispose() {
    onlineSubscriptionSteam?.cancel();
    super.dispose();
  }
}
