import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:web_socket_channel/io.dart';

void connectToSocket(BuildContext context) {
  final channel = IOWebSocketChannel.connect(
      'wss://ws.finnhub.io?token=cn370d9r01qtdiert63gcn370d9r01qtdiert640');

  channel.stream.listen((message) {
    final items = jsonDecode(message)['data'] as List?;
    final provider = Provider.of<SocketProvider>(context, listen: false);

    if (items != null) {
      for (var element in items) {
        provider.addOrUpdate(element);
      }
    }
  });

  channel.sink.add(jsonEncode({'type': 'subscribe', 'symbol': 'AAPL'}));
  channel.sink
      .add(jsonEncode({'type': 'subscribe', 'symbol': 'COINBASE:BTC-USD'}));
  channel.sink
      .add(jsonEncode({'type': 'subscribe', 'symbol': 'COINBASE:ETH-USD'}));
  channel.sink
      .add(jsonEncode({'type': 'subscribe', 'symbol': 'OANDA:EUR_USD'}));
  channel.sink.add(jsonEncode({'type': 'subscribe', 'symbol': 'AAPL.US'}));
  channel.sink.add(jsonEncode({'type': 'subscribe', 'symbol': 'MSFT.US'}));
  channel.sink.add(jsonEncode({'type': 'subscribe', 'symbol': 'AMZN.US'}));
}
