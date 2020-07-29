import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class InterlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // Titulo de seccion
      appBar: AppBar(
          backgroundColor: primary,
          elevation: 0.0,
          title: title('Intercambios', accentDarken)),
      backgroundColor: primary,
      body: Stack(
        children: [
          // Contenedor inferior
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            // height: size.height,
            width: double.infinity,
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
                  child: Container(
                    child: ListView(
                      children: [
                        _cardInfoInter(context),
                      ],
                    ),
                  ),
                ),
                // contenedor de botones
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      primaryButton(
                        'Crear intercambio',
                        () => Navigator.pushNamed(context, 'create'),
                      ),
                      secondaryButton(
                        'Unirme a intercambio',
                        () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          useSafeArea: false,
                          builder: (_) => _dialogCode(size, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ilustracion de estado
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

  // Icono y texto de dato
  Widget _iconText(Icon icon, String texto) {
    return Row(
      children: [
        Container(padding: EdgeInsets.only(right: 5.0), child: icon),
        paragraph(texto, true, accentDarken)
      ],
    );
  }

  // Card con detalles deintercambio
  Widget _cardInfoInter(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pushNamed(context, 'detail'),
      padding: EdgeInsets.all(0.0),
      child: Card(
        margin: EdgeInsets.all(0.0),
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
                    flex: 2,
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
              // Linea punteada inferior
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
            labelText: 'Ingresa tu nombre',
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
    );
  }

  // cuadro de dialogo para codigo
  Widget _dialogCode(Size size, BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: paragraph('¿Tienes un código?', true, accentDarken),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          paragraph('Ingresa el código del intercambio', false, accentDarken),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 40.0,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Código',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          child: FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: paragraph('Cancelar', true, accent))),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: FlatButton(
              onPressed: () => _unirme(context),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: paragraph('Unirme', true, accentDarken))),
        )
      ],
      contentPadding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
    );
  }

  void _unirme(BuildContext context) {
    Navigator.pop(context);
  }
}
