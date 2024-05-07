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
  List<String> cartasJugador = ['As de espadas','2 de espadas','3 de espadas','4 de espadas',
    '5 de espadas','6 de espadas','7 de espadas','Sota de espadas','Caballo de espadas','Rey de espadas'];

  // Numero de cartas de cada jugador auxiliar
  List<int> cartas_jugadores = [10, 10, 10];
  // Listado de cartas seleccionadas
  List<bool> cartasSeleccionadas = List.generate(10, (index) => false);

  void actualizarEstado() {
    setState(() {});
  }

  void onCartaPressed(int index) {
    setState(() {
      cartasSeleccionadas[index] = !cartasSeleccionadas[index];
    });
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


        // Botón pedir carta
        Positioned(
          right: 20,
          top: 8,
          child: ElevatedButton(
            onPressed: () {
            },
            child: Text("Levantar"),
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
          right: 145,
          top: 8,
          child: ElevatedButton(
            onPressed: () {
              // Llamar a la función para tirar
            },
            child: Text("Tirar"),
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
                )
            ),

            // Cartas del jugador principal
            CartasJugador(
              lista: cartasJugador,
              estado: actualizarEstado,
              seleccionadas: cartasSeleccionadas,
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
            'assets/logo.png',
            fit: BoxFit.contain, // Ajustar la imagen al contenedor
          ),
        ),
      );
    }
  }
}


class CartasJugador extends StatelessWidget {
  final List<String> lista;
  final List<bool> seleccionadas;
  final Function estado;

  CartasJugador({
    required this.lista,
    required this.estado,
    required this.seleccionadas,
  });


  @override
  Widget build(BuildContext context) {
    var num_cartas = lista.length;
    if (ocultar) {
      if (num_cartas < 5) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var carta in lista) Carta(cartaTexto: carta, seleccionada: seleccionadas[lista.indexOf(carta)]),
          ],
        );
      }
      else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++) Carta(cartaTexto: lista.elementAt(i),seleccionada: seleccionadas[i]),
            ElevatedButton(
              onPressed: () {
                ocultar = false;
                estado();
              },
              child: Text("->"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
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
            for (var carta in lista) Carta(
              cartaTexto: carta,
              seleccionada: seleccionadas[lista.indexOf(carta)],
            ),
          ],
        ),
      );
    }
  }
}



class Carta extends StatelessWidget {
  final String cartaTexto;
  final bool seleccionada;

  Carta({
    required this.cartaTexto,
    required this.seleccionada,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: 144,
        height: 37,
        child: ElevatedButton(
          onPressed: () {
          },
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
