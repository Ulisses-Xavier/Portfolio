import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/preferences/preferences_service.dart';

class LanguageNotifier extends Notifier<String> {
  @override
  String build() {
    return PreferencesService.getLanguage();
  }

  void set(String language) {
    state = language;
    PreferencesService.setLanguage(language);
  }
}

final language = NotifierProvider<LanguageNotifier, String>(() {
  return LanguageNotifier();
});
