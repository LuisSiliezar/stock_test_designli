class Trades {
  dynamic value;
  dynamic lastValue;
  dynamic margin;
  final dynamic symbol;

  Trades({
    required this.value,
    required this.margin,
    required this.symbol,
    this.lastValue,
  });

  factory Trades.fromMap(Map<String, dynamic> map) {
    return Trades(
      value: map['v'],
      margin: map['p'],
      symbol: map['s'],
    );
  }
}
