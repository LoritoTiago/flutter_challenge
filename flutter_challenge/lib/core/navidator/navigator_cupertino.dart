import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorCupertino {
  NavigatorCupertino();
  static void navigatorNormal(BuildContext context, page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  static void navigatorRemoveUntil(BuildContext context, page) {
    Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => page), (route) => false);
  }
}
