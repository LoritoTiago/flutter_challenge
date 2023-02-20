import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/list_books/model/book_model.dart';

class DescriptionWidget extends StatelessWidget {
  final BookModel book;
  const DescriptionWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _description();
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBase(
            text: book.title,
            size: 20,
            font: FontWeight.bold,
          ),
          const SizedBox(height: 10.0),
          TextBase(
            cor: Colors.grey,
            text: book.author,
            size: 16,
            font: FontWeight.w500,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              ...List.generate(
                book.star > 5 ? 5 : book.star,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
              ),
              const SizedBox(width: 5),
              TextBase(
                text: book.star.toDouble().toString(),
                size: 12,
                cor: Colors.yellow,
                font: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              TextBase(
                text: book.view.toString(),
                size: 12,
                cor: Colors.blue,
                font: FontWeight.bold,
              ),
              const SizedBox(width: 5.0),
              TextBase(
                text: "Views",
                size: 12,
                cor: Colors.grey,
                font: FontWeight.w400,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
