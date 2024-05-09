import 'package:flutter/material.dart';
import 'package:CartaVerse/elegirFichas.dart';

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

  String id_partida_publica = "";
  String? _selectedPartida;

  TextEditingController _id_partida_privada = TextEditingController();
  String id_partida_privada = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Unirse"),
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: GestureDetector(
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
                Text(
                  "Partida privada",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Puedes ajustar el tamaño de la fuente aquí
                  ),
                ),
                SizedBox(
                  width: 320.0,
                  height: 40.0,
                  child: TextField(
                    controller: _id_partida_privada,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "  ID de la partida privada",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Text(
                  "Partida pública",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20, // Puedes ajustar el tamaño de la fuente aquí
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  height: 350,
                  // Borde amarillo de la lista de partidas
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
                          id_partida_publica = partida;
                        },
                        selected: _selectedPartida == partida,
                        tileColor: Colors.white,
                      );
                    },
                  ),
                ),
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
                          if (id_partida_publica.isEmpty && _id_partida_privada.text.isEmpty) {
                            mostrarAlerta(context, "Debes seleccionar una partida");
                          }
                          else if (!id_partida_publica.isEmpty && !_id_partida_privada.text.isEmpty) {
                            mostrarAlerta(context, "Debes seleccionar una única partida");
                          }
                          else if (!id_partida_publica.isEmpty) {
                            moverse_a_juego(widget.juego, context, id_partida_publica, false);
                          }
                          else if (!_id_partida_privada.text.isEmpty) {
                            moverse_a_juego(widget.juego, context, _id_partida_privada.text, true);
                          }
                        },
                      ),
                    )),
              ]),
        ),
      ),
    );
  }

  void moverse_a_juego(String juego, BuildContext context, String id_partida, bool privada) {
    if (juego == "blackjack" || juego == "poker") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ElegirFichas(juego : juego, id_partida: id_partida, privada: privada)));
    }
    else {
      Navigator.pop(context);
    }
  }
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Selección incorrecta"),
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
