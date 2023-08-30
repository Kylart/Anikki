import 'package:anikki/core/helpers/logger.dart';
import 'package:bloc/bloc.dart';

/// {@template counter_observer}
/// [BlocObserver] for the counter application which
/// observes all state changes.
/// {@endtemplate}
class Observer extends BlocObserver {
  /// {@macro counter_observer}
  const Observer();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    logger.i('${bloc.runtimeType} $change');
  }
}
