import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
