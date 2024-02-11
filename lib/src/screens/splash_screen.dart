import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Lottie.network(
            'https://lottie.host/97b40f6e-a229-45b8-9ed9-a8ebc2fb992a/5StKxelZ2Y.json'),
      ),
    );
  }
}
