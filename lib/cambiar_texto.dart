import 'package:flutter/material.dart';

class CambiarTexto extends StatelessWidget {
  final String usuario;
  final Function funcion_fichas;
  final bool cambiar_contrasegna;

  const CambiarTexto({required this.usuario, required this.funcion_fichas, required this.cambiar_contrasegna});

  @override
  Widget build(BuildContext context) {

    void modificar_usuario() {

    }

    void modificar_contrasegna() {
      
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //shape: Border(bottom: BorderSide(color: Colors.black, width: 2)),
        shape: Border.all(color: Colors.black, width: 2.0),

        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png'
          ),
        ),
        title: Text("CartaVerse"),
        actions: <Widget>[
          Text(funcion_fichas() + " Fichas"),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/silueta.jpg'
            ),
          ),
        ]
      ),

      body : Container(
        // Textfield y botón debajo
      )
    );
  }
}
