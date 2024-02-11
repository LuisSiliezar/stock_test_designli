import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/common_widgets/designli_drawer/designli_drawer.dart';
import 'package:stock_test_designli/src/models/candles.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:stock_test_designli/src/services/socket_services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllStocksPage extends StatefulWidget {
  const AllStocksPage({super.key});

  @override
  State<AllStocksPage> createState() => _AllStocksPageState();
}

class _AllStocksPageState extends State<AllStocksPage> {
  TrackballBehavior trackballBehavior = TrackballBehavior();
  late List<Candles> candleValuesAPPL = [];
  late List<Candles> candleValuesAMZN = [];

  void getDataFoAPPLCandles() async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-09?adjusted=true&apiKey=upYFFQBkTzGNnkzutGxiOp16Rp9pbJtp');

    final items = response.data['results'];

    if (items != null) {
      for (var element in items) {
        print(element);
        candleValuesAPPL.add(Candles.fromMap(element));
      }
    }
  }

  void getDataForAMZNCandles() async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-09?adjusted=true&apiKey=upYFFQBkTzGNnkzutGxiOp16Rp9pbJtp');
    final items = response.data['results'];

    if (items != null) {
      for (var element in items) {
        print(element);
        candleValuesAMZN.add(Candles.fromMap(element));
      }
    }
  }

  @override
  void initState() {
    connectToSocket(context);
    getDataFoAPPLCandles();
    getDataForAMZNCandles();
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
      ),
      drawer: const DesignliDrawer(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 0, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stock value',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView(children: [
                candleChartData('Apple stock', candleValuesAPPL),
                candleChartData('Amazon stock', candleValuesAMZN),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 16, 0, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Watched list',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 280,
              child: Consumer<SocketProvider>(builder: (context, value, child) {
                return watchedStockCards(value);
              }),
            ),
          ]),
    );
  }

  SizedBox candleChartData(String title, List<Candles> candleValues) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: SfCartesianChart(
          title: ChartTitle(
              text: title, textStyle: const TextStyle(color: Colors.white)),
          primaryXAxis: const CategoryAxis(),
          tooltipBehavior: TooltipBehavior(enable: true),
          trackballBehavior: trackballBehavior,
          zoomPanBehavior:
              ZoomPanBehavior(zoomMode: ZoomMode.x, enablePanning: true),
          series: <CandleSeries<Candles, String>>[
            CandleSeries<Candles, String>(
              bearColor: Colors.red,
              bullColor: Colors.green,
              dataSource: candleValues,
              xValueMapper: (Candles sales, _) =>
                  DateTime.fromMillisecondsSinceEpoch(sales.t!.toInt() * 1000)
                      .toString(),
              lowValueMapper: (Candles sales, _) => sales.v,
              highValueMapper: (Candles sales, _) => sales.v,
              openValueMapper: (Candles sales, _) => sales.c,
              closeValueMapper: (Candles sales, _) => sales.v,
            )
          ]),
    );
  }

  GridView watchedStockCards(SocketProvider value) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, crossAxisSpacing: 0, mainAxisSpacing: 0),
      itemCount: value.trades.length,
      itemBuilder: (context, index) {
        final currentValue = value.trades[index];
        final isGreater = currentValue.lastValue != null
            ? currentValue.lastValue > currentValue.value
                ? false
                : true
            : true;
        var valuen = (currentValue.margin / currentValue.value) / 100;
        return Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              currentValue.symbol,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Row(
              children: [
                Icon(
                  isGreater
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isGreater ? Colors.green : Colors.red,
                ),
                Text(
                  '${currentValue.value.toStringAsFixed(3)}%',
                  style: TextStyle(
                      color: isGreater ? Colors.green : Colors.red,
                      fontSize: 24),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${currentValue.margin})',
                  style: TextStyle(
                      color: isGreater ? Colors.green : Colors.red,
                      fontSize: 18),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
