import 'package:flutter/material.dart';
import 'package:frontend_movil/home.dart';


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

  String playedCard = '8 de Copas'; // Carta jugada en el centro

  // Ejemplo de número de cartas para cada jugador
  int numCartasJugador1 = 10;
  int numCartasJugador2 = 10;
  int numCartasJugador3 = 10;

  // Variable para controlar si se muestran todas las cartas
  bool mostrarTodasLasCartas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinquillo'),
      ),
      body: Container(
        color: Colors.green, // Fondo verde
        child: Stack(
          children: [
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
                                      print('Selected card: $card');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                      );
                                    },
                                    child: Text(card),
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
                                      print('Selected card: $card');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                      );
                                    },
                                    child: Text(card),
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
                        onPressed: () {
                          setState(() {
                            mostrarTodasLasCartas = true;
                          });
                        },
                        child: Text('Ver todas'),
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
                    style: TextStyle(
                      fontSize: 16.0,
                      backgroundColor: Colors.green, // Fondo verde para el texto
                    ),
                  ),
                  Image.asset(
                    'assets/reverso.jpg',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '$numCartasJugador1',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.green, // Fondo verde para el texto
                    ),
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
                    style: TextStyle(
                      fontSize: 16.0,
                      backgroundColor: Colors.green, // Fondo verde para el texto
                    ),
                  ),
                  Image.asset(
                    'assets/reverso.jpg',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '$numCartasJugador2',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.green, // Fondo verde para el texto
                    ),
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
                      style: TextStyle(
                        fontSize: 16.0,
                        backgroundColor: Colors.green, // Fondo verde para el texto
                      ),
                    ),
                    Image.asset(
                      'assets/anterior.png',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      '$numCartasJugador3',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.green, // Fondo verde para el texto
                      ),
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
                    onPressed: () {
                      // Lógica para robar carta
                      print('Robar carta');
                    },
                    child: Text('Robar Carta'),
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
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(playedCard),
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
