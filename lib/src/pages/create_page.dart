import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class IntercreatePage extends StatefulWidget {
  @override
  _IntercreatePageState createState() => _IntercreatePageState();
}

class _IntercreatePageState extends State<IntercreatePage> {
  List<DynamicWidget> listDynamic = [DynamicWidget(), DynamicWidget()];

  addDynamic() {
    listDynamic.add(DynamicWidget());
    setState(() {});
  }

  removeDynamic() {
    listDynamic.removeLast();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // Titulo de seccion
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: accentDarken,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: primary,
        elevation: 0.0,
        centerTitle: true,
        title: title(
          'Crear intercambio',
          accentDarken,
        ),
      ),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              color: secondary,
            ),
            child: Column(
              children: [
                // Contenido principal
                Expanded(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: double.infinity,
                      // Inputs
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
                              'Motivo', size, false, Icon(Icons.card_giftcard)),
                          inputText('Monto del regalo', size, false,
                              Icon(Icons.attach_money)),
                          // Input fecha y hora
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 7.0),
                                width: size.width * 0.425,
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
                                width: size.width * 0.425,
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
                          // switch de grupos
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
                          // // input grupo
                          ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listDynamic.length,
                              itemBuilder: (_, index) => listDynamic[index]),
                          // botones agregar y remover grupo
                          ButtonBar(
                            buttonPadding: EdgeInsets.all(0),
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: listDynamic.length > 2
                                      ? removeDynamic
                                      : null),
                              IconButton(
                                  icon: Icon(Icons.add), onPressed: addDynamic),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Botones
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

  // Input para grupo
  Widget _groupInput(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          width: size.width * 0.55,
          height: 45.0,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              labelText: 'Grupo',
              prefixIcon: Icon(Icons.group),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            width: size.width * 0.30,
            height: 45.0,
            child: _colorSelector()),
      ],
    );
  }

  // selector de color
  Widget _colorSelector() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(2),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    alignment: Alignment.center,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: paragraph('Rosa', false, Colors.grey[600]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          width: size.width * 0.55,
          height: 45.0,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              labelText: 'Grupo',
              prefixIcon: Icon(Icons.group),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 7.0),
            width: size.width * 0.30,
            height: 45.0,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(2),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            alignment: Alignment.center,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: paragraph('Rosa', false, Colors.grey[600]),
                          ))
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
