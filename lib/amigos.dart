import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class amigos extends StatelessWidget {

  final String usuario;

  List<String> items = [];

  amigos({required this.usuario});

  Future<void> listar_amigos() async {
    var url = 'http://192.168.1.61:20000/api/usuarios/getUsuario?tipo=byNombre&value=' + usuario;
    var respuesta_usuario = await http.get(Uri.parse(url));

    Map<String, dynamic> respuesta_json = jsonDecode(respuesta_usuario.body);
    List<dynamic> amigos = respuesta_json['datos']['amigos'];

    for (var amigo in amigos) {
      items.add(amigo['nombre']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: listar_amigos(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container();
      }
      else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            shape: Border.all(color: Colors.black, width: 2.0),
            leading: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                'assets/logo.png'
              ),
            ),
            title: Text("Amigos"),
            actions: <Widget>[
              Text("400 Fichas"), //Esto se tendrá que sacar de la base de datos
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/silueta.jpg'
                ),
              ),
            ]
          ),
          body:  Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 27, 123, 22),
              border: Border.all(color: Colors.black, width: 2.0) ,
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 2.0),
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text(items[index])
                    ),
                    title: Text(
                      '${items[index]}',
                      style: TextStyle(color: Colors.yellow)
                    ),
                    trailing: Icon(
                      Icons.drag_handle,
                      color: Colors.yellow
                    ),
                  );
                },
              )
            )
          )
        );
      }
    }
    );
  }
}