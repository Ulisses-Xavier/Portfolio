import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<void> fadeUpTransition({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,

    transitionDuration: const Duration(milliseconds: 400),

    reverseTransitionDuration: const Duration(milliseconds: 120),

    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slide = Tween<Offset>(
        begin: const Offset(0, 0.03),
        end: Offset.zero,
      ).animate(animation);

      final fadeIn = CurvedAnimation(parent: animation, curve: Curves.easeOut);

      final fadeOut = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeOut),
      );

      return FadeTransition(
        opacity: fadeOut,
        child: FadeTransition(
          opacity: fadeIn,
          child: SlideTransition(position: slide, child: child),
        ),
      );
    },
  );
}
