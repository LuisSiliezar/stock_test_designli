import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

String? apiKeyFinnhub = dotenv.env['API_KEY_FINNHUB'];

void connectToSocket(BuildContext context) {
  final channel =
      IOWebSocketChannel.connect('wss://ws.finnhub.io?token=$apiKeyFinnhub');

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

void disconnectFromSocket(BuildContext context) {
  final channel =
      IOWebSocketChannel.connect('wss://ws.finnhub.io?token=$apiKeyFinnhub');
  channel.sink.close(status.goingAway);
}
