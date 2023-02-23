import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/food_delivery/pages/food_delivery.dart';
import 'package:flutter_challenge/features/list_books/pages/list_books.dart';

import '../../../../core/navidator/navigator_cupertino.dart';
import '../../../sond_player/page/player_screen.dart';
import '../../data/model/home_item_model.dart';
import '../widgets/item.dart';

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
          title: "Sond Play",
          icon: const Icon(Icons.audiotrack_outlined),
          function: () {
            NavigatorCupertino.navigatorNormal(
              context,
              PlayierScreen(),
            );
          },
        ),
      ),
      Item(
        item: HomeItemModel(
          title: "List Books",
          icon: const Icon(Icons.menu_book_sharp),
          function: () {
            NavigatorCupertino.navigatorNormal(
              context,
              const ListBooks(),
            );
          },
        ),
      ),
      Item(
        item: HomeItemModel(
          title: "Food Delivery",
          icon: const Icon(Icons.food_bank_outlined),
          function: () {
            NavigatorCupertino.navigatorNormal(
              context,
              const FoodDelivery(),
            );
          },
        ),
      ),
    ];
  }
}
