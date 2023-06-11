import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/anilist_auth/presentation/bloc/anilist_auth_bloc.dart';

mixin AnilistAuthIsConnectedMixin<T extends StatefulWidget> on State<T> {
  bool isConnected = false;
  AnilistAuthSuccess? auth;

  StreamSubscription<AnilistAuthState>? isConnectedStreamSubscription;

  @override
  void initState() {
    super.initState();

    isConnectedStreamSubscription =
        BlocProvider.of<AnilistAuthBloc>(context).stream.listen((state) {
      setState(() {
        isConnected = state is AnilistAuthSuccess;

        if (isConnected) auth = state as AnilistAuthSuccess;
      });
    });
  }

  @override
  void dispose() {
    isConnectedStreamSubscription?.cancel();
    super.dispose();
  }
}
