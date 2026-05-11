import 'package:flutter/material.dart';
import 'package:portfolio/core/color_theme.dart';
import 'package:portfolio/features/body/body.dart';
import 'package:portfolio/features/portable_widgets/header.dart';
import 'package:portfolio/features/profile_bar/profile_bar.dart';
import 'package:portfolio/features/navigation_bar/my_navigation_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme(isDarkMode: true).background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          final isPortable = maxWidth <= 1024;

          if (isPortable) {
            return Column(
              children: [
                Header(),
                Container(
                  height: 0.3,
                  width: double.infinity,
                  color: ColorTheme(isDarkMode: true).tertiaryColor,
                ),
                MyNavigationBar(isPortable: true),
                Container(
                  height: 0.3,
                  width: double.infinity,
                  color: ColorTheme(isDarkMode: true).tertiaryColor,
                ),
                Expanded(
                  child: Body(
                    page: child,
                    withPadding: false,
                    isPortable: true,
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 50,
                  ),
                  child: Row(
                    children: [
                      MyNavigationBar(isPortable: false),
                      SizedBox(width: 20),
                      ProfileBar(),
                      Expanded(child: Body(page: child, isPortable: false)),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
