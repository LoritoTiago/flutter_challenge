import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageBackground extends StatelessWidget {
  final String imageUrl;
  const ImageBackground({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Container(
        key: UniqueKey(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(imageUrl).image,
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            color: Colors.black.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}
