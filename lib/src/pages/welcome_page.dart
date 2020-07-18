import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dimensiones del dispositivo
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
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              height: size.height * 0.45,
              width: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: secondary,
              ),
              child: Column(
                children: [
                  // Texto de bienvenida
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.075),
                      width: double.infinity,
                      height: (size.height * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Bienvenido', accentDarken),
                          paragraph('Comienza a organizar tus intercambios',
                              false, accentDarken)
                        ],
                      ),
                    ),
                  ),
                  // Botones
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          primaryButton(
                              'Iniciar sesión', size, context, 'login'),
                          secondaryButton(
                              'Registrarme', size, context, 'register'),
                          flatButton(
                              'Continuar como invitado', size, context, 'inter')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
