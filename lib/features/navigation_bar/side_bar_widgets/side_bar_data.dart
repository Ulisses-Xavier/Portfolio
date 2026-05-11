import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/translation/local_text.dart';
import 'package:portfolio/core/translation/features_texts/side_bar_texts.dart';
import 'package:portfolio/core/utils/utils.dart';

class SideBarButton extends ConsumerWidget {
  final IconData icon;
  final LocalText? title;
  final VoidCallback? onTap;
  final String? route;
  const SideBarButton({
    super.key,
    required this.icon,
    this.title,
    this.onTap,
    this.route,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouter.of(context).state.path.toString();
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final isSelected = route != null && path.contains(route!);
    final lang = ref.watch(language);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        //
        //BUTTON
        MyIconButton(
          icon: icon,
          buttonSize: 50,
          isSelected: isSelected,
          iconColorWhenSelected: colors.highlight,
          onTap: () {
            if (route != null) {
              context.go(route!);
            } else if (onTap != null) {
              onTap!();
            }
          },
          iconColor: colors.tertiaryColor,
          buttonColor: Colors.transparent,
          iconSize: 30,
          borderRadius: BorderRadius.circular(100),
        ),
        //
        //
        //TITLE
        if (title != null)
          Text(
            title!.get(lang),
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? colors.highlight : colors.tertiaryColor,
            ),
          ),
      ],
    );
  }
}

class SideBarData {
  final String route;
  SideBarData({required this.route});

  List<SideBarButton> get sectionsButtons => [
    SideBarButton(
      icon: PhosphorIcons.user(),
      title: SideBarTexts.about,
      route: "/about",
    ),
    SideBarButton(
      icon: PhosphorIcons.readCvLogo(),
      title: SideBarTexts.resume,
      route: "/resume",
    ),
    SideBarButton(
      icon: PhosphorIcons.codeSimple(),
      title: SideBarTexts.works,
      route: "/works",
    ),
    SideBarButton(
      icon: PhosphorIcons.paperPlaneTilt(),
      title: SideBarTexts.contact,
      route: "/contact",
    ),
  ];
}
