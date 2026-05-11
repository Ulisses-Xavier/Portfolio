import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/content/profile_data/models.dart';
import 'package:portfolio/content/profile_data/profile_data.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/features/portable_widgets/preferences_bottom_sheet.dart';
import 'package:portfolio/features/navigation_bar/side_bar_widgets/language_button.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final ProfileData profileData = data;
    final lang = ref.watch(language);
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(color: colors.primaryColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //
                  //PROFILE IMAGE
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/profile_images/profile.jpg",
                          fit: BoxFit.cover,
                          height: 68,
                          width: 68,
                        ),
                      ),
                    ),
                  ),
                  //
                  //
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileData.name,
                        style: TextStyle(
                          color: colors.tertiaryColor,
                          fontFamily: Fonts.primary,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        profileData.subTitle.get(lang),
                        style: TextStyle(
                          color: colors.tertiaryColor,
                          fontSize: 13,
                          fontFamily: Fonts.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //
              //
              //BUTTON
              Row(
                children: [
                  LanguageButton(isPortable: true),
                  SizedBox(width: 5),
                  MyIconButton(
                    icon: PhosphorIcons.list(),
                    isSelected: false,
                    buttonSize: 45,
                    iconSize: 25,
                    iconColor: colors.tertiaryColor,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return PreferencesBottomSheet();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
