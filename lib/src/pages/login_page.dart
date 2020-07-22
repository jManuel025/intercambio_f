import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            color: primary,
          ),
          // Contenedor inferior
          SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              height: size.height * 0.50,
              width: double.infinity,
              margin: _keyboardIsVisible(context)
                  ? EdgeInsets.only(top: size.height * 0.25)
                  : EdgeInsets.only(top: size.height * 0.50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: secondary,
              ),
              child: Column(
                children: [
                  // Titulo de seccion
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.075),
                      width: double.infinity,
                      height: (size.height * 0.10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Iniciar sesión', accentDarken),
                        ],
                      ),
                    ),
                  ),
                  // Inputs y botones
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      height: (size.height * 0.45) - 25.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputText('Nombre de usuario', size, false,
                              Icon(Icons.person)),
                          inputText('Contraseña', size, true, Icon(Icons.lock)),
                          primaryButton(
                              'Iniciar sesión', size, context, 'inter'),
                          flatButton(
                              '¿Olvidaste tu contraseña?', size, context, '')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Boton regreso
          Container(
            margin: EdgeInsets.only(top: 40.0, left: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: secondary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  // Detecta si es visible el teclado
  bool _keyboardIsVisible(BuildContext context) {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }
}
