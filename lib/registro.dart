import 'package:flutter/material.dart';
import 'package:frontend_movil/menu.dart';

TextEditingController _texto_nombre = TextEditingController();
TextEditingController _texto_pais = TextEditingController();
TextEditingController _texto_email = TextEditingController();
TextEditingController _texto_pass = TextEditingController();

String _nombre = '';
String _pais = '';
String _email = '';
String _pass = '';

class Registro extends StatelessWidget {
  const Registro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro")
      ),
      body: 
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    controller: _texto_nombre,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                    ),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    controller: _texto_pais,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'País',
                    ),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    controller: _texto_email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    obscureText: true,
                    controller: _texto_pass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  height: 45,
                  child: ElevatedButton(
                    child: Text("Registrar"),
                    onPressed: () {
                      _verificarRegistro(context);
                    },
                  )
                )
              ),
            ]
          )
        )
    );
  }
}

void _verificarRegistro(BuildContext context) {
  _nombre = _texto_nombre.text;
  _pais = _texto_pais.text;
  _email = _texto_email.text;
  _pass = _texto_pass.text;

  // Casos de error
  if (_nombre == "" || _pais == "" || _email == "" || _pass == "") {
    mostrarAlerta(context, "Todos los campos han de ser rellenados");
  }
  else {
    // INSERTAR USUARIO EN LA BASE DE DATOS
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => Menu(usuario : _nombre))
    );
  }
}


void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Registro incorrecto"),
      content: Text(mensaje),
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