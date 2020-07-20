import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intercambio_f/src/pages/interdetail_page.dart';
import 'package:intercambio_f/src/pages/interlist_page.dart';
import 'package:intercambio_f/src/pages/register_page.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Intercambio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: accentDarken,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'),
      routes: {
        'welcome': (BuildContext context) => WelcomePage(),
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'inter': (BuildContext context) => InterlistPage(),
        'detail': (BuildContext context) => InterdetailPage(),
      },
      initialRoute: 'detail',
    );
  }
}
