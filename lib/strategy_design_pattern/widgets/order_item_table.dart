import 'package:flutter/material.dart';
import 'package:strategy_design_pattern_gof/strategy_design_pattern/strategy_design_pattern.dart';

class OrderItemsTable extends StatelessWidget {
  final List<OrderItem> orderItems;

  const OrderItemsTable({
    super.key,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'Title',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
      ),
      DataColumn(
        label: Text(
          'Package Size',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
      ),
      DataColumn(
        label: Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
        numeric: true,
      ),
    ], rows: <DataRow>[
      for (var orderItem in orderItems)
        DataRow(cells: <DataCell>[
          DataCell(Text(orderItem.title)),
          DataCell(Text(orderItem.packageSize.toString().split('.').last)),
          DataCell(Text('\$${orderItem.price.toStringAsFixed(2)}'))
        ])
    ]);
  }
}
