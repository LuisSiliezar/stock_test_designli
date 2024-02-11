import 'package:flutter/material.dart';
import 'package:stock_test_designli/src/models/trades.dart';

class SocketProvider with ChangeNotifier {
  final List<Trades> trades = [];

  void addOrUpdate(Map<String, dynamic> element) {
    final equal = trades.indexWhere((e) => e.symbol == element['s']);

    if (equal == -1) {
      trades.add(Trades.fromMap(element));
    } else {
      trades[equal].lastValue = trades[equal].value;
      trades[equal]
        ..value = element['v']
        ..margin = element['p'];
    }
    notifyListeners();
  }
}
