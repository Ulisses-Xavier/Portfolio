import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/utils/utils.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isDarkMode;
  final double? bottomPadding;
  const SectionTitle({
    super.key,
    required this.title,
    required this.isDarkMode,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        //
        //
        //
        //TITLE
        SizedBox(
          height: 25,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorTheme(
                        isDarkMode: isDarkMode,
                      ).highlight.withAlpha(20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title.firstLetter,
                      style: TextStyle(
                        color: ColorTheme(isDarkMode: isDarkMode).highlight,
                        fontSize: 20,
                        fontFamily: Fonts.secondary,
                      ),
                    ),
                    Text(
                      title.remaining,
                      style: TextStyle(
                        color: ColorTheme(isDarkMode: isDarkMode).tertiaryColor,
                        fontSize: 20,
                        fontFamily: Fonts.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //
        //
        //
        //DIVISOR
        Padding(
          padding: EdgeInsets.only(bottom: bottomPadding ?? 17, top: 17),
          child: Container(
            height: 0.1,
            width: double.infinity,
            color: ColorTheme(isDarkMode: isDarkMode).tertiaryColor,
          ),
        ),
      ],
    );
  }
}
