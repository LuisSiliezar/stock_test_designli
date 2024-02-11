import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:stock_test_designli/src/screens/stocks/all_stocks/all_stocks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock app test',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const AllStocksPage(),
      ),
    );
  }
}
