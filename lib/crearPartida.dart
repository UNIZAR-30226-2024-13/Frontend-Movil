import 'package:flutter/material.dart';
import 'package:frontend_movil/MenuCreacion.dart';
import 'package:frontend_movil/home.dart';


class crearPartida extends StatelessWidget {
  const crearPartida({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //shape: Border(bottom: BorderSide(color: Colors.black, width: 2)),
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Home())
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset('assets/logo.png'),
            ),
          ),
        title: Text("Crear"),
        actions: <Widget>[
          Text("400 Fichas"),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_española.png'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Mentiroso"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MenuCreacion())
                      )
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_española.png'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Cinquillo"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MenuCreacion())
                      )
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_francesa.jpg'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("Póker"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MenuCreacion())
                      )
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_francesa.jpg'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("BlackJack"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MenuCreacion())
                      )
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_UNO.webp'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextButton(
                    child: Text("UNO"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MenuCreacion())
                      )
                    },
                  ),
                )
              ),
            ]
          )
        )
      )
    );
  }
}