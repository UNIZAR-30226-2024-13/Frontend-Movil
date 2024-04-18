import 'package:flutter/material.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil(usuario : usuario))
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset('assets/silueta.jpg'),
            )
          )
        ]
      ),
    );
  }
}
