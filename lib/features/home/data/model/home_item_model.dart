import 'package:flutter/material.dart';

class HomeItemModel {
  final String title;
  final Icon icon;
  final Function function;

  HomeItemModel(
      {required this.icon, required this.title, required this.function});
}
