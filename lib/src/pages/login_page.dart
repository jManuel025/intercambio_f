import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.5,
            width: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.5),
          )
        ],
      ),
    );
  }
}