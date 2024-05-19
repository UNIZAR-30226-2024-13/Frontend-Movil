import 'package:CartaVerse/globals.dart';
import 'package:CartaVerse/cargando_partida.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

bool privada = false;

class SwitchPrivada extends StatefulWidget {
  const SwitchPrivada({super.key});

  @override
  State<SwitchPrivada> createState() => _SwitchPrivadaState();
}

class _SwitchPrivadaState extends State<SwitchPrivada> {

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: thumbIcon,
      value: privada,
      activeColor: Colors.yellow,
      onChanged: (bool value) {
        setState(() {
          privada = value;
        });
      },
    );
  }
}

class crearPartida extends StatelessWidget {
  final String usuario;
  final String sessionId;
  final String sessionToken;

  const crearPartida({required this.usuario, required this.sessionId, required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('assets/logo.png'),
          ),
        ),
        title: Text("Crear partida"),
        actions: <Widget>[
          Text(fichas_usuario.toString() + " fichas"),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/silueta.jpg'
            ),
          ),
        ]
      ),
      body:  Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Privada",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SwitchPrivada()
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_española.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Mentiroso"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () {
                      crear_partida(context, "mentiroso", sessionId, sessionToken);
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_española.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Cinquillo"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () {
                      crear_partida(context, "cinquillo", sessionId, sessionToken);
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_francesa.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Póker"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () {
                      crear_partida(context, "poker", sessionId, sessionToken);
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_francesa.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("BlackJack"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () {
                      crear_partida(context, "blackjack", sessionId, sessionToken);
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_UNO.webp'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.65),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("UNO"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () {
                      crear_partida(context, "uno", sessionId, sessionToken);
                    },
                  ),
                )
              ),
            ]
          )
        )
      )
    );
  }
}


void crear_partida(BuildContext context, String juego, String usuarioSesion, String sessionToken) async {
  var link = "";
  if (juego == "mentiroso") {
    link = "mentiroso/addMentiroso";
  }
  else {
    link = "mentiroso/addMentiroso";
    // Otros strings
  }
  try {
    var url = 'http://' + ip + ':20000/api/juegos/' + link +'?usuarioSesion=' + usuarioSesion + "&sessionToken=" + sessionToken + "&esPrivada=" + privada.toString();
    var respuesta_usuario = await http.post(Uri.parse(url));
    Map<String, dynamic> respuesta_json = jsonDecode(respuesta_usuario.body);

    if (!respuesta_json['status']) {
      mostrarAlerta(context, 'No se ha podido crear la partida');
    }
    else {
      var id_partida = respuesta_json['datos']['id'];
      Navigator.push(context, MaterialPageRoute(builder: (context) => CargandoPartida(juego : juego, id_partida: id_partida, sessionId: usuarioSesion, sessionToken: sessionToken)));
    }
  }
  catch (error) {
    mostrarAlerta(context, "Error no controlado");
  }
}


void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Error al crear"),
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
