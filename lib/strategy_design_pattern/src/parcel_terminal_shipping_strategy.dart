import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

class ParcelTerminalShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Parcel terminal shipping';

  @override
  double calculate(order) {
    return order.items.fold<double>(
        0.0, (sum, item) => sum + _getOrderItemShippingPrice(item));
  }

  double _getOrderItemShippingPrice(OrderItem orderItem) {
    switch (orderItem.packageSize) {
      case PackageSize.S:
        return 1.99;
      case PackageSize.M:
        return 2.49;
      case PackageSize.L:
        return 2.99;
      case PackageSize.XL:
        return 3.49;
      default:
        throw Exception(
          "Unknown shipping price for the package of size '${orderItem.packageSize}'.",
        );
    }
  }
}
