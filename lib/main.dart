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
        title: const Text("Filas, Columnas y botones"),
      ),

      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max, 
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0) ,
              child: Image.asset(
                'assets/logo.png'
              )
            ),
            Container(
              child: ElevatedButton(
                child: Text("Iniciar Sesión"),
                onPressed: null,
              )
            ),
            Container(
              child: ElevatedButton(
                child: Text("Registrarse"),
                onPressed: null,
              ) 
            ),
            Container(

              child: ElevatedButton(
                child: Text("Confirmar"),
                onPressed: null,
              ) 
            ),
          ]
        )
        
        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max, 
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.5,
              child: Text("hey", textAlign: TextAlign.center,)
            ),
            Text("Hola MrBeast"),
            Text("Hola"),
            Text("Ah")
          ],
        ),
        */
    );

  }
}