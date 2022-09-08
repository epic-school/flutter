import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navKey = GlobalKey<NavigatorState>();

class ThemeState with ChangeNotifier {
  final SharedPreferences storage;

  var _theme = ThemeMode.light;

  ThemeState(this.storage) {
    _theme = _getTheme();
  }

  ThemeMode get theme => _theme;

  bool get isDark => _theme == ThemeMode.dark;

  ThemeMode _getTheme() {
    final cache = storage.getString('theme') ?? '';

    if (cache.isEmpty || cache == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void setLightTheme() {
    _change(ThemeMode.light);
  }

  void setDarkTheme() {
    _change(ThemeMode.dark);
  }

  void _change(ThemeMode value) {
    _theme = value;
    storage.setString('theme', _theme.name);
    notifyListeners();
  }
}
