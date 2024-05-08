import 'package:CardVerse/blackjack.dart';
import 'package:flutter/material.dart';
import 'package:CardVerse/amigos.dart';
import 'package:CardVerse/crearPartida.dart';
import 'package:CardVerse/unirsePartida.dart';


class ElegirFichas extends StatelessWidget {
  final String juego;
  final String id_partida;

  const ElegirFichas({required this.juego, required this.id_partida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png'
          ),
        ),
        actions: <Widget>[
          Text("1M Fichas"),
          GestureDetector(
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 250.0),
                child: Column(
                  children: [
                    Text(
                      "Fichas con las que deseas jugar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 40.0,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 160.0,
                        child: ElevatedButton(
                          child: Text("Confirmar"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.yellow),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ))
                          ), 
                          onPressed: () {
                            //
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 160.0,
                        child: ElevatedButton(
                          child: Text("Cancelar"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.yellow),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ))
                          ), 
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  void moverse_a_juego(String juego, BuildContext context) {
    // Tienes el ID en id_partida_publica
    if (juego == "blackjack") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Blackjack()));
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Blackjack()));
    }
  }
}
