import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/list_books/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Function function;
  const CategoryItem({Key? key, required this.category, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _categoriesItem();
  }

  Widget _categoriesItem() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: category.selected
                ? Colors.blueAccent
                : Colors.grey.withOpacity(.2),
          ),
          child: Center(
            child: TextBase(
              cor: category.selected ? Colors.white : Colors.black,
              text: category.title,
              font: category.selected ? FontWeight.bold : FontWeight.w400,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }
}
