import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription<List<ConnectivityResult>>? subscription;

  bool get isOnline => state is ConnectivityOnline;

  ConnectivityBloc() : super(ConnectivityUnknown()) {
    on<ConnectivityEvent>((event, emit) {
      emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.any(
        (result) => [
          ConnectivityResult.wifi,
          ConnectivityResult.ethernet,
          ConnectivityResult.mobile,
          ConnectivityResult.vpn,
          ConnectivityResult.other,
        ].contains(result),
      )) {
        add(const ConnectivityEvent(true));
      } else if (results.length == 1 &&
          results.first == ConnectivityResult.none) {
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
