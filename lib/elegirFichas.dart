import 'package:CartaVerse/blackjack.dart';
import 'package:CartaVerse/globals.dart';
import 'package:CartaVerse/poker.dart';
import 'package:flutter/material.dart';


TextEditingController _text_fichas = TextEditingController();

class ElegirFichas extends StatelessWidget {
  final String juego;
  final String id_partida;
  final bool privada;

  const ElegirFichas({required this.juego, required this.id_partida, required this.privada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Elegir fichas"),
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png'
          ),
        ),
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
                        controller: _text_fichas,
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
                            int num_fichas = sanitizar_fichas(_text_fichas.text);
                            if (num_fichas == -1) { // AND num_fichas > fichas reales del usuario
                              mostrarAlerta(context, "Debes seleccionar un número de fichas");
                            }
                            else {
                              moverse_a_juego(juego, context);
                            }
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => Poker()));
    }
  }
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Login incorrecto"),
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

int sanitizar_fichas(String input) {
  String numeros = '';
  for (int i = 0; i < input.length; i++) {
    if (int.tryParse(input[i]) != null) {
      numeros += input[i];
    }
  }
  return int.tryParse(numeros) ?? -1;
}
