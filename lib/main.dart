import 'package:flutter/material.dart';
import 'package:frontend_movil/home.dart';
import 'package:frontend_movil/mentiroso.dart';
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
  TextEditingController _texto_email = TextEditingController();
  TextEditingController _texto_pass = TextEditingController();

  String _email = '';
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SingleChildScrollView(
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
                      enabledBorder: OutlineInputBorder(),
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
                        MaterialPageRoute(builder: (context) => Mentiroso())
                      )
                    },
                  )

                )
              ),
              /*
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  height: 45,
                  child: ElevatedButton(
                    child: Text("Prueba"),
                    onPressed: () =>{
                      mostrarAlerta(context)
                    },
                  )

                )
              ),
              */
            ]
          )
        ) 
    );
  }

  void _verificarLogin() {
    setState(() {
      _email = _texto_email.text;
      _pass = _texto_pass.text;
      String usuario = "";
      // not email in base || email in base and pass not pass of email
      if (_email == "" || _pass == "") {
        mostrarAlerta(context);
      }
      else {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Home(usuario : usuario))
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
void mostrarAlerta(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Login incorrecto"),
      content: Text("Email o contraseña incorrectos"),
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