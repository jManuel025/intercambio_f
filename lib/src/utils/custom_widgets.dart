import 'package:flutter/material.dart';

// Colores
final primary = Color.fromRGBO(255, 193, 69, 1);
final secondary = Color.fromRGBO(255, 255, 251, 1);
final secondaryDarken = Color.fromRGBO(238, 240, 235, 1);
final accent = Color.fromRGBO(40, 75, 99, 1);
final accentDarken = Color.fromRGBO(21, 50, 67, 1);

// Titulos
Text title(String texto, Color color) {
  return Text(
    texto,
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: color),
  );
}

// Parrafos
Text paragraph(String texto, bool negrita, Color color) {
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
Text note(String texto, bool negrita, Color color) {
  return Text(
    texto,
    style: TextStyle(
        fontSize: 12.0,
        fontWeight: negrita ? FontWeight.bold : FontWeight.normal,
        color: color),
  );
}

// Botón primario
Padding primaryButton(String texto, Function onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5),
    child: RaisedButton(
      color: accent,
      elevation: 0.0,
      hoverElevation: 0.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: paragraph(texto, true, secondary),
        height: 40.0,
        alignment: Alignment.center,
      ),
    ),
  );
}

// Botón secundario
Padding secondaryButton(String texto, Function onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5),
    child: RaisedButton(
      color: secondaryDarken,
      elevation: 0.0,
      hoverElevation: 0.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: paragraph(texto, true, accentDarken),
        height: 40.0,
        alignment: Alignment.center,
      ),
    ),
  );
}

// Boton plano
FlatButton flatButton(String texto, Function onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Container(
      alignment: Alignment.center,
      child: note(
        texto,
        true,
        accentDarken,
      ),
    ),
  );
}

// Input
Widget inputText(String texto, Size size, bool obscure, Icon icon) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    height: 50.0,
    child: TextFormField(
      cursorColor: accentDarken,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: texto,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = accentDarken;
    paint.strokeWidth = 1.5;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 4;
    var dashSpace = 4;
    double startX = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DottedLinePainter oldDelegate) => false;
}
