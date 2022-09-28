import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/core/constants/constants.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// [ShippingOptions] widget handles the selection of a specific
/// shipping strategy.
///
/// The widget provides a radio button list item for each strategy
/// in the `shippingOptions` list of [StrategyExample].
/// After selecting a specific shipping strategy, the `onChanged()`
/// method is triggered and the selected index is passed to the
/// parent widget [StrategyExample].
///
/// This implementation allows us to change the specific shipping
/// costs calculation strategy at run-time.
class ShippingOptions extends StatelessWidget {
  final List<IShippingCostsStrategy> shippingOptions;
  final int selectedIndex;
  final ValueChanged<int?> onChanged;

  const ShippingOptions({
    super.key,
    required this.shippingOptions,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Constants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select shipping type:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            for (var i = 0; i < shippingOptions.length; i++)
              RadioListTile<int>(
                title: Text(shippingOptions[i].label),
                value: i,
                groupValue: selectedIndex,
                onChanged: onChanged,
                dense: true,
                activeColor: Colors.black,
              )
          ],
        ),
      ),
    );
  }
}
