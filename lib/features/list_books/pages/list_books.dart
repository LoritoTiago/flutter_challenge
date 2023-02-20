import 'dart:developer' as logMensage;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/navidator/navigator_animation.dart';
import 'package:flutter_challenge/features/list_books/pages/detail.dart';

import '../controller/list_book_controller.dart';
import '../model/book_model.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/description_widget.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> with TickerProviderStateMixin {
  late ListBookController _controller;
  late AnimationController _animationController;

  late Tween<double> tween;
  double anle = 0;
  bool canShow = true;

  late Animation<double> animation;

  late Size size;

  timerShow() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        canShow = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 270),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.decelerate));
    _controller = ListBookController();
    _controller.listController = ScrollController();
    _controller.listController.addListener(_listenListController);

    _animationController.addListener(() {
      setState(() {
        anle = animation.value;
        // logMensage.log(_animationController.value.toString());
      });
    });

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        }
      },
    );
  }

  void _listenListController() {
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();

    _controller.listController.removeListener(_listenListController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBar,
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 30,
            child: _categoriesList(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
      controller: _controller.listController,
      itemCount: _controller.books.length,
      itemBuilder: (_, index) {
        double scale = _controller.getScale(index);

        return Opacity(
          opacity: _controller.getOpacity(index),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX((pi * scale) + 3.2),
            child: _itemListe(
              _controller.books[index],
            ),
          ),
        );
      },
    );
  }

  Widget _itemListe(BookModel book) {
    return GestureDetector(
      onTap: () {
        NavigatorAnimation.normal(
          context,
          Detail(book: book),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          width: double.infinity,
          height: _controller.itemSize.toDouble(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0,
                width: size.width * 0.5,
                height: size.height * 0.35,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: Hero(
                    key: ValueKey(book.imageUrl),
                    tag: book.imageUrl,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.network(book.imageUrl).image,
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
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
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                width: size.width * 0.5,
                height: size.height * 0.26,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * anle),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: const Offset(2.0, 5.0),
                        ),
                      ],
                    ),
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        child: canShow
                            ? DescriptionWidget(book: book)
                            : const SizedBox()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriesList() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return CategoryItem(
          category: _controller.categories[index],
          function: () {
            _animationController.forward();

            setState(() {
              _controller.getBooks(index);

              canShow = false;
              timerShow();
              _controller.categories.forEach((element) {
                element.selected = false;
              });
              _controller.categories[index].selected = true;
            });
          },
        );
      },
      itemCount: _controller.categories.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
