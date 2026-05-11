import 'package:flutter/material.dart';

class ColorTheme {
  final bool isDarkMode;
  ColorTheme({required this.isDarkMode});

  Color get background => Color.fromARGB(255, 29, 36, 41);

  Color get primaryColor =>
      isDarkMode ? Color.fromARGB(255, 40, 47, 52) : Colors.white;

  Color get secondaryColor =>
      isDarkMode ? Color.fromARGB(255, 46, 53, 58) : Colors.black;

  Color get tertiaryColor =>
      isDarkMode ? const Color.fromARGB(255, 190, 190, 190) : Colors.black;

  Color get highlight => Color.fromARGB(255, 253, 167, 0);

  Color get green => Color.fromARGB(255, 115, 163, 69);
}
