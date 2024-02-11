import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stock_test_designli/src/models/candles.dart';

String? apiKeyFinnhub = dotenv.env['API_KEY_FINNHUB'];
String? apiKeyPolygon = dotenv.env['API_KEY_POLYGON'];

Future<List<Candles>> getAllStocks() async {
  List<Candles> allStocksCandleValuesFromApi = [];
  final dio = Dio();
  final response = await dio.get(
      'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-09?adjusted=true&apiKey=$apiKeyPolygon');
  final items = response.data['results'];
  if (items != null) {
    for (var element in items) {
      allStocksCandleValuesFromApi.add(Candles.fromMap(element));
    }
  }
  return allStocksCandleValuesFromApi;
}
