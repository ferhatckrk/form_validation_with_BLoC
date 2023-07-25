import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "E-mail adres"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Parola "),
                  obscureText: true,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Sign_ın"))
              ]),
        ),
      ),
    );
  }
}
