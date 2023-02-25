import 'package:flutter/material.dart';

class FoodModel {
  final String title;
  final String subTitle;
  final String imageUrl;
  final UserModel user;
  final DateTime dataCad;
  final double price;
  final Color color;
  final bool isFavorite;

  FoodModel(
      {required this.color,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isFavorite,
      required this.user,
      required this.dataCad,
      required this.imageUrl});
}

class UserModel {
  final String name;

  final String imageUrl;

  UserModel({required this.name, required this.imageUrl});
}
