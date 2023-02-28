import 'package:flutter/material.dart';

enum UserListLayouts {
  grid,
  list,
}

class UserListLayoutStore extends ChangeNotifier {
  UserListLayouts _layout = UserListLayouts.grid;

  UserListLayouts get layout => _layout;

  set layout(UserListLayouts value) {
    _layout = value;
    notifyListeners();
  }
}
