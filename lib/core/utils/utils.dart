import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? buttonColor;
  final Color? splashColor;
  final double buttonSize;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final bool isSelected;
  final Color? iconColorWhenSelected;
  const MyIconButton({
    super.key,
    required this.icon,
    this.iconColor,
    required this.isSelected,
    this.iconColorWhenSelected,
    this.iconSize,
    this.buttonColor,
    this.splashColor,
    required this.buttonSize,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        hoverColor: Colors.white.withAlpha(10),
        onTap: onTap,
        child: Ink(
          height: buttonSize,
          width: buttonSize,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Center(
            child: Icon(
              icon,
              size: iconSize ?? 10,
              color: isSelected
                  ? (iconColorWhenSelected ?? Colors.white)
                  : (iconColor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final double height;
  final double? width;
  final Color color;
  final Color? splashColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final double? spaceBetween;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isLoading,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.icon,
    required this.height,
    this.width,
    required this.color,
    this.borderRadius,
    this.border,
    this.splashColor,
    this.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor ?? Colors.white.withAlpha(10),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: ColorTheme(isDarkMode: true).green,
                  ),
                ),
              if (!isLoading)
                Text(
                  text,
                  style:
                      textStyle ?? TextStyle(color: Colors.white, fontSize: 12),
                ),
              if (icon != null) SizedBox(width: spaceBetween ?? 4),
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize ?? 10,
                  color: iconColor ?? Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringSplit on String {
  String get firstLetter {
    if (isEmpty) return '';
    return this[0];
  }

  String get remaining {
    if (length <= 1) return '';
    return substring(1);
  }
}

class EmailValidator {
  static bool validate(String email) {
    if (email.trim().isEmpty) return false;

    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$',
    );

    return regex.hasMatch(email.trim());
  }
}

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch $url");
  }
}
