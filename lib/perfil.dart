import 'package:CartaVerse/color_cartas.dart';
import 'package:CartaVerse/globals.dart';
import 'package:CartaVerse/reverso_cartas.dart';
import 'package:flutter/material.dart';
import 'package:CartaVerse/cambiar_texto.dart';
import 'package:CartaVerse/main.dart';
import 'package:http/http.dart' as http;

class Perfil extends StatelessWidget {
  final String usuario;
  final String sessionId;
  final String sessionToken;

  const Perfil({required this.usuario, required this.sessionId, required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),

        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png'
          ),
        ),
        title: Text("CartaVerse"),
        actions: <Widget>[
          Text(fichas_usuario.toString() + " fichas"),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/silueta.jpg'
            ),
          ),
        ]
      ),

      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
          border: Border.all(color: Colors.black, width: 2.0) ,
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cambiar usuario"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () => {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => CambiarTexto(usuario : usuario, cambiar_contrasegna: false, sessionId: sessionId, sessionToken: sessionToken))
                      )
                    },
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cambiar contraseña"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () => {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => CambiarTexto(usuario : usuario, cambiar_contrasegna: true, sessionId: sessionId, sessionToken: sessionToken))
                      )
                    },
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cambiar foto perfil"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () => {
                      // Cambiar icono
                    },
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cambiar color cartas"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ColorCartas())
                      );
                    },
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cambiar reverso cartas"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ReversoCartas())
                      );
                    },
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Cerrar sesión"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () async {
                      try {
                        var url = 'http://' + ip + ':20000/api/usuarios/logout?usuarioSesion=' + sessionId + '&sessionToken=' + sessionToken;
                        await http.delete(Uri.parse(url));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                          (route) => false,
                        );
                      }
                      catch (error) {}
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
}
