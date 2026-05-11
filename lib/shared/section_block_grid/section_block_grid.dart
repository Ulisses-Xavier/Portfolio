import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/section_block_grid/section_block/section_block.dart';
import 'package:portfolio/shared/section_block_grid/section_block_grid_model.dart';
import 'package:portfolio/shared/section_title.dart';

class SectionBlockGrid extends ConsumerWidget {
  final SectionBlockGridModel model;
  const SectionBlockGrid({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final lang = ref.watch(language);
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 0.0;

        final itemWidth = constraints.maxWidth < 700
            ? constraints.maxWidth
            : (constraints.maxWidth - spacing) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: model.title.get(lang),
              isDarkMode: isDark,
              bottomPadding: 0,
            ),

            Wrap(
              spacing: spacing,
              runSpacing: spacing,

              children: model.sections.map((block) {
                return SizedBox(
                  width: itemWidth,
                  child: SectionBlock(isDark: isDark, model: block, lang: lang),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
