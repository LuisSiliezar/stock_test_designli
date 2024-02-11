import 'package:flutter/material.dart';
import 'package:stock_test_designli/src/api/api.dart';

class SelectStockPage extends StatefulWidget {
  const SelectStockPage({super.key});

  @override
  State<SelectStockPage> createState() => _SelectStockPageState();
}

class _SelectStockPageState extends State<SelectStockPage> {
  // late Future<List<String>> futureCountry;
  // late String _selected;
  @override
  void initState() {
    getAllStockNames().then((data) {
      print(data);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController stockNameFormController = TextEditingController();
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
                    'Select stock',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  // FutureBuilder<List<String>>(
                  //   future: futureCountry,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return DropdownButton(
                  //         value: _selected,
                  //         icon: Icon(Icons.arrow_drop_down),
                  //         iconSize: 30,
                  //         elevation: 16,
                  //         style: TextStyle(color: Colors.black),
                  //         onChanged: (newValue) {
                  //           setState(() {
                  //             _selected = newValue!;
                  //           });
                  //         },
                  //         items: snapshot.data
                  //             ?.map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return Text("${snapshot.error}");
                  //     }
                  //     return CircularProgressIndicator();
                  //   },
                  // ),
                  TextFormField(
                    controller: stockNameFormController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white60),
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
                      hintText: 'Password',
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
                      'Look up',
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
