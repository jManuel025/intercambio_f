import 'package:flutter/material.dart';

// Colores
final primary = Color.fromRGBO(255, 193, 69, 1);
final secondary = Color.fromRGBO(255, 255, 251, 1);
final secondaryDarken = Color.fromRGBO(238, 240, 235, 1);
final accent = Color.fromRGBO(40, 75, 99, 1);
final accentDarken = Color.fromRGBO(21, 50, 67, 1);

// Titulos
Widget title(String texto, Color color) {
  return Text(
    texto,
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: color),
  );
}

// Parrafos
Widget paragraph(String texto, bool negrita, Color color) {
  return Text(
    texto,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: negrita ? FontWeight.bold : FontWeight.normal,
      color: color,
    ),
  );
}

// Notas
Widget note(String texto, bool negrita, Color color) {
  return Text(
    texto,
    style: TextStyle(
        fontSize: 12.0,
        fontWeight: negrita ? FontWeight.bold : FontWeight.normal,
        color: color),
  );
}

// Botón primario
Widget primaryButton(
    String texto, Size size, BuildContext context, String routeName) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5),
    child: RaisedButton(
      color: accent,
      elevation: 0.0,
      hoverElevation: 0.0,
      onPressed: () => Navigator.pushNamed(context, routeName),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: paragraph(texto, true, secondary),
        width: size.width * 0.70,
        height: 40.0,
        alignment: Alignment.center,
      ),
    ),
  );
}

// Botón secundario
Widget secondaryButton(
    String texto, Size size, BuildContext context, String routeName) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5),
    child: RaisedButton(
      color: secondaryDarken,
      elevation: 0.0,
      hoverElevation: 0.0,
      onPressed: () => Navigator.pushNamed(context, routeName),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: paragraph(texto, true, accentDarken),
        width: size.width * 0.70,
        height: 40.0,
        alignment: Alignment.center,
      ),
    ),
  );
}

// Boton plano
Widget flatButton(
    String texto, Size size, BuildContext context, String routeName) {
  return FlatButton(
      onPressed: () => Navigator.pushNamed(context, routeName),
      child: Container(
          alignment: Alignment.center,
          width: size.width * 0.70,
          child: note(texto, true, accentDarken)));
}

// Input
Widget inputText(String texto, Size size, bool obscure, Icon icon) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 7.0),
    width: size.width * 0.78,
    height: 45.0,
    child: TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        labelText: texto,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
