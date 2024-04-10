import 'package:flutter/material.dart';

class amigos extends StatelessWidget {
  amigos({ Key? key }) : super(key: key);

  final List<String> items = List<String>.generate(10000, (i) => '$i');

  @override
  Widget build(BuildContext context){
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
                  'Amigo ${items[index]}',
                  style: TextStyle(color: Colors.yellow)
                ),
                subtitle: Text(
                  'Description',
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