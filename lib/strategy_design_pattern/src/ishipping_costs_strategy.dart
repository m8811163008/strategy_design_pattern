import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// An interface that defines methods and properties to be
/// implemented by all supported algorithm
abstract class IShippingCostsStrategy {
  late String label;
  double calculate(Order order);
}
