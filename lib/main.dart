import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stock_test_designli/src/provider/socket_provider.dart';
import 'package:stock_test_designli/src/screens/home_page.dart';
import 'package:stock_test_designli/src/screens/stocks/all_stocks/all_stocks_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

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
        home:
            auth.currentUser == null ? const HomePage() : const AllStocksPage(),
      ),
    );
  }
}
