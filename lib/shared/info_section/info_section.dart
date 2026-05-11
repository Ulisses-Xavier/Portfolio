import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/shared/info_field/info_field.dart';
import 'package:portfolio/shared/info_section/info_section_model.dart';
import 'package:portfolio/shared/section_title.dart';

class InfoSection extends StatelessWidget {
  final InfoSectionModel info;
  final String lang;
  final bool isDarkMode;
  const InfoSection({
    super.key,
    required this.info,
    required this.lang,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: info.title.get(lang), isDarkMode: isDarkMode),
        Text(
          info.header.get(lang),
          style: TextStyle(
            color: ColorTheme(isDarkMode: isDarkMode).tertiaryColor,
            fontSize: 14,
            fontFamily: Fonts.tertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),
        Text(
          info.description.get(lang),
          style: TextStyle(
            color: ColorTheme(isDarkMode: isDarkMode).tertiaryColor,
            fontSize: 12,
            fontFamily: Fonts.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 24),
        if (info.infoFields != null)
          SizedBox(
            width: 420,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 8,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: info.infoFields?.length,
              itemBuilder: (context, index) {
                final model = info.infoFields![index];
                return InfoField(info: model);
              },
            ),
          ),
      ],
    );
  }
}
