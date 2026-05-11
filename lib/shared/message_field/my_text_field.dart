import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final IconData icon;
  final double iconWidth;
  final double iconSize;
  final bool isExpanded;
  final String hint;
  final ColorTheme colors;
  final int? maxLength;
  final String? counterText;
  const MyTextField({
    super.key,
    required this.height,
    required this.icon,
    required this.iconSize,
    this.counterText,
    required this.hint,
    required this.colors,
    required this.iconWidth,
    required this.isExpanded,
    required this.controller,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: iconWidth,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 0.1, color: colors.tertiaryColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: isExpanded ? 15 : 0),
            child: Align(
              alignment: isExpanded ? Alignment.topCenter : Alignment.center,
              child: Icon(
                icon,
                size: iconSize,
                color: colors.tertiaryColor.withAlpha(100),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 0.1, color: colors.tertiaryColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: isExpanded ? 10 : 0,
                    ),
                    child: TextField(
                      maxLength: maxLength,

                      maxLines: isExpanded ? null : 1,
                      style: TextStyle(
                        color: colors.tertiaryColor,
                        fontFamily: Fonts.secondary,
                      ),
                      expands: isExpanded,
                      cursorColor: colors.green,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                        counterText: counterText,
                        hintStyle: TextStyle(
                          color: colors.tertiaryColor.withAlpha(100),
                          fontFamily: Fonts.secondary,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
