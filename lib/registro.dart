import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro")
      ),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 323.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'País',
                  ),
                ),
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
    );
  }
}