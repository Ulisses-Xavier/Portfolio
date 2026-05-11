import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/card_grid/card_grid_model.dart';
import 'package:portfolio/shared/icon_badge.dart';
import 'package:portfolio/shared/section_title.dart';

class CardGrid extends ConsumerWidget {
  final CardGridModel model;
  const CardGrid({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    return Column(
      children: [
        SectionTitle(title: model.title.get(lang), isDarkMode: isDark),
        LayoutBuilder(
          builder: (context, constraints) {
            final double spacing = 10;

            final maxWidth = constraints.maxWidth;

            final isPortable = maxWidth <= 700;

            final itemWidth = constraints.maxWidth <= 1024
                ? constraints.maxWidth
                : (constraints.maxWidth - spacing) / 3;

            if (isPortable) {
              return Wrap(
                children: model.cards.map((card) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: itemWidth,
                      height: itemWidth,
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.secondaryColor),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(),
                              IconBadge(
                                size: 70,
                                isDark: isDark,
                                iconSize: 25,
                                image: card.image,
                                icon: card.icon,
                              ),
                              SizedBox(height: 10),
                              Text(
                                card.title.get(lang),
                                style: TextStyle(
                                  color: colors.tertiaryColor,
                                  fontFamily: Fonts.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                card.description.get(lang),
                                style: TextStyle(
                                  color: colors.tertiaryColor,
                                  fontFamily: Fonts.primary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              itemCount: model.cards.length,
              itemBuilder: (context, index) {
                final card = model.cards[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.secondaryColor),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(),
                          IconBadge(
                            size: 70,
                            isDark: isDark,
                            iconSize: 25,
                            image: card.image,
                            icon: card.icon,
                          ),
                          SizedBox(height: 10),
                          Text(
                            card.title.get(lang),
                            style: TextStyle(
                              color: colors.tertiaryColor,
                              fontFamily: Fonts.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            card.description.get(lang),
                            style: TextStyle(
                              color: colors.tertiaryColor,
                              fontFamily: Fonts.primary,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
