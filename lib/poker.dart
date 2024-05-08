import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var ocultar;

class Poker extends StatefulWidget {
  @override
  _PokerState createState() => _PokerState();
}


class _PokerState extends State<Poker> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ocultar = true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('1M fichas disponibles', style: TextStyle(fontSize: 19.5)),
              Text('Última apuesta: 3M fichas',style: TextStyle(fontSize: 19.5)),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 27, 123, 22),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: PokerTable(),
          ),
      ),
    );
  }
}


class PokerTable extends StatefulWidget {
  @override
  _PokerTableState createState() => _PokerTableState();
}


class _PokerTableState extends State<PokerTable> {
  // Lista de cartas del jugador
  List<String> cartasJugador = ['As de picas', '7 de treboles'];

  // Lista de cartas de la mesa
  List<String> cartasMesa = ['4 de diamante', '12 de corazones'];

  // Controlador de fichas a apostar
  TextEditingController _text_fichas = TextEditingController();

  void actualizarEstado() {
    setState(() {});
  }

  void sumar_carta_mesa(String carta) {
    cartasMesa.add(carta);
    actualizarEstado();
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

  void verificar_apuesta() {

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Cartas auxiliares
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

        // Cuadro de texto para apostar
        Positioned(
          left: 0,
          top: 4,
          child: SizedBox(
            width: 100.0,
            height: 40.0,
            child: TextField(
              controller: _text_fichas,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          )
        ),

        // Botón de apostar
        Positioned(
          left: 105,
          top: 0,
          child: ElevatedButton(
            onPressed: () {
              String input = _text_fichas.text;
              _text_fichas.clear();
              int apuesta = sanitizar_fichas(input);
              verificar_apuesta();
              // Función apostar

            },
            child: Text("Apostar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              )),
            ), 
          ),
        ),

        // Botón pedir carta
        Positioned(
          right: 0,
          top: 0,
          child: ElevatedButton(
            onPressed: () {
              // Igualar apuesta
            },
            child: Text("Igualar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              )),
            ), 
          ),
        ),

        // Botón plantarse
        Positioned(
          right: 100,
          top: 0,
          child: ElevatedButton(
            onPressed: () {
              sumar_carta_mesa("Carta auxiliar");
            },
            child: Text("Retirarse"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              )),
            ), 
          ),
        ),

        Column(
          children: [
            // Cartas jugador auxiliar de arriba
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 2; i++) CartaExtra(),
                ],
              ),
            ),

            // Espacio en el medio
            Expanded(
              child: Container(
                width: 710,
                height: 625,
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 2.0),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var carta in cartasMesa) Carta(cartaTexto: carta),
                    ],
                  ),
                ),
              )
            ),

            // Cartas del jugador principal
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var carta in cartasJugador) Carta(cartaTexto: carta),
                ],
              ),
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
          'assets/carta.png',
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
        width: 136,
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
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
