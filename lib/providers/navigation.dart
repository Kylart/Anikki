import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Navigation with ChangeNotifier, DiagnosticableTreeMixin {
  int _selectedIndex = 0;
  late PageController pageController;

  Navigation() {
    pageController = PageController(initialPage: _selectedIndex);
  }

  int get index => _selectedIndex;

  set index(value) {
    _selectedIndex = value;
    notifyListeners();
  }

  changeToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    /// This helps keep the page controller on the same page
    /// when changing layouts.
    pageController = PageController(initialPage: index);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('_selectedIndex', _selectedIndex));
    properties.add(
        DiagnosticsProperty<PageController>('pageController', pageController));
  }
}
