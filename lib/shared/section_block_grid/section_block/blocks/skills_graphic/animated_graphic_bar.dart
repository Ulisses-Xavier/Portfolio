import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/providers/theme_provider.dart';

class AnimatedGraphicBar extends ConsumerStatefulWidget {
  final String title;
  final double percentage;
  const AnimatedGraphicBar({
    super.key,
    required this.percentage,
    required this.title,
  });

  @override
  ConsumerState<AnimatedGraphicBar> createState() => _AnimatedGraphicBarState();
}

class _AnimatedGraphicBarState extends ConsumerState<AnimatedGraphicBar> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkMode);

    return Stack(
      children: [
        Container(height: 6, width: double.infinity, color: Colors.white),
        LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            final targetWidth = maxWidth * (widget.percentage / 100);

            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: targetWidth),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder: (context, width, child) {
                return SizedBox(width: width, height: 6, child: child);
              },
              child: ColoredBox(
                color: ColorTheme(isDarkMode: isDark).highlight,
              ),
            );
          },
        ),
      ],
    );
  }
}
