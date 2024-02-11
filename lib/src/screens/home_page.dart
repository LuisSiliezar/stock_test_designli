import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_test_designli/src/screens/auth/login_page.dart';
import 'package:stock_test_designli/src/screens/auth/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
        child: Column(children: [
          Expanded(
            child: Lottie.network(
                'https://lottie.host/9c40728d-cd2d-48a5-8439-ca072cdda4d6/HwyleYV2zv.json'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                margin: const EdgeInsets.only(bottom: 18),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                margin: const EdgeInsets.only(bottom: 32),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.green),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          )
        ]),
      ),
    );
  }
}
