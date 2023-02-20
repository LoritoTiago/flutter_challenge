import 'package:flutter/material.dart';

class NavigatorAnimation {
  NavigatorAnimation();

  static void normal(BuildContext context, page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 270),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  static void remove(BuildContext context, page) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page(),
          transitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
        (route) => false);
  }
}
