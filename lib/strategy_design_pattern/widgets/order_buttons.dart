import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

class OrderButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onClear;

  const OrderButtons({
    super.key,
    required this.onAdd,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        OrderButton(
          iconData: Icons.add,
          title: 'Add random item',
          onPressed: onAdd,
        ),
        OrderButton(
          iconData: Icons.clear,
          title: 'Clear',
          onPressed: onClear,
        ),
      ],
    );
  }
}
