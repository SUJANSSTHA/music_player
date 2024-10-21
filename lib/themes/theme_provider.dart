import 'package:flutter/material.dart'; 
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //! Initially, light mode
  ThemeData _themeData = lightMode;

  //! Get theme
  ThemeData get themeData => _themeData;

  //! Is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //! set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    // update UI 
    notifyListeners();  // Notify UI to rebuild with new theme

  }

  //! Switch theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
     notifyListeners(); 
  }
}
 