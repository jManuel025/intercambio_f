import 'package:flutter/material.dart';
import 'package:intercambio_f/src/pages/register_page.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intercambio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: accentDarken,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins'
      ),
      routes: {
        'welcome' : (BuildContext context) => WelcomePage(),
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
      },
      initialRoute: 'welcome',
      
    );
  }
}

