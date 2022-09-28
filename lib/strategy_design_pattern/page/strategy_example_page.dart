import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/core/core.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// [StrategyExample] implements the example widget of the Strategy design pattern.
///
/// It contains a list of different shipping
/// strategies [shippingCostsStrategyList] and provides it to
/// the ShippingOptions widget where the index of a specific
/// strategy is selected by triggering the
/// `setSelectedStrategyIndex()` method. Then, the selected
/// strategy is injected into the [OrderSummery] widget where the
/// final price of the order is calculated.

class StrategyExample extends StatefulWidget {
  const StrategyExample({Key? key}) : super(key: key);

  @override
  State<StrategyExample> createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy()
  ];
  @protected
  int selectedStrategyIndex = 0;
  @protected
  Order order = Order();

  void _addToOrder() {
    setState(() {
      order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      order = Order();
    });
  }

  void _setSelectedStrategyIndex(int? index) {
    setState(() {
      selectedStrategyIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OrderButtons(
                onAdd: _addToOrder,
                onClear: _clearOrder,
              ),
              const SizedBox(
                height: Constants.spaceM,
              ),
              Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    opacity: order.items.isEmpty ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OrderItemsTable(orderItems: order.items),
                        const SizedBox(
                          height: Constants.spaceM,
                        ),
                        // handle the selection of a specific
                        // shipping strategy
                        ShippingOptions(
                            selectedIndex: selectedStrategyIndex,
                            shippingOptions: _shippingCostsStrategyList,
                            onChanged: _setSelectedStrategyIndex),
                        OrderSummery(
                            shippingCostsStrategy: _shippingCostsStrategyList[
                                selectedStrategyIndex],
                            order: order),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
