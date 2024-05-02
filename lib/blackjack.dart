import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Blackjack(),
    );
  }
}

class Blackjack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blackjack'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Color.fromARGB(255, 27, 123, 22),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: BlackjackTable(),
        ),
      ),
    );
  }
}

class BlackjackTable extends StatefulWidget {
  @override
  _BlackjackTableState createState() => _BlackjackTableState();
}

class _BlackjackTableState extends State<BlackjackTable> {
  // Lista de cartas del jugador
  List<String> cartasJugador = ['As de picas', '7 de treboles'];
  
  String cartaAux = 'Carta auxiliar'; // Carta auxiliar

  void actualizarCartasJugador() {
    setState(() {
      cartasJugador.add(cartaAux); // Añadir carta auxiliar a la lista de cartas del jugador
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 4 - 15,
          child: CartaExtra(),
        ),
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 4 * 3 - 160,
          child: CartaExtra(),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height / 4 - 15,
          child: CartaExtra(),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height / 4 * 3 - 160,
          child: CartaExtra(),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: ElevatedButton(
            onPressed: () {
              actualizarCartasJugador(); // Llamar a la función para añadir carta auxiliar
            },
            child: Text("Pedir carta"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )),
            ), 
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 2; i++) CartaExtra(),
              ],
            ),
            // Espacio en el medio
            Expanded(
              child: CartasCroupier(turnoFinal: false),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var carta in cartasJugador) Carta(cartaTexto: carta),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CartasCroupier extends StatefulWidget {
  final bool turnoFinal;

  CartasCroupier({required this.turnoFinal});

  @override
  _CartasCroupierState createState() => _CartasCroupierState();
}

class _CartasCroupierState extends State<CartasCroupier> {
  // Lista de cartas del croupier
  List<String> cartasCroupier = ['4 de diamante', '12 de corazones'];

  void actualizarCartasCroupier(List<String> nuevasCartas) {
    setState(() {
      cartasCroupier = nuevasCartas;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.turnoFinal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var carta in cartasCroupier) Carta(cartaTexto: carta),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Carta(cartaTexto: cartasCroupier[0]),
          CartaExtra(),
        ],
      );
    }
  }
}

class CartaExtra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: 50, // Ancho de la imagen
        height: 50, // Alto de la imagen
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain, // Ajustar la imagen al contenedor
        ),
      ),
    );
  }
}

class Carta extends StatelessWidget {
  final String cartaTexto;

  Carta({required this.cartaTexto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: 144,
        height: 37,
        child: ElevatedButton(
          onPressed: () => {},
          child: Text(
            cartaTexto,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
