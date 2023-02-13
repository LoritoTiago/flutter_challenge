import 'package:flutter/material.dart';

import '../../../../core/presentation/text_base.dart';
import '../../data/model/home_item_model.dart';

class Item extends StatelessWidget {
  final HomeItemModel item;

  const Item({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.function(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10.0,
              spreadRadius: 1,
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.icon,
            const SizedBox(height: 10),
            TextBase(text: item.title),
          ],
        ),
      ),
    );
  }
}
