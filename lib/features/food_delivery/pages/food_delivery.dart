import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/navidator/navigator_animation.dart';
import 'package:flutter_challenge/core/presentation/animated_text_base.dart';
import 'package:flutter_challenge/core/presentation/icon_buttom.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/food_delivery/model/food_model.dart';
import 'package:flutter_challenge/features/food_delivery/pages/detail_food.dart';
import 'package:flutter_challenge/features/food_delivery/widgets/circle.dart';
import 'package:flutter_challenge/features/food_delivery/widgets/custom_app_bar_food_delivery.dart';

import '../../../core/injections/get_it.dart';
import '../../../core/services/services.dart';
import '../../sond_player/model/audio_model.dart';

class FoodDelivery extends StatefulWidget {
  const FoodDelivery({Key? key}) : super(key: key);

  @override
  State<FoodDelivery> createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _pageController;
  double pageOffset = 0.0;
  double viewPortFraction = .8;

  late Size size;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.decelerate,
          reverseCurve: Curves.elasticOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        }
      });

    _pageController = PageController(viewportFraction: viewPortFraction);

    _pageController.addListener(_listenPage);
  }

  _listenPage() {
    setState(() {
      pageOffset = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenPage);
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarFoodDelivery(),
            const SizedBox(height: 20),
            _psgeView(),
          ],
        ),
      ),
    );
  }

  Widget _psgeView() {
    var service = getIt<BlocServices>();

    return Expanded(
      child: PageView.builder(
        itemCount: service.foods.length,
        controller: _pageController,
        padEnds: false,
        onPageChanged: (int v) {
          setState(() {
            currentIndex = v;
            _animationController.forward();
          });
        },
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              return _itemPageView(index);
            },
          );
        },
      ),
    );
  }

  Widget _itemPageView(int index) {
    final item = getIt<BlocServices>().foods[index];

    double scale = math.max(
      viewPortFraction,
      (1 - (pageOffset - index).abs()) + viewPortFraction,
    );

    double bottom = 240 / scale;

    bool isCurrent = true;
    if (bottom >= 200.0) isCurrent = false;
    // double opacity = isCurrent ? 1.0 : 0.0;
    return GestureDetector(
      onTap: () {
        NavigatorAnimation.normal(
          context,
          DetailFood(food: item),
        );
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: bottom / scale),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        child: Container(
          width: double.infinity,
          key: ValueKey(item.title),
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 10,
                spreadRadius: 5,
                // offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                left: 12,
                right: 12,
                child: _columnDetail(item, isCurrent),
              ),
              Positioned(left: 12, bottom: 12, child: _priceItem(item.price)),
              Positioned(
                  bottom: 40,
                  left: 32,
                  right: 12,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 590),
                    child: isCurrent
                        ? Hero(
                            tag: item.imageUrl,
                            child: AnimatedImage(
                                animation: _animation, imageUrl: item.imageUrl),
                          )
                        : const SizedBox.shrink(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnDetail(FoodModel item, bool isCurrent) {
    var toDay = DateTime.now();
    var difference = toDay.difference(item.dataCad).inMinutes;
    return Column(
      key: ValueKey(item.title),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: Image.asset(
              "assets/${item.user.imageUrl}",
              fit: BoxFit.fill,
            ).image,
          ),
          title: TextBase(
            text: item.user.name,
            cor: Colors.white,
            font: FontWeight.w600,
          ),
          subtitle: TextBase(
            text: "$difference minut",
            cor: Colors.white,
            font: FontWeight.w300,
            size: 14,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(right: 90.0),
          height: 1.0,
          color: Colors.white.withOpacity(.3),
        ),
        SizedBox(height: isCurrent ? 30 : 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AnimatedTextBase(
                duration: const Duration(milliseconds: 250),
                text: item.title,
                cor: Colors.white,
                font: FontWeight.w900,
                size: isCurrent ? 30 : 15.0,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ],
        ),
        AnimatedTextBase(
          duration: const Duration(milliseconds: 250),
          text: item.subTitle,
          cor: Colors.white,
          font: FontWeight.w500,
          size: isCurrent ? 25 : 10.0,
        ),
        SizedBox(height: isCurrent ? 20.0 : 10.0),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isCurrent
              ? CustomIconButtom(
                  isCurrent: true,
                  text: "Add cart",
                  icon: Icons.add,
                  function: () {},
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }

  Widget _priceItem(String price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextBase(
        text: "\$$price",
        cor: Colors.black,
        font: FontWeight.w500,
        size: 15,
      ),
    );
  }
}

class AnimatedImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Animation<double> animation;
  const AnimatedImage(
      {Key? key,
      this.size = 200.0,
      required this.animation,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: SizedBox(height: size, child: Image.asset("assets/$imageUrl")),
        );
      },
    );
  }
}
