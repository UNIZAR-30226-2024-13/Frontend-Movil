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
  final List<String> cartas_jugador = ['As de picas', '7 de treboles'];

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
              child: CartasCroupier(turno_final: false),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var carta in cartas_jugador) Carta(cartaTexto: carta),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


class CartasCroupier extends StatelessWidget {

  final bool turno_final;
  final List<String> cartas_croupier = ['4 de diamante', '12 de corazones'];

  CartasCroupier({required this.turno_final});

  @override
  Widget build(BuildContext context) {
    if (turno_final) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var carta in cartas_croupier) Carta(cartaTexto: carta),
        ],
      );
    }
    else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Carta(cartaTexto: cartas_croupier[0]),
          CartaExtra()
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
