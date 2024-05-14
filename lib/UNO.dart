import 'package:flutter/material.dart';

void main() {
  runApp(UnoGame());
}

class UnoGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UnoGamePage(),
    );
  }
}

class UnoGamePage extends StatefulWidget {
  @override
  _UnoGamePageState createState() => _UnoGamePageState();
}

class _UnoGamePageState extends State<UnoGamePage> {
  List<String> playerCards = [
    'Red 1',
    'Blue 2',
    'Green 3',
    'Yellow 4',
    '+4',
    'Salto',
    'Camb sen',
    'Blue 7',
    '+2',
    '+2',
    // Agregar más cartas según sea necesario
  ];

  String playedCard = 'Blue 3'; // Carta jugada en el centro

  // Ejemplo de número de cartas para cada jugador
  int numCartasJugador1 = 7;
  int numCartasJugador2 = 7;
  int numCartasJugador3 = 7;

  // Variable para controlar si se muestran todas las cartas
  bool mostrarTodasLasCartas = false;

  // Método para manejar la selección de una carta
  void _onCardSelected(String card) {
    setState(() {
      // Actualizar la carta jugada en el centro
      playedCard = card;
      // Eliminar la carta seleccionada de las cartas del jugador
      playerCards.remove(card);
    });
  }

  // Método para manejar el botón "Ver todas"
  void _onVerTodasPressed() {
    setState(() {
      mostrarTodasLasCartas = true;
    });
  }

  // Método para manejar el botón de robar carta
  void _onRobarCarta() {
    setState(() {
      // Simular robo de carta (aquí puedes agregar la lógica real)
      playerCards.add('Nueva Carta');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNO'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
        ),
        child: Stack(
          children: [
            // Resto del contenido del juego aquí
            // Contenedor para las cartas del jugador
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: () {
                            if (mostrarTodasLasCartas) {
                              return playerCards.map((card) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Lógica para manejar la selección de la carta
                                      _onCardSelected(card);
                                    },
                                    child: Text(card),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      textStyle: MaterialStateProperty.all(TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ))
                                    ),
                                  ),
                                );
                              }).toList();
                            } else {
                              return playerCards.take(5).map((card) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Lógica para manejar la selección de la carta
                                      _onCardSelected(card);
                                    },
                                    child: Text(card),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      textStyle: MaterialStateProperty.all(TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ))
                                    ),
                                  ),
                                );
                              }).toList();
                            }
                          }(),
                        ),
                      ),
                    ),
                    if (playerCards.length > 5 && !mostrarTodasLasCartas)
                      ElevatedButton(
                        onPressed: _onVerTodasPressed,
                        child: Text('Ver todas'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.yellow),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ))
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Contenedor para el número de cartas del Jugador 1
            Positioned(
              left: 16,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jugador 1',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '$numCartasJugador1',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Contenedor para el número de cartas del Jugador 2
            Positioned(
              right: 16,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Jugador 2',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '$numCartasJugador2',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Contenedor para el número de cartas del Jugador 3
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Jugador 3',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      '$numCartasJugador3',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Contenedor para el botón de robar carta
            Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height / 2 - 50,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _onRobarCarta,
                    child: Text('Robar Carta'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ))
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            // Contenedor para la carta jugada en el centro
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2 - 50,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica si se quiere hacer algo al tocar la carta jugada
                  },
                  child: Text(
                    playedCard,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ))
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
