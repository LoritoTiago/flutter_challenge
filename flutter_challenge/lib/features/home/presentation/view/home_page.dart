import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/core/navidator/navigator_cupertino.dart';
import 'package:flutter_challenge/features/audio_players/presentation/view/audio_play.dart';
import 'package:flutter_challenge/features/home/data/model/home_item_model.dart';

import 'package:flutter_challenge/features/home/presentation/widgets/item.dart';

import '../../../../core/injections/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Item> data = [];
  @override
  Widget build(BuildContext context) {
    _setData(context);
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        padding: const EdgeInsets.all(15.0),
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return data[index];
        }),
      ),
    );
  }

  void _setData(BuildContext context) {
    data = [
      Item(
        item: HomeItemModel(
          title: "Audio Play",
          icon: const Icon(Icons.audiotrack_outlined),
          function: () {
            NavigatorCupertino.navigatorNormal(
              context,
              AudioPlay(),
            );
          },
        ),
      ),
    ];
  }
}
