import 'package:flutter/material.dart';
import 'package:frontend_movil/menu.dart';
import 'dart:js_util';

TextEditingController _texto_nombre = TextEditingController();
TextEditingController _texto_pais = TextEditingController();
TextEditingController _texto_email = TextEditingController();
TextEditingController _texto_pass = TextEditingController();
TextEditingController _texto_user = TextEditingController();

String _nombre = '';
String _pais = '';
String _email = '';
String _pass = '';
String _user = '';

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
                    controller: _texto_user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de usuario',
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
  _user = _texto_user.text;

  // Casos de error
  if (_nombre == "" || _pais == "" || _email == "" || _pass == "" || _user == "") {
    mostrarAlerta(context, "Todos los campos han de ser rellenados");
  }
  else if (_pass.length <= 7 || not ( _pass.contains(RegExp(r'[a-z]'))) || not (_pass.contains(RegExp(r'[A-Z]'))) || not (_pass.contains(RegExp(r'[0-9]')))) {
    mostrarAlerta(context, "La contraseña debe ser mayor de 7 carácteres, y tener al menos una mayúscula, una minúscula y un dígito");
  }
  else if (RegExp(r'^\w+@\w+\.\w+$').hasMatch(_email)) {
    mostrarAlerta(context, "El formato del email no es correcto");
  }
  else {
    // INSERTAR USUARIO EN LA BASE DE DATOS
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => Menu(usuario : _user))
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
