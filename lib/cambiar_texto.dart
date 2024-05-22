import 'package:CartaVerse/globals.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CambiarTexto extends StatelessWidget {
  final TextEditingController _texto_input = TextEditingController();
  final String usuario;
  final bool cambiar_contrasegna;
  final String sessionId;
  final String sessionToken;

  String texto_a_mostrar = "";

  CambiarTexto({required this.usuario, required this.cambiar_contrasegna, required this.sessionId, required this.sessionToken});


  @override
  Widget build(BuildContext context) {
    if (cambiar_contrasegna) {
      texto_a_mostrar = "Introduzca una contraseña nueva";
    }
    else {
      texto_a_mostrar = "Introduzca un usuario nuevo";
    }
    void _verificar_cambio() {
      String texto_leido = _texto_input.text;
      if (texto_leido == "") {
        mostrarAlerta(context, "El campo a rellenar no puede ser vacío");
      }
      else if (cambiar_contrasegna && (texto_leido.length <= 7 || !( texto_leido.contains(RegExp(r'[a-z]'))) ||
                !(texto_leido.contains(RegExp(r'[A-Z]'))) || !(texto_leido.contains(RegExp(r'[0-9]'))))) {
        mostrarAlerta(context, "La contraseña debe ser mayor de 7 carácteres, y tener al menos una mayúscula, una minúscula y un dígito");
      }
      else {
        Navigator.of(context).pop();
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
          Text(fichas_usuario.toString() + " fichas"),
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
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                child: TextField(
                  obscureText: cambiar_contrasegna,
                  controller: _texto_input,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: texto_a_mostrar,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              )
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


void mostrarAlerta(BuildContext context, String texto) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Error"),
      content: Text(texto),
      actions: <Widget>
      [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Reintentar")
        )
      ]
    )
  );
}
