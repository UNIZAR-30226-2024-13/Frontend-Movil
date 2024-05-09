import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var ocultar;

class Mentiroso extends StatefulWidget {
  @override
  _MentirosoState createState() => _MentirosoState();
}


class _MentirosoState extends State<Mentiroso> {
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
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 27, 123, 22),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: MentirosoTable(),
        ),
      ),
    );
  }
}


class MentirosoTable extends StatefulWidget {
  @override
  _MentirosoTableState createState() => _MentirosoTableState();
}


class _MentirosoTableState extends State<MentirosoTable> {
  // Lista de cartas del jugador
  List<String> cartasJugador = [
    'As de espadas','2 de espadas','3 de espadas','4 de espadas',
    '5 de espadas','6 de espadas','7 de espadas','Sota de espadas',
    'Caballo de espadas','Rey de espadas'
  ];

  // Numero de cartas de cada jugador auxiliar
  List<int> cartas_jugadores = [10, 10, 10];
  // Lista de estado de cartas (seleccionadas)
  List<bool> cartasSeleccionadas = List.generate(10, (index) => false);
  // Lista de cartas en la mesa
  List<String> cartasEnMesa = [];
  int numeroSeleccionado = 0;
  int numeroCartasSeleccionadas = 0;
  String mensajeSuperior = '';
  int _cartasMesaInicioIndex = 0; // Índice de inicio de las cartas mostradas en la mesa




  void actualizarEstado() {
    setState(() {});
  }

  void tirarCartas() {
    // Verificar si hay al menos una carta seleccionada y si la pantalla no se ha mostrado
    // Mover cartas seleccionadas a la mesa y eliminarlas de la mano del jugador
    for (int i = 0; i < cartasSeleccionadas.length; i++) {
      if (cartasSeleccionadas[i]) {
        cartasEnMesa.add(cartasJugador[i]);
        cartasJugador.removeAt(i);
        cartasSeleccionadas.removeAt(i);
        i--; // Ajustar el índice después de eliminar un elemento
      }
    }
    setState(() {});
  }

  void levantarCartas() {
    // Devolver cartas a la mano
    for (int i = 0; i < cartasEnMesa.length; i++) {
      cartasJugador.add(cartasEnMesa[i]);
      cartasEnMesa.removeAt(i);
      cartasSeleccionadas.add(false);
      i--;
    }
    setState(() {});
  }


  // Lógica para desplazar a la izquierda
  void _scrollLeft() {
    setState(() {
      if (_cartasMesaInicioIndex > 0) {
        _cartasMesaInicioIndex--;
      }
    });
  }

  // Lógica para desplazar a la derecha
  void _scrollRight() {
    setState(() {
      if (_cartasMesaInicioIndex < cartasEnMesa.length - 3) {
        _cartasMesaInicioIndex++;
      }
    });
  }


// Método para mostrar el cuadro de diálogo
  Future<void> _ElegirNumero() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 27, 123, 22),
          title: Text(
            'Selecciona qué número de carta dices que tiras',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(6, (index) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          numeroSeleccionado = index + 1;
                          numeroCartasSeleccionadas = cartasSeleccionadas.where((element) => element).length;
                          tirarCartas();
                          setState(() {
                            mensajeSuperior = 'Ha tirado $numeroCartasSeleccionadas cartas del número $numeroSeleccionado';
                          });
                        },
                        child: Text('${index + 1}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.yellow),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(6, (index) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          numeroSeleccionado = index + 7;
                          numeroCartasSeleccionadas = cartasSeleccionadas.where((element) => element).length;
                          tirarCartas();
                          setState(() {
                            mensajeSuperior = 'Ha tirado $numeroCartasSeleccionadas cartas del número $numeroSeleccionado';
                          });
                        },
                        child: Text('${index + 7}'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.yellow),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ListView horizontal para cartas en la mesa
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 35, // Posición vertical centrada
          left: MediaQuery.of(context).size.width / 2 - 230,
          right: 0,
          child: Container(
            height: 40,
            child: ListView.builder(
              itemCount: (cartasEnMesa.length) > 3 ? 3 : cartasEnMesa.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Carta(cartaTexto: cartasEnMesa[index + _cartasMesaInicioIndex], seleccionada: false,
                  onPressed: () {},);
              },
            ),
          ),
        ),

        // Botones de flecha para desplazamiento lateral
        if (cartasEnMesa.length > 3) ...[
          Positioned(
            left: 107,
            top: MediaQuery.of(context).size.height / 2 - 56,
            child: IconButton(
              icon: Icon(Icons.arrow_left),
              iconSize: 65,
              onPressed: _scrollLeft,
              color: Colors.yellow,
            ),
          ),
          Positioned(
            right: 110,
            top: MediaQuery.of(context).size.height / 2 - 56,
            child: IconButton(
              icon: Icon(Icons.arrow_right),
              iconSize: 65,
              onPressed: _scrollRight,
              color: Colors.yellow,
            ),
          ),
        ],
        // Texto en la parte superior
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              mensajeSuperior,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
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

        // Botón pedir carta
        Positioned(
          right: 20,
          top: 8,
          child: ElevatedButton(
            onPressed: () {
              levantarCartas();
            },
            child: Text("Levantar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
        ),
        // Botón plantarse
        Positioned(
          right: 145,
          top: 8,
          child: ElevatedButton(
            onPressed: () {
              // Llamar a la función para
              if (cartasSeleccionadas.contains(true)) {
                _ElegirNumero(); // Elige que carta dice que va a tirar
              }
            },
            child: Text("Tirar"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
                for (int i = 0; i < 2; i++)
                  CartaExtra(con_numero: false, numero: 0),
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
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // Cartas del jugador principal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var carta in cartasJugador)
                    Carta(
                      cartaTexto: carta,
                      seleccionada: cartasSeleccionadas[cartasJugador.indexOf(carta)],
                      onPressed: () {
                        setState(() {
                          cartasSeleccionadas[cartasJugador.indexOf(carta)] = !cartasSeleccionadas[cartasJugador.indexOf(carta)];
                        });
                      },
                    ),
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
                'assets/logo.png',
                fit: BoxFit.contain, // Ajustar la imagen al contenedor
              ),
            ),
          ),
          Text(
            numero.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
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
}

class Carta extends StatelessWidget {
  final String cartaTexto;
  final bool seleccionada;
  final VoidCallback onPressed;

  Carta({required this.cartaTexto, required this.seleccionada, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: 144,
        height: 37,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            cartaTexto,
          ),
          style: ButtonStyle(
            backgroundColor: seleccionada ? MaterialStateProperty.all(Colors.cyanAccent) : MaterialStateProperty.all(Colors.yellow),
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
