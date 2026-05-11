import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/shared/section_title.dart';
import 'package:portfolio/shared/work_grid/work_card/work_card.dart';
import 'package:portfolio/shared/work_grid/work_card/work_card_model.dart';

class WorkGrid extends ConsumerStatefulWidget {
  final LocalText title;
  final List<WorkCardModel> cards;
  const WorkGrid({super.key, required this.cards, required this.title});

  @override
  ConsumerState<WorkGrid> createState() => _WorkGridState();
}

class _WorkGridState extends ConsumerState<WorkGrid> {
  List<List<WorkCardModel>> distributeCards(int columnsCount) {
    final columns = List.generate(columnsCount, (_) => <WorkCardModel>[]);

    for (var i = 0; i < widget.cards.length; i++) {
      columns[i % columnsCount].add(widget.cards[i]);
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(language);
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    return Column(
      children: [
        SectionTitle(title: widget.title.get(lang), isDarkMode: isDark),
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 20.0;

            final maxWidth = constraints.maxWidth;

            final columnsCount = maxWidth < 700 ? 1 : (maxWidth > 1024 ? 3 : 2);

            final columns = distributeCards(columnsCount);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(columnsCount, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < columnsCount ? spacing : 0,
                    ),
                    child: Column(
                      children: columns[index].map((card) {
                        return WorkCard(
                          model: card,
                          colors: colors,
                          lang: lang,
                        );
                      }).toList(),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
