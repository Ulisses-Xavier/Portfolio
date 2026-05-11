import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';

class IconBadge extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final double iconSize;
  final double size;
  final bool isDark;
  final Color? iconColor;
  const IconBadge({
    super.key,
    this.image,
    this.icon,
    required this.size,
    required this.isDark,
    required this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorTheme(isDarkMode: isDark).highlight),
      ),
      child: Center(
        child: image != null
            ? Image.asset(image!, height: iconSize, width: iconSize)
            : Icon(icon, color: iconColor ?? Colors.white, size: iconSize),
      ),
    );
  }
}
