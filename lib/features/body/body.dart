import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/providers/theme_provider.dart';

class Body extends ConsumerWidget {
  final Widget page;
  final bool? withPadding;
  final bool isPortable;
  const Body({
    super.key,
    required this.page,
    this.withPadding,
    required this.isPortable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: withPadding != null && !withPadding! ? 0 : 30,
      ),
      child: Container(
        height: isPortable ? null : 750,
        decoration: BoxDecoration(
          color: ColorTheme(isDarkMode: isDark).primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(child: page),
        ),
      ),
    );
  }
}
