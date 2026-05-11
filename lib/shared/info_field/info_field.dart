import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/info_field/info_field_model.dart';

class InfoField extends ConsumerStatefulWidget {
  final InfoFieldModel info;
  const InfoField({super.key, required this.info});

  @override
  ConsumerState<InfoField> createState() => _InfoFieldState();
}

class _InfoFieldState extends ConsumerState<InfoField> {
  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(language);
    final isDark = ref.watch(isDarkMode);
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: ColorTheme(isDarkMode: isDark).tertiaryColor,
              ),
            ),
            child: Center(
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme(isDarkMode: isDark).tertiaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 7),
          Text(
            "${widget.info.label.get(lang)}: ",
            style: TextStyle(
              color: ColorTheme(isDarkMode: isDark).tertiaryColor,
              fontFamily: Fonts.secondary,
              fontSize: 11,
            ),
          ),
          Text(
            widget.info.value.get(lang),
            style: TextStyle(
              color: ColorTheme(
                isDarkMode: isDark,
              ).tertiaryColor.withAlpha(100),
              fontFamily: Fonts.secondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
