import 'package:flutter/material.dart';
import 'package:frontend_movil/home.dart';
import 'package:frontend_movil/registro.dart';
import 'package:frontend_movil/Cinquillo.dart';

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
        SingleChildScrollView(
          child: Column(
            children: <Widget> [
              SizedBox(
                width: 323.0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/logo.png'
                  )
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
                      enabledBorder: OutlineInputBorder(),
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
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Home())
                      )
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
                    child: Text("Registro"),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Registro())
                      )
                    },
                  )

                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 323.0,
                  height: 45,
                  child: ElevatedButton(
                    child: Text("Prueba"),
                    onPressed: () =>{
                      mostrarAlerta(context)
                    },
                  )

                )
              ),
            ]
          )
        ) 
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
//Text(_registrado ? "Ok" : "No registrado")
void mostrarAlerta(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder:  (context) => AlertDialog(
      title: Text("Hola"),
      content: Text("buenas"),
      actions: <Widget>
      [
        ElevatedButton(
          onPressed: (){
            Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CinquilloGame())
                      );
          }, 
          child: Text("No")
        ),
      ]
    )
  );
}