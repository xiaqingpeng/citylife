import 'package:flutter/material.dart';

class ThemeColor with ChangeNotifier {
  Color theme = Colors.pink;
  changeTheme(theme) {
    theme = theme;
    notifyListeners();
  }
}
