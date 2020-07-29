import 'package:flutter/material.dart';
import 'package:intercambio_f/src/utils/custom_widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushNamed(context, 'welcome'),
        ),
        elevation: 0.0,
        toolbarHeight: 40.0,
        actions: [
          flatButton(
              'Inicio de sesión', () => Navigator.pushNamed(context, 'login'))
        ],
      ),
      backgroundColor: primary,
      body: Stack(
        children: [
          // Contenedor inferior
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 32, right: 32, top: 16),
              height: size.height * 0.50 - 10.0,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: (size.height * 0.50) - 54.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: secondary,
              ),
              child: Column(
                children: [
                  // Titulo de la seccion
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.centerLeft,
                      child: title('Registro', accentDarken),
                    ),
                  ),
                  // Botones e inputs
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          inputText('Nombre', size, false, Icon(Icons.person)),
                          passwordInput(obscure),
                          primaryButton(
                            'Registrarme',
                            () => registro(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _keyboardIsVisible(BuildContext context) {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  Widget passwordInput(bool oscure) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 50.0,
      child: TextFormField(
        cursorColor: accentDarken,
        obscureText: oscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Contraseña',
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
              icon: Icon(
                obscure ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              }),
        ),
      ),
    );
  }

  void registro(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, 'inter', (route) => false);
  }
}
