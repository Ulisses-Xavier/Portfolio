import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/translation/features_texts/side_bar_texts.dart';

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const MenuItem({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(100),
            child: Image.asset(
              imagePath,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}

class LanguageButton extends ConsumerStatefulWidget {
  final bool isPortable;
  const LanguageButton({super.key, required this.isPortable});

  @override
  ConsumerState<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends ConsumerState<LanguageButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final lang = ref.watch(language);
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.white.withAlpha(10),
        highlightColor: const Color.fromRGBO(25, 25, 25, 1),
      ),
      child: PopupMenuButton<String>(
        color: ColorTheme(isDarkMode: true).primaryColor,
        offset: const Offset(50, 0),
        onSelected: (value) {
          ref.read(language.notifier).set(value);
        },
        tooltip: "",
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "pt",
            child: MenuItem(
              imagePath: "assets/flags/portuguese.png",
              title: SideBarTexts.portuguese.get(lang),
            ),
          ),
          PopupMenuItem(
            value: "en",
            child: MenuItem(
              imagePath: "assets/flags/english.png",
              title: SideBarTexts.english.get(lang),
            ),
          ),
        ],
        child: MouseRegion(
          onEnter: (event) => setState(() {
            isHover = true;
          }),
          onExit: (event) => setState(() {
            isHover = false;
          }),
          child: Stack(
            children: [
              Container(
                height: widget.isPortable ? 45 : 50,
                width: widget.isPortable ? 45 : 50,
                decoration: BoxDecoration(
                  color: isHover
                      ? Colors.white.withAlpha(10)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    PhosphorIcons.translate(),
                    size: widget.isPortable ? 25 : 30,
                    color: colors.tertiaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: widget.isPortable ? 35 : 40,
                width: widget.isPortable ? 45 : 50,
                child: Align(
                  alignment: AlignmentGeometry.topRight,
                  child: Container(
                    height: widget.isPortable ? 15 : 17,
                    width: widget.isPortable ? 15 : 17,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.tertiaryColor,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/flags/${lang == "pt" ? "portuguese" : "english"}.png",
                          height: widget.isPortable ? 13 : 15,
                          width: widget.isPortable ? 13 : 15,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
