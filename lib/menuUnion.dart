import 'package:flutter/material.dart';
import 'package:CartaVerse/blackjack.dart';
import 'package:CartaVerse/poker.dart';
import 'package:CartaVerse/menu.dart';

class MenuUnion extends StatefulWidget {
  final String juego;
  MenuUnion({required this.juego});

  @override
  _MenuUnionState createState() => _MenuUnionState();
}

class _MenuUnionState extends State<MenuUnion> {
  final List<String> partidasGuardadas = [
    "Partida 1",
    "Partida 2",
    "Partida 3",
    "Partida 4",
    "Partida 5",
    "Partida 6",
    "Partida 7",
  ];

  String id_partida = "";

  String? _selectedPartida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu(usuario: "alex")),
            );
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('assets/logo.png'),
          ),
        ),
        actions: <Widget>[
          Text("400 Fichas"),
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
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  height: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    itemCount: partidasGuardadas.length,
                    itemBuilder: (context, index) {
                      final partida = partidasGuardadas[index];
                      return ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          partida,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedPartida = partida;
                          });
                          id_partida = partida;
                        },
                        selected: _selectedPartida == partida,
                        tileColor: Colors.white,
                      );
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20))),
                Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 323.0,
                      child: ElevatedButton(
                        child: Text("Confirmar"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.yellow),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                        onPressed: () {
                          moverse_a_juego(widget.juego, context);
                        },
                      ),
                    )),
              ]),
        ),
      ),
    );
  }

  void moverse_a_juego(String juego, BuildContext context) {
    // Tienes el ID en id_partida
    if (juego == "blackjack") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Blackjack()));
    } else if (juego == "poker") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Poker()));
    } else {
      Navigator.pop(context);
    }
  }
}
