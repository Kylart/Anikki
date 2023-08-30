import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:anikki/core/helpers/logger.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription<ConnectivityResult>? subscription;

  bool get isOnline => state is ConnectivityOnline;

  ConnectivityBloc() : super(ConnectivityUnknown()) {
    on<ConnectivityEvent>((event, emit) {
      logger.t('Connectivity event: $event');

      emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
        case ConnectivityResult.vpn:
        case ConnectivityResult.other:
          add(const ConnectivityEvent(true));
          break;
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.none:
          add(const ConnectivityEvent(false));
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
