part of 'anilist_auth_bloc.dart';

sealed class AnilistAuthState extends Equatable {
  const AnilistAuthState();

  @override
  List<Object> get props => [];
}

final class AnilistAuthLoggedOut extends AnilistAuthState {}

final class AnilistAuthSuccess extends AnilistAuthState {
  const AnilistAuthSuccess(this.me);

  final Query$Viewer$Viewer me;

  @override
  List<Object> get props => [me];

  @override
  String toString() {
    return [me.name].join(', ');
  }
}

final class AnilistAuthError extends AnilistAuthState {
  const AnilistAuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
