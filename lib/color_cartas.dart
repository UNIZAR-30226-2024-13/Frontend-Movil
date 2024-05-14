import 'package:flutter/material.dart';
import 'globals.dart';

class ColorCartas extends StatefulWidget {
  @override
  _ColorCartasState createState() => _ColorCartasState();
}


class _ColorCartasState extends State<ColorCartas> {
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
            children: <Widget> [
              // Botones para cambiar el color de las cartas
              _buildColorButton(context, "Color amarillo", "amarillo"),
              _buildColorButton(context, "Color azul", "azul"),
              _buildColorButton(context, "Color naranja", "naranja"),
              _buildColorButton(context, "Color morado", "morado"),
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


  Widget _buildColorButton(BuildContext context, String text, String color) {
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
            // Actualiza el color de las cartas
            setState(() {
              color_cartas = color;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Color de cartas cambiado a ${text.split(' ').last}"),
            ));
          },
        ),
      ),
    );
  }
}
