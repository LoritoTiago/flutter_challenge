import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/injections/get_it.dart';
import 'package:flutter_challenge/core/services/services.dart';
import 'package:flutter_challenge/features/sond_player/model/audio_model.dart';

class FoodDelivery extends StatefulWidget {
  const FoodDelivery({Key? key}) : super(key: key);

  @override
  State<FoodDelivery> createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery> {
  int currentIndex = 0;
  late PageController _pageController;
  double page = 0.0;
  double itemSize = 150.0;
  late Size size;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: .8);

    _pageController.addListener(_listenPage);
  }

  _listenPage() {
    setState(() {
      page = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenPage);
    super.dispose();
  }

  AudioModel get current => getIt<BlocServices>().audios[currentIndex];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _psgeView(),
        ],
      ),
    );
  }

  Widget _psgeView() {
    var service = getIt<BlocServices>();

    return Expanded(
      child: PageView.builder(
        itemCount: service.audios.length,
        controller: _pageController,
        padEnds: false,
        onPageChanged: (int v) {
          setState(() {
            currentIndex = v;
          });
        },
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              bool active = currentIndex == index;

              double bottom = active ? 100 : 350;
              return AnimatedContainer(
                margin: EdgeInsets.only(bottom: bottom),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuint,
                child: Container(
                  width: double.infinity,
                  key: ValueKey(current.title),
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
