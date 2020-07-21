import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class IntercreatePage extends StatefulWidget {
  @override
  _IntercreatePageState createState() => _IntercreatePageState();
}

enum WhyFarther { delete, edit }

class _IntercreatePageState extends State<IntercreatePage> {
  @override
  Widget build(BuildContext context) {
    // Dimensiones
    final size = MediaQuery.of(context).size;
    WhyFarther _selection;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: accentDarken,
              ),
              onPressed: () {}),
          backgroundColor: primary,
          elevation: 0.0,
          centerTitle: true,
          title: title('Crear intercambio', accentDarken)),
      body: Stack(
        children: [
          // Fondo
          Container(
            color: primary,
          ),
          // Contenedor inferior
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            height: size.height,
            width: double.infinity,
            // margin: EdgeInsets.only(top: size.height * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: secondary,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 16.0),
                            child: paragraph(
                                'Ingresa los datos del intercambio',
                                false,
                                accentDarken),
                            width: double.maxFinite,
                          ),
                          inputText(
                              'Nombre', size, false, Icon(Icons.card_giftcard)),
                          inputText('Monto del regalo', size, false,
                              Icon(Icons.attach_money)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 7.0),
                                width: size.width * 0.40,
                                height: 45.0,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 20.0),
                                    labelText: 'Fecha',
                                    prefixIcon: Icon(Icons.calendar_today),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 7.0),
                                width: size.width * 0.40,
                                height: 45.0,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 20.0),
                                    labelText: 'Hora',
                                    prefixIcon: Icon(Icons.access_time),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SwitchListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            activeColor: accent,
                            subtitle: note(
                                'Los miembros de un mismo grupo no podran intercambiar regalos entre ellos',
                                false,
                                accentDarken),
                            value: true,
                            title: paragraph(
                                'Permitir grupos', false, accentDarken),
                            onChanged: (value) => setState(() {
                              value = value;
                            }),
                          ),
                          inputText('Nombre del grupo', size, false,
                              Icon(Icons.group)),
                          ButtonBar(
                            buttonPadding: EdgeInsets.all(0),
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove), onPressed: () {}),
                              IconButton(
                                  icon: Icon(Icons.add), onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonPadding: EdgeInsets.symmetric(horizontal: 2.5),
                        children: [
                          RaisedButton(
                            color: secondaryDarken,
                            elevation: 0.0,
                            hoverElevation: 0.0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              child: paragraph('Cancelar', true, accentDarken),
                              width: size.width * 0.40,
                              height: 40.0,
                              alignment: Alignment.center,
                            ),
                          ),
                          RaisedButton(
                            color: accent,
                            elevation: 0.0,
                            hoverElevation: 0.0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              child: paragraph('Aceptar', true, secondary),
                              width: size.width * 0.40,
                              height: 40.0,
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemDetail(String indicatorText, String objectText, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: accentDarken,
                )),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paragraph(indicatorText, true, accentDarken),
                  paragraph(objectText, false, accentDarken)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _groups() {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(top: 7.5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.group,
                    color: accentDarken,
                  )),
            ),
            Expanded(
              flex: 8,
              child: Container(child: paragraph('Grupos', true, accentDarken)),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 7.5,
          children: [
            _myChip('Group 1'),
            _myChip('Group 2'),
            _myChip('Group 3'),
            _myChip('Group 4'),
            _myChip('Group 5'),
            _myChip('Group 6'),
            _myChip('Group 7'),
          ],
        ),
      )
    ]);
  }

  Widget _myChip(String texto) {
    return Chip(
        backgroundColor: primary, label: note(texto, false, accentDarken));
  }

  Widget _dialogDelete(Size size, BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: paragraph('¿Eliminar intercambio?', true, accentDarken),
      content:
          paragraph('Esta accion no se puede revertir', false, accentDarken),
      actions: [
        Container(
          // margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: FlatButton(
              onPressed: () => {},
              child: Container(
                  alignment: Alignment.centerRight,
                  child: note('Cancelar', true, accent))),
        ),
        Container(
          margin: EdgeInsets.only(right: 16.0),
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

  Widget _codeButton(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: secondaryDarken, borderRadius: BorderRadius.circular(10.0)),
        height: 40.0,
        width: size.width * 0.78,
        child: Row(
          children: [
            Expanded(
                flex: 12,
                child: Container(
                  alignment: Alignment.center,
                  child: paragraph('HDO5VS5', true, accentDarken),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  color: primary,
                  child: IconButton(
                      icon: Icon(
                        Icons.content_copy,
                        color: secondary,
                      ),
                      onPressed: () {}),
                )),
          ],
        ),
      ),
    );
  }
}
