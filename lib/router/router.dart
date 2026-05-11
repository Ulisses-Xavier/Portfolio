import 'package:go_router/go_router.dart';
import 'package:portfolio/features/body/sections/about_page.dart';
import 'package:portfolio/features/body/sections/contact_page.dart';
import 'package:portfolio/features/body/sections/resume_page.dart';
import 'package:portfolio/features/body/sections/works_page.dart';
import 'package:portfolio/features/main_layout.dart';
import 'package:portfolio/router/transition_animation.dart';

final router = GoRouter(
  initialLocation: '/about',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) =>
              fadeUpTransition(state: state, child: AboutPage()),
        ),
        GoRoute(
          path: '/resume',
          pageBuilder: (context, state) =>
              fadeUpTransition(state: state, child: ResumePage()),
        ),
        GoRoute(
          path: '/works',
          pageBuilder: (context, state) =>
              fadeUpTransition(state: state, child: WorksPage()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              fadeUpTransition(state: state, child: ContactPage()),
        ),
      ],
    ),
  ],
);
