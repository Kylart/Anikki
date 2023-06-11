import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'package:anikki/core/core.dart';

part 'anilist_auth_event.dart';
part 'anilist_auth_state.dart';

class AnilistAuthBloc extends Bloc<AnilistAuthEvent, AnilistAuthState> {
  static const tokenKey = 'user_preferences_anilistAccessToken';
  static const boxName = 'anilist_auth';

  final Anilist repository;

  bool get isConnected => state.runtimeType == AnilistAuthSuccess;

  AnilistAuthBloc(this.repository) : super(AnilistAuthLoggedOut()) {
    on<AnilistAuthEvent>((event, emit) {
      logger.v('AnilistAuth event: ${event.runtimeType}');
    });

    on<AnilistAuthLoginRequested>(_login);
    on<AnilistAuthLogoutRequested>(_logout);
  }

  Future<void> _login(
      AnilistAuthLoginRequested event, Emitter<AnilistAuthState> emit) async {
    try {
      final me = await repository.getMe();

      emit(AnilistAuthSuccess(me));
    } on AnilistNotConnectedException catch (e) {
      emit(AnilistAuthError(e.cause));
    } catch (e) {
      emit(AnilistAuthError(e.toString()));
    }
  }

  Future<void> _logout(
      AnilistAuthLogoutRequested event, Emitter<AnilistAuthState> emit) async {
    final box = await Hive.openBox(boxName);
    box.delete(tokenKey);

    emit(AnilistAuthLoggedOut());
  }
}
