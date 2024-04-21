import 'package:flutter/material.dart';

void main() {
  runApp(UnoGame());
}

class UnoGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNO Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UnoGamePage(),
    );
  }
}

class UnoGamePage extends StatefulWidget {
  @override
  _UnoGamePageState createState() => _UnoGamePageState();
}

class _UnoGamePageState extends State<UnoGamePage> {
  List<String> playerCards = [
    'Red 1',
    'Blue 2',
    'Green 3',
    'Yellow 4',
    // Agrega más cartas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNO Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MANO',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: playerCards.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: ListTile(
                      title: Text(playerCards[index]),
                      onTap: () {
                        // Aquí puedes implementar la lógica para manejar la selección de la carta
                        print('Selected card: ${playerCards[index]}');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
