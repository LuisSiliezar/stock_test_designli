import 'package:flutter/material.dart';
import 'package:stock_test_designli/src/screens/stocks/select_stock/select_stock_page.dart';

class DesignliDrawer extends StatelessWidget {
  const DesignliDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      child: ListView(
        padding: const EdgeInsets.only(top: 120),
        children: [
          ListTile(
            title: const Text(
              'Add alerts',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectStockPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
