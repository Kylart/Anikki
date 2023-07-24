import 'dart:convert';

import 'package:crypto/crypto.dart';

String getId({required String name}) {
  return sha1
      .convert(utf8.encode(name))
      .toString()
      .replaceAll(RegExp(r'\d+'), '');
}
