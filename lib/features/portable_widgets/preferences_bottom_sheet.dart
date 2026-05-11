import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/core/utils/utils.dart';

class PreferencesBottomSheet extends ConsumerWidget {
  const PreferencesBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    return Container(
      height: 160,
      width: double.infinity,
      color: colors.primaryColor,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(
                  icon: isDark ? PhosphorIcons.sun() : PhosphorIcons.moon(),
                  isSelected: false,
                  buttonSize: 45,
                  iconSize: 25,
                  iconColor: isDark ? Colors.white : colors.background,
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    ref.read(isDarkMode.notifier).switchTheme();
                  },
                ),
                SizedBox(height: 10),
                Text(
                  LocalText(
                    pt: isDark
                        ? "Habilitar modo claro?"
                        : "Habilitar modo escuro?",
                    en: isDark ? "Enable light mode?" : "Enable dark mode?",
                  ).get(lang),
                  style: TextStyle(
                    color: colors.tertiaryColor,
                    fontFamily: Fonts.tertiary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
