import 'package:flutter/material.dart';
import 'package:frontend_movil/amigos.dart';
import 'package:frontend_movil/crearPartida.dart';
import 'package:frontend_movil/perfil.dart';
import 'package:frontend_movil/unirsePartida.dart';


class Menu extends StatelessWidget {
  final String usuario;

  const Menu({required this.usuario});

  @override
  Widget build(BuildContext context) {
    String _mostrarFichas() {
      String fichas = "1M";

      return fichas;
    }

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
          Text(_mostrarFichas() + " Fichas"),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil(usuario : usuario, funcion_fichas : _mostrarFichas))
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset('assets/silueta.jpg'),
            )
          )
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
                    child: Text("Amigos"),
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
                        MaterialPageRoute(builder: (context) => amigos())
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
                    child: Text("Crear Partida"),
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
                        MaterialPageRoute(builder: (context) => crearPartida())
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
                    child: Text("Unirse a Partida"),
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
                        MaterialPageRoute(builder: (context) => unirsePartida())
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
                    child: Text("Partidas Pausadas"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ), 
                    onPressed: () => {
                      Navigator.pop(context)
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
