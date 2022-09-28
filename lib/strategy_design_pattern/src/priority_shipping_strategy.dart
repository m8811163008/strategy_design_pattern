import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
