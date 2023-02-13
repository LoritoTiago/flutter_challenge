import 'dart:ui';

import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final String imageUrl;
  const ImageBackground({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Container(
        key: ValueKey(imageUrl),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/img/$imageUrl").image,
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
