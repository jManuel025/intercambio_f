import 'package:flutter/material.dart';
import 'pages/login_page.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intercambio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'login'   : (BuildContext context) => LoginPage(),
      },
      initialRoute: 'login',
    );
  }
}

