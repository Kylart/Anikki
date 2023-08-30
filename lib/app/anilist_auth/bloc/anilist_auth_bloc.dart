import 'package:anikki/data/data.dart';
import 'package:anikki/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'package:anikki/core/core.dart';

part 'anilist_auth_event.dart';
part 'anilist_auth_state.dart';

class AnilistAuthBloc extends Bloc<AnilistAuthEvent, AnilistAuthState> {
  final UserRepository repository;

  bool get isConnected => state.runtimeType == AnilistAuthSuccess;

  AnilistAuthBloc(this.repository) : super(AnilistAuthLoggedOut()) {
    on<AnilistAuthEvent>((event, emit) {
      logger.t('AnilistAuth event: ${event.runtimeType}');
    });

    on<AnilistAuthLoginRequested>(_login);
    on<AnilistAuthLogoutRequested>(_logout);
  }

  Future<void> _login(
      AnilistAuthLoginRequested event, Emitter<AnilistAuthState> emit) async {
    try {
      final me = await repository.getCurrentUser();

      emit(AnilistAuthSuccess(me));
    } on AnilistNotConnectedException catch (e) {
      emit(AnilistAuthError(e.cause));
    } catch (e) {
      emit(AnilistAuthError(e.toString()));
    }
  }

  Future<void> _logout(
      AnilistAuthLogoutRequested event, Emitter<AnilistAuthState> emit) async {
    final box = await Hive.openBox(UserRepository.boxName);
    box.delete(UserRepository.tokenKey);

    emit(AnilistAuthLoggedOut());
  }
}
