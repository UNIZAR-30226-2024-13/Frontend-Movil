import 'package:flutter/material.dart';

/*
  Botón cambiar usuario
  Botón cambiar contraseña
  Botón cambiar icono perfil (de momento sin uso)
  Botón cerrar sesión
*/

class CambiarTexto extends StatelessWidget {
  final String usuario;
  final Function funcion_fichas;
  final bool cambiar_contraseña;

  const Perfil({required this.usuario, required this.funcion_fichas, required this.cambiar_contraseña});

  @override
  Widget build(BuildContext context) {

    void modificar_usuario() {

    }

    void modificar_contraseña() {
      
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
