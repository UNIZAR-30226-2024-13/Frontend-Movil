import 'package:flutter/material.dart';
import 'package:CardVerse/cambiar_texto.dart';
import 'package:CardVerse/main.dart';

/*
  Botón cambiar usuario
  Botón cambiar contraseña
  Botón cambiar icono perfil
  Botón cerrar sesión
*/

class Perfil extends StatelessWidget {
  final String usuario;
  final Function funcion_fichas;

  const Perfil({required this.usuario, required this.funcion_fichas});

  @override
  Widget build(BuildContext context) {
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
                    child: Text("Modificar usuario"),
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
                        MaterialPageRoute(builder: (context) => CambiarTexto(usuario : usuario, funcion_fichas: funcion_fichas, cambiar_contrasegna: false))
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
                    child: Text("Modificar contraseña"),
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
                        MaterialPageRoute(builder: (context) => CambiarTexto(usuario : usuario, funcion_fichas: funcion_fichas, cambiar_contrasegna: true,))
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
                    child: Text("Modificar icono"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () => {
                      /*
                      Navigator.push(
                        context, 
                        //MaterialPageRoute(builder: (context) => CambiarTexto(usuario : usuario, funcion_fichas: funcion_fichas, cambiar_contraseña: ,))
                      )
                      */
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
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                        (route) => false,
                      );
                      // Ir a main y borrar el historial de ruta de pantallas
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
