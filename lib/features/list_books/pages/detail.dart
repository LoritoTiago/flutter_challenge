import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/list_books/model/book_model.dart';
import 'package:flutter_challenge/features/list_books/widgets/item_detail_menu.dart';

class Detail extends StatelessWidget {
  final BookModel book;
  Detail({Key? key, required this.book}) : super(key: key);

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(),
      body: Column(
        children: [
          _rowTitle(),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: _columnDescription(),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 40,
                color: Colors.blue,
                child: TextBase(
                  text: "Read now",
                  cor: Colors.white,
                ),
              ),
              builder: (context, value, child) {
                return Transform.translate(
                    offset: Offset(0.0, value * 100), child: child!);
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  Widget _rowTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _image(),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBase(
                text: book.title,
                size: 20,
                font: FontWeight.bold,
              ),
              const SizedBox(height: 20.0),
              TextBase(
                cor: Colors.grey,
                text: book.author,
                size: 16,
                font: FontWeight.w500,
              ),
              const SizedBox(height: 40.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Hero(
      tag: book.imageUrl,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(book.imageUrl).image,
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _columnDescription() {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _rowMenu(),
            const SizedBox(height: 40),
            TextBase(
              text: "About the book",
              font: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            TextBase(
              justify: true,
              text: book.description,
              size: 14,
              cor: Colors.grey,
            ),
          ],
        ),
        builder: (context, value, child) {
          return Transform.translate(
              offset: Offset(0.0, value * 100), child: child!);
        });
  }

  Widget _rowMenu() {
    return Row(
      children: const [
        ItemMenuDetial(icon: Icons.chat_outlined, title: "Save reviwes"),
        SizedBox(width: 20),
        ItemMenuDetial(icon: Icons.favorite_border, title: "Like"),
        SizedBox(width: 20),
        ItemMenuDetial(icon: Icons.share, title: "Share"),
      ],
    );
  }
}
