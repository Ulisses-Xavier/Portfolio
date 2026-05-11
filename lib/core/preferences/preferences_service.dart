import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _prefs;

  /// Inicializa o serviço (chamar no main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ========================
  // THEME
  // ========================

  static const _themeKey = 'is_dark_mode';

  static bool getIsDarkMode() {
    return _prefs.getBool(_themeKey) ?? true;
  }

  static Future<void> setIsDarkMode(bool value) async {
    await _prefs.setBool(_themeKey, value);
  }

  // ========================
  // LANGUAGE
  // ========================

  static const _languageKey = 'app_language';

  static String getLanguage() {
    return _prefs.getString(_languageKey) ?? 'pt';
  }

  static Future<void> setLanguage(String lang) async {
    await _prefs.setString(_languageKey, lang);
  }
}
