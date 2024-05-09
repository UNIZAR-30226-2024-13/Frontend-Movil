import 'package:CartaVerse/elegirFichas.dart';
import 'package:flutter/material.dart';

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

TextEditingController _id_partida = TextEditingController();

class MenuCreacion extends StatelessWidget {
  final String juego;
  const MenuCreacion({required this.juego});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Text("400 Fichas"),
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
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    controller: _id_partida,
                    style: TextStyle(
                      color: Colors.black
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow
                        )
                      ),
                      labelText: 'ID de la partida',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Privada",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SwitchPrivada()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
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
                      if (_id_partida.text.isEmpty) {
                        mostrarAlerta(context, "Se debe elegir un identificador de la partida");
                      }
                      else {
                        verificar_creacion(_id_partida.text, privada, juego, context);
                      }
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

void verificar_creacion(String id_partida, bool privada, String juego, BuildContext context) {
  if (juego == "poker" || juego == "blackjack") {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ElegirFichas(juego: juego, id_partida: id_partida, privada: privada)));
  }
  else {
    Navigator.pop(context);
  }
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Creación de partida incorrecta"),
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