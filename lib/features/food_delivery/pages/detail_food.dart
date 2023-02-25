import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/features/food_delivery/model/food_model.dart';
import 'dart:math' as math;

import 'package:flutter_challenge/features/food_delivery/pages/food_delivery.dart';

class DetailFood extends StatefulWidget {
  final FoodModel food;
  const DetailFood({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: widget.food.imageUrl,
            child: Center(
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0.0, end: 6 * math.pi),
                curve: Curves.decelerate,
                builder: (_, double value, child) {
                  return _image(value: value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image({double? value}) {
    return Transform.rotate(
      angle: value!,
      child: SizedBox(
        height: 220,
        child: Image.asset("assets/${widget.food.imageUrl}"),
      ),
    );
  }
}
