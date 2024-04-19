import 'package:flutter/material.dart';

class CambiarTexto extends StatelessWidget {
  final TextEditingController _texto_input = TextEditingController();
  final String usuario;
  final Function funcion_fichas;
  final bool cambiar_contrasegna;
  String texto_a_mostrar = "";

  CambiarTexto({required this.usuario, required this.funcion_fichas, required this.cambiar_contrasegna});


  @override
  Widget build(BuildContext context) {

    if (cambiar_contrasegna) {
      texto_a_mostrar = "Introduzca contraseña nueva";
    }
    else {
      texto_a_mostrar = "Introduzca usuario nuevo";
    }

    void modificar_usuario() {

    }

    void modificar_contrasegna() {
      
    }

    void _verificar_cambio() {
      String texto_leido = _texto_input.text;
      if (cambiar_contrasegna) {

      }
      else {

      }
    }

return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.red,
    leading: Container(
      padding: EdgeInsets.all(5),
      child: Image.asset('assets/logo.png'),
    ),
    title: Text("CartaVerse"),
    actions: <Widget>[
      Text(funcion_fichas() + " Fichas"),
      Container(
        padding: EdgeInsets.all(5),
        child: Image.asset('assets/silueta.jpg'),
      ),
    ]
  ),
  body: Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 27, 123, 22),
      border: Border.all(color: Colors.black, width: 2.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.circular(20)
          ),
          child: SizedBox(
            width: 323.0,
            child: TextField(
              controller: _texto_input,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: texto_a_mostrar,
                labelStyle: TextStyle(color: Colors.yellow),
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Confirmar"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ))
          ), 
          onPressed: () {
            _verificar_cambio();
          },
        )
      ],
    ),
  ),
);
  }
}
