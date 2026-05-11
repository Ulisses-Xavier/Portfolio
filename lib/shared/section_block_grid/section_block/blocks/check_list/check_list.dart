import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/theme_provider.dart';

class CheckList extends ConsumerWidget {
  final List<String> items;
  const CheckList({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Icon(PhosphorIcons.check(), color: colors.green, size: 16),
              SizedBox(width: 4),
              Text(
                item,
                style: TextStyle(
                  color: colors.tertiaryColor,
                  fontFamily: Fonts.secondary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
