import 'dart:io';

class UnauthorizedError implements HttpException {
  const UnauthorizedError();

  @override
  String get message => 'Unauthorized';

  @override
  Uri? get uri => throw UnimplementedError();
}
