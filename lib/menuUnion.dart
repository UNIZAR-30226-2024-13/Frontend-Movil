import 'package:flutter/material.dart';
import 'package:CartaVerse/elegirFichas.dart';
import 'package:CartaVerse/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:CartaVerse/cargando_partida.dart';

class MenuUnion extends StatefulWidget {
  final String juego;
  final String sessionId;
  final String sessionToken;

  MenuUnion({required this.juego, required this.sessionId, required this.sessionToken});

  @override
  _MenuUnionState createState() => _MenuUnionState();
}

class _MenuUnionState extends State<MenuUnion> {
  final List<String> partidasGuardadas = [];
  String id_partida_publica = "";
  String? _selectedPartida;
  TextEditingController _id_partida_privada = TextEditingController();
  String id_partida_privada = "";

  @override
  void initState() {
    super.initState();
    listarPartidas();
  }

  Future<void> listarPartidas() async {
    var link = "";
    if (widget.juego == "mentiroso") {
      link = "mentiroso/getMentirosos";
    }
    else {
      // Otros strings
      link = "mentiroso/getMentirosos";
    }
    try {
      var url = 'http://' + ip + ':20000/api/juegos/'+ link + '?usuarioSesion=' + widget.sessionId + "&sessionToken=" + widget.sessionToken;
      var respuestaUsuario = await http.get(Uri.parse(url));

      Map<String, dynamic> respuestaJson = jsonDecode(respuestaUsuario.body);
      if (respuestaJson['status']) {
        List<dynamic> partidas = respuestaJson['datos'];
        setState(() {
          partidasGuardadas.clear();
          for (var partida in partidas) {
            List<dynamic> guarda = partida['guarda'];
            var num_jugadores = guarda.length.toString();
            partidasGuardadas.add(partida['id'] + " " + num_jugadores);
          }
        });
      }
      else {
        mostrarAlerta(context, "Error");
      }
    }
    catch (error) {
      mostrarAlerta(context, "Error no controlado");
    }
  }


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
                Text(
                  "Partida privada",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
                    fontSize: 20,
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
                            moverse_a_juego(widget.juego, context, id_partida_publica.split(' ')[0], widget.sessionId, widget.sessionToken);
                          }
                          else if (!_id_partida_privada.text.isEmpty) {
                            moverse_a_juego(widget.juego, context, _id_partida_privada.text, widget.sessionId, widget.sessionToken);
                          }
                        },
                      ),
                    )),
              ]),
        ),
      ),
    );
  }

  void moverse_a_juego(String juego, BuildContext context, String id_partida, String usuarioSesion, String sessionToken) {
    if (juego == "blackjack" || juego == "poker") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ElegirFichas(juego : juego, id_partida: id_partida)));
    }
    else {
      entrar_partida(juego + '/' + id_partida, usuarioSesion, sessionToken, context, juego);
    }
  }
}


void entrar_partida(String link, String usuarioSesion, String sessionToken, BuildContext context, String juego) async {
  var url = 'http://' + ip + ':20000/api/juegos/' + link + '/addUsuario?nombreUsuario=' + usuarioSesion + '&usuarioSesion=' + usuarioSesion + "&sessionToken=" + sessionToken;
  var respuesta_usuario = await http.post(Uri.parse(url));
  Map<String, dynamic> respuesta_json = jsonDecode(respuesta_usuario.body);

  if (!respuesta_json['status']) {
    mostrarAlerta(context, respuesta_json['mensaje']);
  }
  else {
    var id_partida = respuesta_json['datos']['id'];
    Navigator.push(context, MaterialPageRoute(builder: (context) => CargandoPartida(juego : juego, id_partida: id_partida, sessionId: usuarioSesion, sessionToken: sessionToken)));
  }
}


void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Error al entrar"),
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
