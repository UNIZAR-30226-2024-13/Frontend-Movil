import 'package:flutter/material.dart';


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


class BlackjackTable extends StatelessWidget {

  // Lista de cartas del jugador
  final List<String> cartas = ['Sota de caballos', 'Rey de caballos'];

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
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var carta in cartas) Carta(cartaTexto: carta),
              ],
            ),
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
