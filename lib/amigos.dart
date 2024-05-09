import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Amigos extends StatelessWidget {
  final String usuario;
  List<String> items = [];

  Amigos({required this.usuario});

  Future<void> listarAmigos() async {
    var url = 'http://192.168.1.61:20000/api/usuarios/getUsuario?tipo=byNombre&value=' + usuario;
    var respuestaUsuario = await http.get(Uri.parse(url));

    Map<String, dynamic> respuestaJson = jsonDecode(respuestaUsuario.body);
    List<dynamic> amigos = respuestaJson['datos']['amigos'];

    for (var amigo in amigos) {
      items.add(amigo['nombre']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listarAmigos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
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
                Text("400 Fichas"), //Esto se tendrá que sacar de la base de datos
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
                      decoration: InputDecoration(
                        labelText: "Buscar amigos",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        // Aquí puedes implementar la lógica de búsqueda
                      },
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
                            // Añadir amigo
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
                            // Eliminar amigo
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
                              child: Text(items[index]),
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
      },
    );
  }
}
