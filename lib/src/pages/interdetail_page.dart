import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class InterdetailPage extends StatefulWidget {
  @override
  _InterdetailPageState createState() => _InterdetailPageState();
}

enum WhyFarther { delete, edit }

class _InterdetailPageState extends State<InterdetailPage> {
  @override
  Widget build(BuildContext context) {
    // Dimensiones
    final size = MediaQuery.of(context).size;
    WhyFarther _selection;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: accentDarken,
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => _dialogDelete(size, context))),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: accentDarken,
                ),
                onPressed: () {})
          ],
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: accentDarken,
              ),
              onPressed: () {}),
          backgroundColor: primary,
          elevation: 0.0,
          centerTitle: true,
          title: title('Lorem ipsum', accentDarken)),
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
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _itemDetail(
                            'Monto del regalo', '250', Icons.attach_money),
                        _itemDetail('Fecha de entrega', '24/12/2020',
                            Icons.calendar_today),
                        _itemDetail(
                            'Hora de entrega', '24:00', Icons.access_time),
                        _groups(),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomPaint(
                            painter: DottedLinePainter(),
                          ),
                        ),
                        Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child:
                                paragraph('Participantes', true, accentDarken)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Icon(
                                    Icons.brightness_1,
                                    size: 14,
                                  ))),
                              Expanded(
                                  flex: 8,
                                  child: Container(
                                      child: paragraph('Participante ', false,
                                          accentDarken))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: PopupMenuButton<WhyFarther>(
                                    icon: Icon(Icons.more_vert),
                                    onSelected: (WhyFarther result) {
                                      setState(() {
                                        _selection = result;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<WhyFarther>>[
                                      const PopupMenuItem(
                                          value: WhyFarther.delete,
                                          child: Text(
                                            'Expulsar',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color:
                                                  Color.fromRGBO(21, 50, 67, 1),
                                            ),
                                          )),
                                      const PopupMenuItem(
                                          value: WhyFarther.edit,
                                          child: Text(
                                            'Reasignar grupo',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color:
                                                  Color.fromRGBO(21, 50, 67, 1),
                                            ),
                                          ))
                                    ],
                                  )))
                            ],
                          ),
                        )
                      ],
                    )),
                // contenedor de botones
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryDarken,
                                borderRadius: BorderRadius.circular(10.0)),
                            height: 40.0,
                            width: size.width * 0.78,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 12,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: paragraph(
                                          'HDO5VS5', true, accentDarken),
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
                        ),
                        primaryButton(
                            'Realizar sorteo', size, context, 'routeName'),
                      ],
                    ),
                  ),
                  // ),
                ),
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
}
