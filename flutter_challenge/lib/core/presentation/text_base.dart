import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextBase extends StatelessWidget {
  final String text;
  final Color? cor;
  final FontWeight? font;
  final double? size;
  const TextBase({Key? key, this.size, this.cor, this.font, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 20.0,
          color: cor ?? Colors.black,
          fontWeight: font ?? FontWeight.normal),
    );
  }
}
