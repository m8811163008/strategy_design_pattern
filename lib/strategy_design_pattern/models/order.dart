import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// A simple class to store an order's
/// information.
///
/// [Order] class contains a list of order
/// items, provides a method to add a new
/// [OrderItem] to the order, and also defines
/// a getter method [price] which returns the
/// total price of the order(without shipping)
class Order {
  final List<OrderItem> items = [];
  double get price =>
      items.fold(0.0, (sum, orderItem) => sum + orderItem.price);

  void addOrderItem(OrderItem orderItem) {
    items.add(orderItem);
  }
}
