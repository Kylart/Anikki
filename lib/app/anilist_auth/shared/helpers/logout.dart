import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';

void logoutFromAnilist(BuildContext context) {
  BlocProvider.of<AnilistAuthBloc>(context).add(
    AnilistAuthLogoutRequested(),
  );
}
