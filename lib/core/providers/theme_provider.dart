import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/preferences/preferences_service.dart';

class ThemeProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void switchTheme() {
    state = !state;
    PreferencesService.setIsDarkMode(!state);
  }
}

final isDarkMode = NotifierProvider<ThemeProvider, bool>(() {
  return ThemeProvider();
});
