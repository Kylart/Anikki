part of 'anilist_auth_bloc.dart';

abstract class AnilistAuthState extends Equatable {
  const AnilistAuthState();

  @override
  List<Object> get props => [];
}

class AnilistAuthLoggedOut extends AnilistAuthState {}

class AnilistAuthPending extends AnilistAuthState {}

class AnilistAuthSuccess extends AnilistAuthState {
  const AnilistAuthSuccess(this.me);

  final Query$Viewer$Viewer me;

  @override
  List<Object> get props => [me];

  @override
  String toString() {
    return [me.name].join(', ');
  }
}

class AnilistAuthError extends AnilistAuthState {
  const AnilistAuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
