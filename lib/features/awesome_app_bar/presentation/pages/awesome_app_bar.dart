import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';

class AwesomeAppBar extends StatefulWidget {
  const AwesomeAppBar({Key? key}) : super(key: key);

  @override
  State<AwesomeAppBar> createState() => _AwesomeAppBarState();
}

class _AwesomeAppBarState extends State<AwesomeAppBar> {
  int _currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
        alignment: Alignment.center,
        child: CupertinoSlidingSegmentedControl<int>(
          thumbColor: Colors.red,
          groupValue: _currentItemIndex,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          children: {
            0: _itemAppBar(i: 0, text: "Home"),
            1: _itemAppBar(i: 1, text: "Profile"),
            2: _itemAppBar(i: 2, text: "Menu"),
          },
          onValueChanged: (v) {
            setState(() {
              _currentItemIndex = v!;
            });
          },
        ));
  }

  Widget _itemAppBar({int? i, String? text}) {
    return TextBase(
      size: 14.0,
      text: text,
    );
  }
}
