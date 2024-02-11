import 'package:flutter/material.dart';
import 'package:stock_test_designli/src/api/api.dart';

class SelectStockPage extends StatefulWidget {
  const SelectStockPage({super.key});

  @override
  State<SelectStockPage> createState() => _SelectStockPageState();
}

class _SelectStockPageState extends State<SelectStockPage> {
  String selectedValue = "AAPL";
  @override
  Widget build(BuildContext context) {
    TextEditingController priceFormController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Set price alert',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: Colors.green,
                      value: selectedValue,
                      items: const [
                        DropdownMenuItem(value: "AAPL", child: Text("AAPL")),
                        DropdownMenuItem(
                            value: "COINBASE:ETH-USD",
                            child: Text("COINBASE:ETH-USD")),
                        DropdownMenuItem(
                            value: "COINBASE:BTC-USD",
                            child: Text("COINBASE:BTC-USD")),
                        DropdownMenuItem(
                            value: "OANDA:EUR_USD",
                            child: Text("OANDA:EUR_USD")),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: priceFormController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Price in (USD \$)',
                      hintStyle: TextStyle(color: Colors.white60),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    margin: const EdgeInsets.only(top: 32),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Set alert',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
