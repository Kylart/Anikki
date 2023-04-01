part of 'anilist_auth_bloc.dart';

abstract class AnilistAuthEvent {
  const AnilistAuthEvent();
}

class AnilistAuthLogoutRequested extends AnilistAuthEvent {}

class AnilistAuthLoginRequested extends AnilistAuthEvent {
  AnilistAuthLoginRequested({this.token});

  final String? token;
}
