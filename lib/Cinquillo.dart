import 'package:flutter/material.dart';

void main() {
  runApp(CinquilloGame());
}

class CinquilloGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CinquilloGamePage(),
    );
  }
}

class CinquilloGamePage extends StatefulWidget {
  @override
  _CinquilloGamePageState createState() => _CinquilloGamePageState();
}

class _CinquilloGamePageState extends State<CinquilloGamePage> {
  List<String> playerCards = [
    'Rey de Oros',
    'Caballo de Copas',
    'As de Espadas',
    'Sota de Bastos',
    '7 de Oros',
    '5 de Copas',
    '10 de Espadas',
    '2 de Bastos',
    '3 de Oros',
    '9 de Copas',
    // Agregar más cartas según sea necesario
  ];

  List<String> playedCards = [
    '2 de Oros'
  ]; // Cartas jugadas en el centro

  // Ejemplo de número de cartas para cada jugador
  int numCartasJugador1 = 10;
  int numCartasJugador2 = 10;
  int numCartasJugador3 = 10;

  // Variable para controlar si se muestran todas las cartas
  bool mostrarTodasLasCartas = false;

  // Mapa para almacenar la última carta jugada por palo
  Map<String, String> lastPlayedBySuit = {
    'Oros': '',
    'Copas': '',
    'Espadas': '',
    'Bastos': '',
  };

  // Método para manejar la selección de una carta
  void _onCardSelected(String card) {
    setState(() {
      // Agregar la carta jugada al centro
      playedCards.add(card);
      // Guardar la última carta jugada por palo
      String? suit = card.split(' ')[2]; // Verificación de nulidad agregada aquí
      if (suit != null && lastPlayedBySuit.containsKey(suit)) {
        lastPlayedBySuit[suit] = card;
      }
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
      // Agregar una nueva carta al jugador
      playerCards.add('Nueva Carta');
    });
  }

  // Método para manejar el botón "Nueva Carta"
  void _onNuevaCarta() {
    // Aquí puedes agregar lógica adicional si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinquillo'),
        backgroundColor: Colors.red,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Container(width: 300), // Contenedor transparente a la derecha
            ],
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
        ), // Fondo verde
        child: Stack(
          children: [
            // Botones para las últimas cartas jugadas por palo
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: lastPlayedBySuit['Copas'] != '',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(lastPlayedBySuit['Copas'] ?? ''),
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
                  Visibility(
                    visible: lastPlayedBySuit['Oros'] != '',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(lastPlayedBySuit['Oros'] ?? ''),
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
                  Visibility(
                    visible: lastPlayedBySuit['Espadas'] != '',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(lastPlayedBySuit['Espadas'] ?? ''),
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
                  Visibility(
                    visible: lastPlayedBySuit['Bastos'] != '',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(lastPlayedBySuit['Bastos'] ?? ''),
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
                ],
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
                          children: [
                            for (int i = 0; i < (mostrarTodasLasCartas ? playerCards.length : 5) && i < playerCards.length; i++)
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Lógica para manejar la selección de la carta
                                    _onCardSelected(playerCards[i]);
                                  },
                                  child: Text(playerCards[i]),
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
                          ],
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
          ],
        ),
      ),
    );
  }
}
