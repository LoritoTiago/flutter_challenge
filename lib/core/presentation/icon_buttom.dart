import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';

class CustomIconButtom extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function? function;
  final bool isCurrent;

  const CustomIconButtom(
      {Key? key,
      this.isCurrent = false,
      this.text = "",
      this.icon,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function,
      child: AnimatedContainer(
          height: isCurrent ? 30.0 : 20.0,
          width: isCurrent ? 120.0 : 100.0,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 10,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isCurrent ? 15 : 10,
                height: isCurrent ? 15 : 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(
                  icon,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              TextBase(
                center: true,
                text: text,
                size: isCurrent ? 12 : 8.0,
              ),
            ],
          )),
    );
  }
}
