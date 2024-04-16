import 'package:flutter/material.dart';
import 'package:frontend_movil/menu.dart';
import 'package:frontend_movil/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({ super.key });

  @override
  Widget build(BuildContext context){
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
            ]
          )
        ) 

        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max, 
          children: <Widget>[
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width*0.5,
              child: Text("hey", textAlign: TextAlign.center,)
            ),
            Text("Hola MrBeast"),
            Text("Hola"),
            Text("Ah")
          ],
        ),
        */
    );

  }

  void _verificarLogin() {
    setState(() {
      _email = _texto_email.text;
      _pass = _texto_pass.text;
      // not email in base || email in base and pass not pass of email
      if (false) {
        mostrarAlerta(context);
      }
      else {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Menu())
        );
      }
    });
  }
}

Widget botonAcceder(){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 0,

    ),
    onPressed: (){},
    child: Text("Boton")
  );
}


//Text(_registrado ? "Ok" : "No registrado")
void mostrarAlerta(BuildContext context){
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