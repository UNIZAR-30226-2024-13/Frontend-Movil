import 'package:flutter/material.dart';

class Blackjack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blackjack'),
          backgroundColor: Colors.red, // Cambiar el color de la AppBar a rojo
        ),
        body: Container(
          color: Color.fromARGB(255, 27, 123, 22), // Cambiar el color de fondo del body a verde
          child: Padding(
            padding: EdgeInsets.all(5), // Agregar un margen de 5 píxeles en todos los lados
            child: BlackjackTable(),
          ),
        ),
      ),
    );
  }
}

class BlackjackTable extends StatelessWidget {
  // Lista de cartas para cada jugador
  // final List<String> jugador1Cartas = ['Carta 1', 'Carta 2']; // ¡Puedes agregar más cartas aquí!
  final List<String> jugador2Cartas = ['Carta 3', 'Carta 4']; // ¡Puedes agregar más cartas aquí!

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Zona para las cartas del jugador 1
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 2; i++) CartaExtra(),
          ],
        ),
        Expanded(
          child: Container(), // Espacio en el medio
        ),
        // Zona para las cartas del jugador 2
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var carta in jugador2Cartas) Carta(cartaTexto: carta),
          ],
        ),
      ],
    );
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
      margin: EdgeInsets.symmetric(horizontal: 1), // Margen entre cartas de 1 unidad
      child: SizedBox(
        width: 105, // Ancho de la carta
        height: 40, // Alto de la carta
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
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
