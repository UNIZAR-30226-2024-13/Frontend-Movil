import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:frontend_movil/menu.dart';
import 'package:frontend_movil/registro.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}


class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  TextEditingController _texto_user = TextEditingController();
  TextEditingController _texto_pass = TextEditingController();

  String _user = '';
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 27, 123, 22),
            border: Border.all(color: Colors.black, width: 2.0) ,
          ),
          child: Column(
            children: <Widget> [
              SizedBox(
                width: 323.0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/logo.png'
                  )
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
                      labelText: 'Usuario',
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
                    onPressed: () {
                      _verificarLogin();
                    },
                    child: Text("Acceder"),
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  height: 45,
                  child: ElevatedButton(
                    child: Text("Registro"),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Registro())
                      )
                    },
                  )

                )
              ),
            ]
          )
        ) 
    );
  }


  void _verificarLogin() {
    setState(() {
      _user = _texto_user.text;
      _pass = _texto_pass.text;
      // not email in base || email in base and pass not pass of email
      if (_user == "" || _pass == "") {
        mostrarAlerta(context, "Los campos no pueden ser vacíos");
      }
      else if (_pass.length <= 7 || not ( _pass.contains(RegExp(r'[a-z]'))) || not (_pass.contains(RegExp(r'[A-Z]'))) || not (_pass.contains(RegExp(r'[0-9]')))) {
        mostrarAlerta(context, "La contraseña debe ser mayor de 7 carácteres, y tener al menos una mayúscula, una minúscula y un dígito");
      }
      else {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Menu(usuario : _user))
        );
      }
    });
  }
}


Widget botonAcceder() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 0,
    ),
    onPressed: () {},
    child: Text("Boton")
  );
}


//Text(_registrado ? "Ok" : "No registrado")
void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Login incorrecto"),
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
