import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/api/api.dart';
import 'package:stock_test_designli/src/models/candles.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:stock_test_designli/src/screens/stocks/select_stock/select_stock_page.dart';
import 'package:stock_test_designli/src/services/socket_services.dart';
import 'package:stock_test_designli/src/utils/authentification.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllStocksPage extends StatefulWidget {
  const AllStocksPage({super.key});

  @override
  State<AllStocksPage> createState() => _AllStocksPageState();
}

class _AllStocksPageState extends State<AllStocksPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TrackballBehavior trackballBehavior = TrackballBehavior();
  late List<Candles> allStocksCandleValues = [];
  bool isLoading = true;

  @override
  void initState() {
    connectToSocket(context);
    getAllStocks().then((candlesFromAPI) {
      setState(() {
        allStocksCandleValues = candlesFromAPI;
        isLoading = false;
      });
    });
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.black,
              centerTitle: false,
              title: SizedBox(
                width: 250,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  '👋  ${auth.currentUser!.email}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SelectStockPage(),
                        ));
                  },
                  icon: const Icon(Icons.notification_add),
                ),
                IconButton(
                  onPressed: () async {
                    disconnectFromSocket(context);
                    await AuthenticationHelper().signOut(context);
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 0, 14),
                    child: Text(
                      'Stock value',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: candleChartData('All stocks', allStocksCandleValues),
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
                    child: Consumer<SocketProvider>(
                        builder: (context, value, child) {
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
          primaryXAxis: const CategoryAxis(),
          primaryYAxis: const NumericAxis(
            interval: 4,
            minimum: 0,
            maximum: 100,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          trackballBehavior: trackballBehavior,
          zoomPanBehavior:
              ZoomPanBehavior(zoomMode: ZoomMode.x, enablePanning: false),
          series: <CandleSeries<Candles, String>>[
            CandleSeries<Candles, String>(
              bearColor: Colors.red,
              bullColor: Colors.green,
              dataSource: candleValues,
              xValueMapper: (Candles sales, _) => sales.x,
              lowValueMapper: (Candles sales, _) => sales.l,
              highValueMapper: (Candles sales, _) => sales.h,
              openValueMapper: (Candles sales, _) => sales.o,
              closeValueMapper: (Candles sales, _) => sales.c,
            ),
          ]),
    );
  }

  GridView watchedStockCards(SocketProvider value) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 180,
          crossAxisCount: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0),
      itemCount: value.trades.length,
      itemBuilder: (context, index) {
        final currentValue = value.trades[index];
        final isGreater = currentValue.lastValue != null
            ? currentValue.lastValue > currentValue.value
                ? false
                : true
            : true;
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
