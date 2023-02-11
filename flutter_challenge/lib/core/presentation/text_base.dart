import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextBase extends StatelessWidget {
  final String text;
  final Color? cor;
  final FontWeight? font;
  const TextBase({Key? key, this.cor, this.font, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: cor ?? Colors.black, fontWeight: font ?? FontWeight.normal),
    );
  }
}
