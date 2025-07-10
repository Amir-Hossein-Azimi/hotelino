//for change theme provider between light and dark
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  ThemeProvider(this._brightness);

  Brightness get brightness => _brightness;

  void updateBrightness(Brightness brightness) {
    _brightness = brightness;
    _updateSystemUI();
    notifyListeners();
  }

  void toggleTheme() {
    _brightness = (_brightness == Brightness.dark) ? Brightness.light : Brightness.dark;
    _updateSystemUI();
    notifyListeners();
  }

  void _updateSystemUI() {
    bool isdark = _brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isdark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isdark ? Colors.black :Colors.white,
      systemNavigationBarIconBrightness: isdark ? Brightness.light : Brightness.dark
    ));
  }


}