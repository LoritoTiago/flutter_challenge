import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorMaterial {
  NavigatorMaterial();
  static void navigatorNormal(BuildContext context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void navigatorRemoveUntil(BuildContext context, page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
