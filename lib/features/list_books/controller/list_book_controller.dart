import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/injections/get_it.dart';
import 'package:flutter_challenge/core/services/services.dart';
import 'package:flutter_challenge/features/list_books/model/book_model.dart';
import 'package:flutter_challenge/features/list_books/model/category_model.dart';

class ListBookController {
  final int itemSize = 300;
  late ScrollController listController;
  List<BookModel> books = getIt<BlocServices>().books;
  List<CategoryModel> categories = getIt<BlocServices>().categories;

  double getScale(int index) {
    double scale = getPercent(index);
    if (scale > 1.0) scale = 1.0;
    return scale.clamp(0.5, 1.5);
  }

  double getPercent(int index) {
    final offset = index * itemSize;
    final diference = listController.offset - offset;
    final percent = 1 - (diference / (itemSize / 2));
    return percent;
  }

  double getOpacity(int index) {
    final percent = getPercent(index);
    double opacity = percent;
    if (opacity > 1.0) opacity = 1.0;
    if (opacity < 0.0) opacity = 0.0;
    return opacity;
  }

  void getBooks(int index) {
    var current = categories[index];

    books = getIt<BlocServices>()
        .books
        .where((element) => element.idCategory == current.id)
        .toList();
  }
}
