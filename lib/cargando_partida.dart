import 'package:CartaVerse/globals.dart';
import 'package:CartaVerse/mentiroso.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class _CargandoPartidaState extends State<CargandoPartida> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void actualizarPartida() async {
    var link = "";
    if (widget.juego == "mentiroso") {
      link = "mentiroso/getMentiroso/";
    }
    else {
      // Otros strings
      link = "mentiroso/getMentiroso/";
    }
    var url = 'http://' + ip + ':20000/api/juegos/' + link + widget.id_partida + '?usuarioSesion=' + widget.sessionId + "&sessionToken=" + widget.sessionToken;
    var respuestaUsuario = await http.get(Uri.parse(url));

    Map<String, dynamic> respuestaJson = jsonDecode(respuestaUsuario.body);
    if (respuestaJson['status']) {
      List<dynamic> usuarios = respuestaJson['datos']['guarda'];
      if (usuarios.length == 4) {
        if (widget.juego == "mentiroso") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Mentiroso(id_partida: widget.id_partida, sessionId: widget.sessionId, sessionToken: widget.sessionToken)));
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Mentiroso(id_partida: widget.id_partida, sessionId: widget.sessionId, sessionToken: widget.sessionToken)));
        }
      }
    }
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      actualizarPartida();
    });
  }

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
        child: Text("Esperando jugadores",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
      ),
      )
    );
  }

}


class CargandoPartida extends StatefulWidget  {
  final String juego;
  final String id_partida;
  final String sessionId;
  final String sessionToken;

  const CargandoPartida({required this.juego, required this.id_partida, required this.sessionId, required this.sessionToken});

  @override
  _CargandoPartidaState createState() => _CargandoPartidaState();
}
