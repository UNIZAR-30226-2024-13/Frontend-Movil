import 'package:flutter/material.dart';
import 'globals.dart';

class ReversoCartas extends StatefulWidget {
  @override
  _ReversoCartasState createState() => _ReversoCartasState();
}


class _ReversoCartasState extends State<ReversoCartas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('assets/logo.png'),
        ),
        title: Text("CartaVerse"),
        actions: <Widget>[
          Text(fichas_usuario.toString() + " fichas"),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('assets/silueta.jpg'),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 2.0),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Botones para cambiar el color del reverso de las cartas
              _buildColorButton(context, "Reverso azul", Colors.blue, 'assets/reverso_azul.jpg'),
              _buildColorButton(context, "Reverso naranja", Colors.orange, 'assets/reverso_naranja.jpg'),
              _buildColorButton(context, "Reverso rojo", Colors.red, 'assets/reverso_rojo.jpg'),
              _buildColorButton(context, "Reverso morado", Colors.purple, 'assets/reverso_morado.jpg'),
              Container(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 200, // Ancho de la imagen
                  height: 200, // Alto de la imagen
                  child: Image.asset(
                    path_reverso, // Cambia el color de la imagen según la variable global
                    fit: BoxFit.contain, // Ajustar la imagen al contenedor
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Volver"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildColorButton(BuildContext context, String text, Color color, String path) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 323.0,
        child: ElevatedButton(
          child: Text(text),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold))),
          onPressed: () {
            // Actualiza el color del reverso de las cartas
            setState(() {
              path_reverso = path;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Color de reverso de cartas cambiado a ${text.split(' ').last}"),
            ));
          },
        ),
      ),
    );
  }
}
