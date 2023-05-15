import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void initHive() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
    return 'test/resources/others';
  });

  Hive.initFlutter();
}
