import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

class ImageHero extends StatelessWidget {
  final String imageUrl;
  const ImageHero({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 0.0, end: 6 * math.pi),
          curve: Curves.decelerate,
          builder: (_, double value, child) {
            return _image(value: value);
          },
        ),
      ),
    );
  }

  Widget _image({double? value}) {
    return Transform.rotate(
      angle: value!,
      child: SizedBox(
        height: 200,
        child: Image.asset("assets/$imageUrl"),
      ),
    );
  }
}
