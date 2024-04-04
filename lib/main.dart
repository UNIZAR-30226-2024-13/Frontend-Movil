import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({ super.key });

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("title"),
      ),

      body: 
        ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Image.network("https://static.wikia.nocookie.net/naruto/images/1/12/La_Promesa_de_Naruto.png/revision/latest?cb=20110825232746&path-prefix=es"), 
            ),
          ],
        )

    );

  }
}