import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/features/navigation_bar/side_bar_widgets/language_button.dart';
import 'package:portfolio/features/navigation_bar/side_bar_widgets/side_bar_data.dart';
import 'package:portfolio/core/providers/theme_provider.dart';

class MyNavigationBar extends ConsumerStatefulWidget {
  final bool isPortable;
  const MyNavigationBar({super.key, required this.isPortable});

  @override
  ConsumerState<MyNavigationBar> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkMode);
    final toggleTheme = ref.read(isDarkMode.notifier);
    final route = GoRouter.of(context).state.uri.path.toString();
    final buttons = SideBarData(route: route);

    if (widget.isPortable) {
      return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: ColorTheme(isDarkMode: isDark).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              itemCount: buttons.sectionsButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final button = buttons.sectionsButtons[index];
                final underline = index != buttons.sectionsButtons.length - 1;

                return Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border(
                      right: underline
                          ? BorderSide(
                              color: ColorTheme(
                                isDarkMode: true,
                              ).secondaryColor,
                            )
                          : BorderSide.none,
                    ),
                  ),
                  child: Center(child: button),
                );
              },
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: ColorTheme(isDarkMode: isDark).primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 25, 31, 36),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              //
              //
              //LANGUAGE BUTTON\\
              Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorTheme(isDarkMode: true).secondaryColor,
                    ),
                  ),
                ),
                child: Center(child: LanguageButton(isPortable: false)),
              ),
              //
              //
              //COLOR THEME BUTTON\\
              SizedBox(
                height: 90,
                width: 100,
                child: Center(
                  child: SideBarButton(
                    icon: isDark ? PhosphorIcons.sun() : PhosphorIcons.moon(),
                    onTap: () {
                      toggleTheme.switchTheme();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        //
        //
        SizedBox(height: 20),
        //
        //
        //SECTIONS
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: ColorTheme(isDarkMode: isDark).primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 25, 31, 36),
                spreadRadius: 4,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              ListView.builder(
                itemCount: buttons.sectionsButtons.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final button = buttons.sectionsButtons[index];
                  final underline = index != buttons.sectionsButtons.length - 1;

                  return Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: underline
                            ? BorderSide(
                                color: ColorTheme(
                                  isDarkMode: true,
                                ).secondaryColor,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Center(child: button),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
