import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/skills_graphic/animated_graphic_bar.dart';

class SkillsGraphic extends ConsumerWidget {
  final List<AnimatedGraphicBar> bars;
  const SkillsGraphic({super.key, required this.bars});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    return Padding(
      padding: const EdgeInsets.only(right: 150),
      child: ListView.builder(
        itemCount: bars.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final bar = bars[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bar.title,
                  style: TextStyle(
                    color: colors.tertiaryColor,
                    fontFamily: Fonts.tertiary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                bar,
              ],
            ),
          );
        },
      ),
    );
  }
}
