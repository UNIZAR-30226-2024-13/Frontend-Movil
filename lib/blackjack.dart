import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart';

var ocultar;

class Blackjack extends StatefulWidget {
  @override
  _BlackjackState createState() => _BlackjackState();
}


class _BlackjackState extends State<Blackjack> {
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
          automaticallyImplyLeading: false,
          title: Text(
            '1M fichas disponibles',
            style: TextStyle(
              fontSize: 19.5,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
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

  // Numero de cartas de cada jugador auxiliar
  List<int> cartas_jugadores = [2, 2, 2];

  // Controlador de fichas a apostar
  TextEditingController _text_fichas = TextEditingController();

  void verificar_apuesta() {

  }

  void actualizarCartasJugador() {
    setState(() {
      cartasJugador.add('Carta auxiliar'); // Añadir carta auxiliar a la lista de cartas del jugador
    });
  }

  void actualizarEstado() {
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Cartas auxiliares
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 4 - 15,
          child: CartaExtra(con_numero: false, numero: 0),
        ),
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 4 * 3 - 160,
          child: CartaExtra(con_numero: true, numero: cartas_jugadores.elementAt(1)),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height / 4 - 15,
          child: CartaExtra(con_numero: false, numero: 0),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).size.height / 4 * 3 - 160,
          child: CartaExtra(con_numero: true, numero: cartas_jugadores.elementAt(2)),
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
              //String input = _text_fichas.text;
              _text_fichas.clear();
              //int apuesta = sanitizar_fichas(input);
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
              actualizarCartasJugador(); // Llamar a la función para añadir carta auxiliar
            },
            child: Text("Pedir carta"),
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
          right: 125,
          top: 0,
          child: ElevatedButton(
            onPressed: () {
              // Llamar a la función para plantarse
            },
            child: Text("Plantarse"),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Cartas jugador auxiliar de arriba
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 2; i++) CartaExtra(con_numero: false, numero: 0),
                Text(
                  cartas_jugadores.elementAt(0).toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
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
                child: CartasCroupier(turnoFinal: false),
              )
            ),

            // Cartas del jugador principal
            CartasJugador(lista: cartasJugador, estado: actualizarEstado),
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

  void actualizarCartasCroupier(String carta_nueva_croupier) {
    setState(() {
      cartasCroupier.add(carta_nueva_croupier);
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
          CartaExtra(con_numero: false, numero: 0),
        ],
      );
    }
  }
}


class CartaExtra extends StatelessWidget {
  final bool con_numero;
  final int numero;

  CartaExtra({required this.con_numero, required this.numero});

  @override
  Widget build(BuildContext context) {
    if (con_numero) {
      return Column(
        children: [
          Container(
          padding: EdgeInsets.all(5),
          child: SizedBox(
            width: 50, // Ancho de la imagen
            height: 50, // Alto de la imagen
            child: Image.asset(
              path_reverso,
              fit: BoxFit.contain, // Ajustar la imagen al contenedor
            ),
          ),
          ),
          Text(
            numero.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ]
      );
    }
    else {
      return Container(
        padding: EdgeInsets.all(5),
        child: SizedBox(
          width: 50, // Ancho de la imagen
          height: 50, // Alto de la imagen
          child: Image.asset(
            path_reverso,
            fit: BoxFit.contain, // Ajustar la imagen al contenedor
          ),
        ),
      );
    }
  }
}


class CartasJugador extends StatelessWidget {
  final List<String> lista;
  final Function estado;
  CartasJugador({required this.lista, required this.estado});

  @override
  Widget build(BuildContext context) {
    var num_cartas = lista.length;
    if (ocultar) {
      if (num_cartas < 5) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var carta in lista) Carta(cartaTexto: carta),
          ],
        );
      }
      else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++) Carta(cartaTexto: lista.elementAt(i)),
              ElevatedButton(
              onPressed: () {
                ocultar = false;
                estado();
              },
              child: Text("->"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color_carta()),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                )),
              ), 
            ),
          ],
        );
      }
    }
    else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var carta in lista) Carta(cartaTexto: carta),
          ],
        ),
      );
    }
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
            backgroundColor: MaterialStateProperty.all(color_carta()),
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

Color? color_carta() {
  switch (color_cartas) {
    case "amarillo":
      return Colors.yellow;
    case "azul":
      return Colors.blue;
    case "naranja":
      return Colors.orange;
    case "morado":
      return Colors.purple;
  }
  return null;
}
