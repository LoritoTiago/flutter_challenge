import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedTextBase extends StatelessWidget {
  final String? text;
  final Color? cor;
  final bool center;
  final FontWeight? font;
  final double? size;
  final bool justify;
  final double? letterSpacer;
  final Duration? duration;
  const AnimatedTextBase(
      {Key? key,
      required this.duration,
      this.letterSpacer,
      this.justify = false,
      this.center = false,
      this.size,
      this.cor,
      this.font,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: duration!,
      style: TextStyle(
        letterSpacing: letterSpacer,
        fontSize: size ?? 20.0,
        color: cor ?? Colors.black,
        fontWeight: font ?? FontWeight.normal,
      ),
      child: Text(
        text ?? "",
        textAlign: center
            ? TextAlign.center
            : justify
                ? TextAlign.justify
                : TextAlign.start,
      ),
    );
  }
}
