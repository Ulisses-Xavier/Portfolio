import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/core/fonts.dart';
import 'package:portfolio/core/providers/language_provider.dart';
import 'package:portfolio/core/translation/features_texts/profile_texts.dart';
import 'package:portfolio/features/profile_bar/profile_bar_widgets/cv_download_button.dart';
import 'package:portfolio/features/profile_bar/profile_bar_widgets/online_dot.dart';
import 'package:portfolio/content/profile_data/models.dart';
import 'package:portfolio/content/profile_data/profile_data.dart';
import 'package:portfolio/core/providers/theme_provider.dart';
import 'package:portfolio/core/utils/utils.dart';

class ProfileBar extends ConsumerStatefulWidget {
  const ProfileBar({super.key});

  @override
  ConsumerState<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends ConsumerState<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkMode);
    final colors = ColorTheme(isDarkMode: isDark);
    final lang = ref.watch(language);
    final ProfileData profileData = data;

    return Container(
      height: double.infinity,
      width: 400,
      decoration: BoxDecoration(
        color: colors.primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 25, 31, 36),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          //
          //
          //
          //BANNER IMAGE
          FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 1,
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(100, 25, 31, 36),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.asset(profileData.bannerPath, fit: BoxFit.cover),
              ),
            ),
          ),
          //
          //
          //
          //PROFILE IMAGE & INFO
          Column(
            children: [
              Expanded(flex: 1, child: SizedBox(width: 100)),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: colors.highlight,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/profile_images/profile.jpg",
                            fit: BoxFit.cover,
                            height: 126,
                            width: 126,
                          ),
                        ),
                      ),
                    ),
                    //
                    //ONLINE DOT
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: OnlineDot(),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        //
                        //
                        //
                        //
                        //INFO
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              profileData.name,
                              style: TextStyle(
                                color: colors.tertiaryColor,
                                fontSize: 24,
                                fontFamily: Fonts.primary,
                              ),
                            ),

                            Text(
                              profileData.subTitle.get(lang),
                              style: TextStyle(
                                color: colors.tertiaryColor,
                                fontSize: 11,
                                fontFamily: Fonts.secondary,
                              ),
                            ),

                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 100,
                              ),
                              child: Wrap(
                                children: profileData.socialMedias.map((
                                  button,
                                ) {
                                  return MyIconButton(
                                    icon: button.icon,
                                    buttonSize: 40,
                                    onTap: () => openUrl(button.url),
                                    iconColor: colors.tertiaryColor,
                                    iconSize: 14,
                                    isSelected: false,
                                    borderRadius: BorderRadius.circular(100),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        //
                        //
                        //
                        //
                        //BUTTONS
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CvDownloadButton(
                                colors: colors,
                                lang: lang,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: MyButton(
                                isLoading: false,
                                onTap: () {
                                  context.go("/contact");
                                },
                                text: ProfileTexts.contact.get(lang),
                                textStyle: TextStyle(
                                  color: colors.tertiaryColor,
                                ),
                                height: 60,
                                icon: Icons.call,
                                iconColor: colors.tertiaryColor,
                                iconSize: 15,
                                border: Border.all(
                                  color: colors.secondaryColor,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                ),
                                color: colors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
