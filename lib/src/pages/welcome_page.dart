import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          // Contenedor inferior
          Container(
            padding: EdgeInsets.only(
              left: 32,
              right: 32,
              top: 16,
            ),
            height: size.height * 0.40,
            width: double.maxFinite,
            margin: EdgeInsets.only(
              top: size.height * 0.60,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              color: secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Texto de bienvenida
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title(
                          'Bienvenido',
                          accentDarken,
                        ),
                        paragraph(
                          'Comienza a organizar tus intercambios',
                          false,
                          accentDarken,
                        )
                      ],
                    ),
                  ),
                ),
                // Botones
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        primaryButton(
                          'Iniciar sesión',
                          () => Navigator.pushNamed(context, 'login'),
                        ),
                        secondaryButton(
                          'Registrarme',
                          () => Navigator.pushNamed(context, 'register'),
                        ),
                        flatButton(
                          'Continuar como invitado',
                          () => Navigator.pushNamedAndRemoveUntil(
                              context, 'inter', (route) => false),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
