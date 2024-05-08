import 'package:flutter/material.dart';
import 'package:CartaVerse/menu.dart';
import 'package:CartaVerse/registro.dart';

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
          alignment: Alignment.center,
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
          border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: SingleChildScrollView (
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
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Usuario',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 320.0,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        _verificarLogin();
                      },
                      child: Text("Acceder"),
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ))
                      ), 
                    )
                  )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 320.0,
                    height: 45,
                    child: ElevatedButton(
                      child: Text("Registro"),
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ))
                      ), 
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
