import 'package:flutter/material.dart';

class ColorThemeProvider extends ChangeNotifier {
  MaterialColor _color;
  MaterialColor get color => _color;
  ColorThemeProvider() {
    _color = Colors.pink;
  }
  void changeColor({MaterialColor color = Colors.yellow}) {
    _color = color;
    notifyListeners();
  }
}
