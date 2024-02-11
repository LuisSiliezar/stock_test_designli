class Stocks {
  String? currency;
  String? description;
  String? displaySymbol;
  String? figi;
  String? mic;
  String? shareClassFIGI;
  String? symbol;
  String? symbol2;
  String? type;

  Stocks(
      {this.currency,
      this.description,
      this.displaySymbol,
      this.figi,
      this.mic,
      this.shareClassFIGI,
      this.symbol,
      this.symbol2,
      this.type});

  Stocks.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    description = json['description'];
    displaySymbol = json['displaySymbol'];
    figi = json['figi'];
    mic = json['mic'];
    shareClassFIGI = json['shareClassFIGI'];
    symbol = json['symbol'];
    symbol2 = json['symbol2'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['description'] = description;
    data['displaySymbol'] = displaySymbol;
    data['figi'] = figi;
    data['mic'] = mic;
    data['shareClassFIGI'] = shareClassFIGI;
    data['symbol'] = symbol;
    data['symbol2'] = symbol2;
    data['type'] = type;
    return data;
  }
}
