import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';

class ItemMenuDetial extends StatelessWidget {
  final String title;
  final IconData icon;
  const ItemMenuDetial({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 15,
        ),
        const SizedBox(width: 10),
        TextBase(
          text: title,
          cor: Colors.grey,
          size: 14,
        )
      ],
    );
  }
}
