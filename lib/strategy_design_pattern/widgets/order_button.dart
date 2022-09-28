import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/core/constants/constants.dart';

class OrderButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  const OrderButton({
    super.key,
    required this.iconData,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
        ),
        const SizedBox(width: Constants.spaceM),
        Text(title),
      ],
    );
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: kIsWeb || Platform.isAndroid
            ? MaterialButton(
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                onPressed: onPressed,
                child: child,
              )
            : CupertinoButton(
                color: Colors.black, onPressed: onPressed, child: child));
  }
}
