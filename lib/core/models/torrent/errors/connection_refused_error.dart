import 'package:http/http.dart';

class ConnectionRefusedError implements ClientException {
  const ConnectionRefusedError();

  @override
  String get message => 'Cannot find Transmission Client.';

  @override
  Uri? get uri => throw UnimplementedError();
}
