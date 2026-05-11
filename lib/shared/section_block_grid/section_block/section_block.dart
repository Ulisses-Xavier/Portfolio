import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/shared/icon_badge.dart';
import 'package:portfolio/shared/section_block_grid/section_block/section_block_model.dart';

class SectionBlock extends StatelessWidget {
  final SectionBlockModel model;
  final bool isDark;
  final String lang;
  const SectionBlock({
    super.key,
    required this.isDark,
    required this.model,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColorTheme(isDarkMode: isDark);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: colors.tertiaryColor, width: 0.1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                IconBadge(
                  size: 50,
                  isDark: isDark,
                  iconSize: 25,
                  icon: model.icon,
                  iconColor: colors.green,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title.get(lang),
                      style: TextStyle(
                        color: colors.tertiaryColor,
                        fontFamily: Fonts.secondary,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      model.description.get(lang),
                      style: TextStyle(
                        color: colors.tertiaryColor,
                        fontFamily: Fonts.secondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        model.block,
      ],
    );
  }
}
