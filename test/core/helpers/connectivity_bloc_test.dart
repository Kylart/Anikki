import 'package:anikki/core/core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('unit test: Connectivity bloc', () {
    blocTest(
      'emits [ConnectivityOnline] when [ConnectivityEvent(true)] is added',
      build: () => ConnectivityBloc(),
      act: (bloc) => bloc.add(
        const ConnectivityEvent(true),
      ),
      expect: () => [
        ConnectivityOnline(),
      ],
    );

    blocTest(
      'emits [ConnectivityOffline] when [ConnectivityEvent(false)] is added',
      build: () => ConnectivityBloc(),
      act: (bloc) => bloc.add(
        const ConnectivityEvent(false),
      ),
      expect: () => [
        ConnectivityOffline(),
      ],
    );
  });
}
