import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/contact_info/contact_info_model.dart';
import 'package:portfolio/shared/section_title.dart';

class ContactInfo extends ConsumerWidget {
  final ContactInfoModel model;
  const ContactInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SectionTitle(title: model.title.get(lang), isDarkMode: isDark),
        Text(
          model.description.get(lang),
          style: TextStyle(
            color: colors.tertiaryColor,
            fontSize: 12,
            fontFamily: Fonts.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(model.children.length, (index) {
            final item = model.children[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(item.icon, size: 13, color: colors.green),
                  SizedBox(width: 6),
                  Text(
                    item.text,
                    style: TextStyle(
                      color: colors.tertiaryColor,
                      fontSize: 10,
                      fontFamily: Fonts.tertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
