import 'package:flutter/material.dart';

class StockPriceProvider extends ChangeNotifier {
  String? stockSymbol;
  String? stockPrice;
  StockPriceProvider({this.stockPrice, this.stockSymbol});

  void setStockData({
    required String newStockSymbol,
    required String newStockPrice,
  }) async {
    stockSymbol = newStockSymbol;
    stockPrice = newStockPrice;
    notifyListeners();
  }
}
