import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/preferences/preferences_service.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/router/router.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = router;
    return MaterialApp.router(
      routerConfig: routes,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorTheme(isDarkMode: true).green,
          selectionHandleColor: ColorTheme(isDarkMode: true).green,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
