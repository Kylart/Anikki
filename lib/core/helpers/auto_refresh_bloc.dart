import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AutoRefreshBloc<Event, State> extends Bloc<Event, State> {
  AutoRefreshBloc(super.initialState);

  FutureOr<void> autoRefresh();

  void setUpAutoRefresh([Duration? intervalTime]) {
    if (intervalTime != null) this.intervalTime = intervalTime;

    interval = Timer.periodic(this.intervalTime, (timer) async {
      if (isClosed) {
        interval?.cancel();
        interval = null;
      }

      await autoRefresh();
    });
  }

  Timer? interval;
  Duration intervalTime = const Duration(minutes: 5);
}
