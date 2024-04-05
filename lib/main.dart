import 'package:flutter/material.dart';
import 'package:frontend_movil/registro.dart';

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
      body: 
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/logo.png'
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    print("Aqui tengo que poner la funció de acceder");
                  },
                  child: Text("Acceder"),
                )
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                height: 45,
                child: ElevatedButton(
                  child: Text("Registrar"),
                  onPressed: () =>{
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => Registro())
                    )
                  },
                )

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
            SizedBox(
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

Widget botonAcceder(){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 0,
    ),
    onPressed: (){},
    child: Text("Boton")
  );
}