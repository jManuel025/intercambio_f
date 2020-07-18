import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class InterlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dimensiones
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            color: primary,
          ),
          // Contenedor inferior
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            height: size.height * 0.85,
            width: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: secondary,
            ),
            child: Column(
              children: [
                // listado de cards
                Expanded(
                    flex: 4,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        _cardInfoInter(),
                      ],
                    )),
                // contenedor de botones
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        primaryButton(
                            'Crear intercambio', size, context, 'routeName'),
                        RaisedButton(
                          color: secondaryDarken,
                          elevation: 0.0,
                          hoverElevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () => showDialog(
                              // barrierDismissible: false,
                              context: context,
                              builder: (_) => _dialogName(size, context)),
                          child: Container(
                            child: paragraph(
                                'Unirme a intercambio', true, accentDarken),
                            width: size.width * 0.70,
                            height: 40.0,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ),
                ),
              ],
            ),
          ),
          // titulo de la seccion
          Container(
            width: double.infinity,
            height: size.height * 0.15,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.bottomLeft,
            child: title('Intercambios', accentDarken),
          ),
        ],
      ),
    );
  }

  Widget _statusIllustration(Size size) {
    return Container(
        width: double.infinity,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Image.asset(
              'assets/images/boxEmpty.png',
              width: size.width * 0.50,
            ),
          ),
          Text(
            'Aún no estás en un intercambio, pero eso se puede arreglar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: accentDarken,
            ),
          )
        ])));
  }

  Widget _iconText(Icon icon, String texto) {
    return Row(
      children: [
        Container(padding: EdgeInsets.only(right: 5.0), child: icon),
        paragraph(texto, true, accentDarken)
      ],
    );
  }

  Widget _cardInfoInter() {
    return Card(
      elevation: 0.0,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                // Icono e indicador de participantes
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.group,
                          color: accentDarken,
                          size: 30.0,
                        ),
                        paragraph('1', true, accentDarken)
                      ],
                    ),
                  ),
                ),
                // nombre y fecha de intercambio
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        paragraph('Lorem Ipsum', true, accentDarken),
                        _iconText(Icon(Icons.calendar_today), '24/12/2020'),
                      ],
                    ),
                  ),
                ),
                // hora y costo de intercambio
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _iconText(Icon(Icons.access_time), '24:00'),
                        _iconText(Icon(Icons.attach_money), '250'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            )
          ],
        ),
      ),
    );
  }

  // cuadro de dialogo nombre del usuario
  Widget _dialogName(Size size, BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: paragraph('Permítenos conocerte', true, accentDarken),
      content: Container(
        padding: EdgeInsets.only(bottom: 0),
        margin: EdgeInsets.symmetric(vertical: 7.0),
        width: size.width * 0.78,
        height: 45.0,
        child: TextFormField(
          decoration: InputDecoration(
            // contentPadding:
            //     EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            labelText: 'Ingresa tu nombre',
            // prefixIcon: Icon(Icons.perm_camera_mic),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: FlatButton(
              onPressed: () => {},
              child: Container(
                  alignment: Alignment.centerRight,
                  child: note('Aceptar', true, accentDarken))),
        )
      ],
      contentPadding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      // buttonPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = accentDarken;
    paint.strokeWidth = 2.0;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 5;
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