import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:CartaVerse/globals.dart';

class Amigos extends StatefulWidget {
  final String usuario;
  final String sessionId;
  final String sessionToken;

  Amigos({required this.usuario, required this.sessionId, required this.sessionToken});

  @override
  _AmigosState createState() => _AmigosState();
}

class _AmigosState extends State<Amigos> {
  List<String> items = [];
  TextEditingController _texto_amigo = TextEditingController();

  @override
  void initState() {
    super.initState();
    listarAmigos();
  }

  Future<void> listarAmigos() async {
    var url = 'http://' + ip + ':20000/api/usuarios/getUsuario?tipo=byNombre&value=' + widget.usuario
              + "&usuarioSesion=" + widget.sessionId + "&sessionToken=" + widget.sessionToken;
    var respuestaUsuario = await http.get(Uri.parse(url));

    Map<String, dynamic> respuestaJson = jsonDecode(respuestaUsuario.body);
    if (respuestaJson['status']) {
      List<dynamic> amigos = respuestaJson['datos']['amigos'];
      setState(() {
        items.clear();
        for (var amigo in amigos) {
          items.add(amigo['nombre']);
        }
      });
    }
    else {
      mostrarAlerta(context, "Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('assets/logo.png'),
        ),
        title: Text("Amigos"),
        actions: <Widget>[
          Text("400 Fichas"),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('assets/silueta.jpg'),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 123, 22),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _texto_amigo,
                decoration: InputDecoration(
                  labelText: "Buscar amigos",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Añadir"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    onPressed: () {
                      agnadir_amigo(context, widget.usuario, _texto_amigo.text);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Eliminar"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    onPressed: () {
                      eliminar_amigo(context, widget.usuario, _texto_amigo.text);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 2.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.yellow,
                      ),
                      title: Text('${items[index]}',
                          style: TextStyle(color: Colors.yellow)),
                      trailing: Icon(Icons.drag_handle,
                          color: Colors.yellow),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void agnadir_amigo(BuildContext context, String usuario, String amigo) async {
    if (!amigo.isEmpty) {
      if (items.contains(amigo)) {
        mostrarAlerta(context, "Amigo ya registrado");
      } else {
        var url = 'http://' + ip + ':20000/api/usuarios/addAmigo?nombreUsuario=' + usuario + '&nombreAmigo=' + amigo
        + "&usuarioSesion=" + widget.sessionId + "&sessionToken=" + widget.sessionToken;

        var respuestaUsuario = await http.post(Uri.parse(url));
        Map<String, dynamic> respuesta_json = jsonDecode(respuestaUsuario.body);
        if (respuesta_json['status']) {
          listarAmigos();
        }
        else {
          mostrarAlerta(context, "El usuario escrito no existe");
        }
      }
    }
    else {
      mostrarAlerta(context, "Debes escribir el nombre de un usuario para añadirlo como amigo");
    }
  }


  void eliminar_amigo(BuildContext context, String usuario, String amigo) async {
    if (!amigo.isEmpty) {
      if (!items.contains(amigo)) {
        mostrarAlerta(context, "Amigo no registrado");
      } else {
        var url = 'http://' + ip + ':20000/api/usuarios/deleteAmigo?nombreUsuario=' + usuario + '&nombreAmigo=' + amigo
        + "&usuarioSesion=" + widget.sessionId + "&sessionToken=" + widget.sessionToken;
        
        var respuestaUsuario = await http.delete(Uri.parse(url));
        Map<String, dynamic> respuesta_json = jsonDecode(respuestaUsuario.body);
        if (respuesta_json['status']) {
          listarAmigos();
        }
        else {
          mostrarAlerta(context, "El usuario escrito no existe");
        }
      }
    }
    else {
      mostrarAlerta(context, "Debes escribir el nombre de un usuario para eliminarlo como amigo");
    }
  }


  void mostrarAlerta(BuildContext context, String mensaje) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Reintentar"))
            ]));
  }
}
