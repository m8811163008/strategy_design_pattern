import 'package:faker/faker.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

/// A simple class to store information about
/// a single order item.
///
/// [OrderItem] class contains properties to store the order
/// item's title, price, and package size.
/// `OrderItem.random()` allows
/// creating/generating an [OrderItem] with
/// random property values.
class OrderItem {
  late final String title;
  late final double price;
  late final PackageSize packageSize;

  OrderItem.random() {
    const packageSizeList = PackageSize.values;

    title = faker.lorem.word();
    price = random.integer(100, min: 5) - 0.01;
    packageSize = packageSizeList[random.integer(packageSizeList.length)];
  }
}
