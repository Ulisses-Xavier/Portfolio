import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/content/sections_data/about_data/about_me_data.dart';
import 'package:portfolio/content/sections_data/about_data/services_data.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/shared/card_grid/card_grid.dart';
import 'package:portfolio/shared/info_section/info_section.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(language);
    final isDark = ref.watch(isDarkMode);
    return Column(
      children: [
        InfoSection(info: aboutMeData, lang: lang, isDarkMode: isDark),
        SizedBox(height: 50),
        CardGrid(model: servicesData),
      ],
    );
  }
}
