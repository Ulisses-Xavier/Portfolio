import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/section_block_grid/section_block/blocks/experiences/experience_model.dart';

class ExperienceList extends ConsumerWidget {
  final List<ExperienceModel> experiences;
  const ExperienceList({super.key, required this.experiences});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10, top: index == 0 ? 0 : 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: colors.tertiaryColor,
                              width: 0.1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              exp.time.get(lang),
                              style: TextStyle(
                                color: colors.tertiaryColor,
                                fontFamily: Fonts.primary,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          exp.position.get(lang),
                          style: TextStyle(
                            color: colors.tertiaryColor,
                            fontFamily: Fonts.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          exp.organization,
                          style: TextStyle(
                            color: colors.tertiaryColor.withAlpha(120),
                            fontFamily: Fonts.secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          exp.description.get(lang),
                          style: TextStyle(
                            color: colors.tertiaryColor,
                            fontFamily: Fonts.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (exp.image != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        exp.image!,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              if (index + 1 != experiences.length)
                Container(
                  height: 0.1,
                  width: double.infinity,
                  color: ColorTheme(isDarkMode: isDark).tertiaryColor,
                ),
            ],
          ),
        );
      },
    );
  }
}
