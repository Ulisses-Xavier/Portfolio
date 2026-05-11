import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/core/color_theme.dart';

class OnlineDot extends StatefulWidget {
  const OnlineDot({super.key});

  @override
  State<OnlineDot> createState() => _OnlineDotState();
}

class _OnlineDotState extends State<OnlineDot>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorTheme(isDarkMode: true).highlight.withAlpha(100),
        ),
        child: Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: ColorTheme(isDarkMode: true).highlight,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
