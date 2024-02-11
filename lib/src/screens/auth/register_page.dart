import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailFormController = TextEditingController();
    TextEditingController passwordFormController = TextEditingController();
    TextEditingController nameFormController = TextEditingController();
    TextEditingController surnameFormController = TextEditingController();

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
                    'REGISTER TITLE EXAMPLE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  TextFormField(
                    controller: nameFormController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white60),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: surnameFormController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: Colors.white60),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: emailFormController,
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
                    controller: passwordFormController,
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
                      'Register',
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
