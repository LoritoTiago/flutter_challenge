import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/food_delivery/widgets/circle.dart';

class CustomAppBarFoodDelivery extends StatelessWidget {
  const CustomAppBarFoodDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: Image.asset(
                  "assets/paula.png",
                  fit: BoxFit.fill,
                ).image,
              ),
              const TextBase(
                text: "Discover",
                cor: Colors.white,
                font: FontWeight.bold,
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
              )
            ],
          ),

          //! End app bar

          const SizedBox(height: 20),
          Row(
            children: const [
              TextBase(
                text: "Food",
                cor: Colors.white,
                size: 35.0,
                letterSpacer: 15.0,
                font: FontWeight.w700,
              ),
              SizedBox(width: 10),
              Circle(
                size: 7,
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 10),
              Circle(
                size: 7,
              ),
              TextBase(
                text: "Delivery",
                cor: Colors.white,
                size: 35.0,
                letterSpacer: 15.0,
                font: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
