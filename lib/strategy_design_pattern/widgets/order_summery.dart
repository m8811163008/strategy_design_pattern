import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/core/constants/constants.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// [OrderSummery] widget uses the injected shipping strategy of
/// type [IShippingCostsStrategy] for the final order's pirce
/// calculation.
///
/// The widget only cares about the type of the shipping strategy,
/// but not its specific implementation.
class OrderSummery extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummery({
    super.key,
    required this.order,
    required this.shippingCostsStrategy,
  });

  double get shippingPrice => shippingCostsStrategy.calculate(order);

  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Constants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order summary',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            OrderSummaryRow(
                fontFamily: 'Roboto', label: 'Subtotal', value: order.price),
            const SizedBox(
              height: Constants.spaceM,
            ),
            OrderSummaryRow(
                fontFamily: 'Roboto', label: 'Shipping', value: shippingPrice),
            const Divider(),
            OrderSummaryRow(
                fontFamily: 'RobotoMedium', label: 'Order total', value: total),
          ],
        ),
      ),
    );
  }
}
