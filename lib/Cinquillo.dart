import 'package:flutter/material.dart';

class Cinquillo extends StatefulWidget {
  @override
  _CinquilloState createState() => _CinquilloState();
}

class _CinquilloState extends State<Cinquillo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Cinquillo', style: TextStyle(fontSize: 19.5)),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 27, 123, 22),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: CinquilloTable(),
          ),
      ),
    );
  }
}

class CinquilloTable extends StatefulWidget {
  @override
  _CinquilloTableState createState() => _CinquilloTableState();
}

class _CinquilloTableState extends State<CinquilloTable> {
  //Se debería repartir de forma aleatoria
  List<String> cartasJugador = [
    '10\nOr',
    '9\nCo',
    '5\nOr',
    '8\nBa',
    '7\nOr',
    '5\nCo',
    '1\nEs',
    '2\nBa',
    '3\nOr',
    '9\nCo',
    '4\nEs'
  ];

  // Ejemplo de número de cartas para cada jugador
  int numCartasJugador1 = 10;
  int numCartasJugador2 = 10;
  int numCartasJugador3 = 10;

  Map<String, List<String>> cartasJugadas = {
    'Or': [],
    'Co': [],
    'Es': [],
    'Ba': [],
  };

  // Método para manejar la selección de una carta 'Rey de Oros'
  void _cartaSeleccionada(String carta) {
    setState(() {
      // Agregar la carta jugada al centro
      String palo = carta.split('\n')[1];
      String valor = carta.split('\n')[0];

      if (cartasJugadas.containsKey(palo)) {
        List<String> cartasPalo = cartasJugadas[palo]!;

        if (_esMasBaja(int.parse(valor), cartasPalo)) {
          cartasPalo.add(carta);
        }else if(_esMasAlta(int.parse(valor), cartasPalo)){
          cartasPalo.insert(0, carta);
        }
      }

      // Eliminar la carta seleccionada de las cartas del jugador
      cartasJugador.remove(carta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  for(var palo in ['Co', 'Or', 'Es', 'Ba'])
                  Column(
                    children: [
                      for (var carta in cartasJugadas[palo]!)
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(carta),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(_colorPalo(palo)),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
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
                            for (int i = 0; i < cartasJugador.length; i++)
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _cartaSeleccionada(cartasJugador[i]);
                                  },
                                  child: Text(cartasJugador[i]),
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

bool _esMasBaja(int carta, List<String> cartasPalo) {
  if (cartasPalo.isEmpty) {
    return true;
  }
  int valor =  int.parse(cartasPalo[cartasPalo.length - 1].split('\n')[0]);
  if(carta < valor){
      return true;
  }
  return false;
}

bool _esMasAlta(int carta, List<String> cartasPalo) {
  if (cartasPalo.isNotEmpty) {
    int valor =  int.parse(cartasPalo[0].split('\n')[0]);
    if(carta > valor){
    return true;
    }
  }
  return false;
}

Color _colorPalo(String palo){
  switch(palo){
    case 'Or':
      return Colors.yellow;

    case 'Co':
      return Colors.red;

    case 'Es':
      return Colors.blue;
    
    case 'Ba':
      return Colors.green;
  }
  return Color.fromARGB(255, 238, 0, 255);
}