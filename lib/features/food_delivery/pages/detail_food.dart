import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/injections/get_it.dart';
import '../../../core/presentation/text_base.dart';
import '../../../core/services/services.dart';
import '../model/drink_model.dart';
import '../model/food_model.dart';
import '../model/sauces_model.dart';
import '../widgets/image_hero.dart';

class DetailFood extends StatefulWidget {
  final FoodModel food;
  const DetailFood({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> with TickerProviderStateMixin {
  List<int> selectedSauce = [];
  int beerSelected = 0;
  double total = 0.0;
  double begin = 0.0;
  double priceDrinkCliked = 0.0;

  int clikedItemSauce = 0;
  int clikedItemDrink = 0;

  int adapterDrinkIndex = 0;

  late AnimationController _animationSauceController;
  late AnimationController _animationDrinkController;
  late AnimationController _animationPriceController;

  late Animation<double> _animationSauce;
  late Animation<double> _animationDrink;

  @override
  void initState() {
    super.initState();
    total = widget.food.price;

    //* Set animation Sauce
    _animationSauceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationSauce = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
          parent: _animationSauceController,
          curve: Curves.decelerate,
          reverseCurve: Curves.decelerate)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationSauceController.reset();
          }
        }),
    );

    //* Set animation Drink
    _animationDrinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationDrink = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
          parent: _animationDrinkController,
          curve: Curves.decelerate,
          reverseCurve: Curves.decelerate)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationDrinkController.reset();
          }
        }),
    );

    //* Set animation price

    _animationPriceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationPriceController.reset();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageHero(imageUrl: widget.food.imageUrl),
          const SizedBox(height: 30),
          const TextBase(
            text: "Sauces",
            cor: Colors.grey,
            size: 20.0,
          ),
          const SizedBox(height: 10),
          _rowSauce(),
          const SizedBox(height: 30),
          const TextBase(
            text: "Drinks",
            cor: Colors.grey,
            size: 20.0,
          ),
          const SizedBox(height: 10),
          _rowDrink(),
          const Spacer(),
          _rowBottom(),
        ],
      ),
    );
  }

  Widget _rowBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedBuilder(
          animation: _animationPriceController,
          builder: (_, child) {
            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 800),
              builder: (context, double value, child) {
                return _animationInWidget(
                  duration: 500,
                  delay: 300,
                  child: TextBase(
                    text: "\$${value.toStringAsFixed(1)}",
                    cor: widget.food.color,
                    size: 35.0,
                  ),
                );
              },
              tween: Tween<double>(begin: begin, end: total),
            );
          },
        ),
        _animationInWidget(
          duration: 500,
          delay: 100,
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 40,
            color: widget.food.color,
            child: const TextBase(
              text: "Pay",
              cor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowSauce() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(getIt<BlocServices>().sacues.length, (index) {
          final sauce = getIt<BlocServices>().sacues[index];
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (selectedSauce.contains(index)) {
                selectedSauce.remove(index);

                begin = total;
                total = total - sauce.price!;
              } else {
                selectedSauce.add(index);
                begin = total;
                total = total + sauce.price!;
              }
              _animationPriceController.forward();
              setState(() {
                clikedItemSauce = index;
                _animationSauceController.forward();
              });
            },
            child: _animationInWidget(
              duration: 500,
              delay: (150 * (index / 1)),
              child: circleContainer(
                sauce,
                selectedSauce.contains(index),
                index,
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _rowDrink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(getIt<BlocServices>().sacues.length, (index) {
          final drink = getIt<BlocServices>().drinks[index];
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                beerSelected = index + 1;
                clikedItemDrink = index + 1;

                //* set begin and end price animation
                begin = total - priceDrinkCliked;
                total = (total - priceDrinkCliked) + drink.price!;
                priceDrinkCliked = drink.price!;
                _animationPriceController.forward();
                //* set begin and end price animation

                _animationDrinkController.forward();
              });
            },
            child: _animationInWidget(
              duration: 500,
              delay: (150 * index.toDouble()),
              child: retangleContainer(drink, beerSelected == index + 1, index),
            ),
          );
        })
      ],
    );
  }

  Widget _animationInWidget({Widget? child, int? duration, double? delay}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: duration!),
      curve: Curves.decelerate,
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(0.0, value * delay!), child: child!);
      },
    );
  }

  Widget circleContainer(SaucesModel sauce, bool selected, index) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationSauceController,
          builder: (context, childMain) {
            log("Build");
            double scale =
                index == clikedItemSauce ? _animationSauce.value : 1.0;

            return Transform.scale(
              scale: scale,
              child: childMain,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  selected ? widget.food.color : Colors.white,
                  selected ? widget.food.color.withOpacity(.5) : Colors.white
                ],
              ),
              color: selected ? widget.food.color : Colors.white,
            ),
            child: Image.asset(
              "assets/${sauce.imageUrl}",
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextBase(
          text: sauce.name,
          cor: Colors.white,
          size: 14.0,
        ),
        TextBase(
          text: "\$${sauce.price}",
          cor: widget.food.color,
          size: 14.0,
        ),
      ],
    );
  }

  Widget retangleContainer(DrinkModel drink, bool selected, int index) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationDrinkController,
          builder: (context, childMain) {
            return Transform.scale(
              scale: index + 1 == clikedItemDrink ? _animationDrink.value : 1.0,
              child: childMain,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: selected ? widget.food.color : Colors.white,
              gradient: LinearGradient(
                colors: [
                  selected ? widget.food.color : Colors.white,
                  selected ? widget.food.color.withOpacity(.5) : Colors.white
                ],
              ),
            ),
            child: Image.asset(
              "assets/${drink.imageUrl}",
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextBase(
          text: drink.name,
          cor: Colors.white,
          size: 14.0,
        ),
        TextBase(
          text: "\$${drink.price}",
          cor: widget.food.color,
          size: 14.0,
        ),
      ],
    );
  }
}
