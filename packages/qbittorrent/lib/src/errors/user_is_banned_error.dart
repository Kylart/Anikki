import 'dart:io';

class UserIsBannedError implements HttpException {
  const UserIsBannedError();

  @override
  String get message => 'User is banned';

  @override
  Uri? get uri => throw UnimplementedError();
}
