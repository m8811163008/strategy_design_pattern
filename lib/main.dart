import 'package:flutter/material.dart';

import 'strategy_design_pattern/strategy_design_pattern.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strategy Design pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StrategyExample(),
    );
  }
}
