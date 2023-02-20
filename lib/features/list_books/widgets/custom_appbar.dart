import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';

class CustomAppBar {
  const CustomAppBar();

  static AppBar get appBar {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextBase(
            text: "Browser",
            size: 30,
            font: FontWeight.w900,
          ),
          const SizedBox(width: 10.0),
          TextBase(
            text: "Recommend",
            size: 15,
            cor: Colors.grey,
            font: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
