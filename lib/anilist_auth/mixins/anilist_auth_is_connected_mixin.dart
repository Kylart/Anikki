import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AnilistAuthIsConnectedMixin<T extends StatefulWidget> on State<T> {
  bool isConnected = false;
  AnilistAuthSuccess? auth;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<AnilistAuthBloc>(context).stream.listen((state) {
      setState(() {
        isConnected = state is AnilistAuthSuccess;

        if (isConnected) auth = state as AnilistAuthSuccess;
      });
    });
  }
}
