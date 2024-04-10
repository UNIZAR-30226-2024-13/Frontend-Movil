import 'package:flutter/material.dart';


class unirsePartida extends StatelessWidget {
  const unirsePartida({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //shape: Border(bottom: BorderSide(color: Colors.black, width: 2)),
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            'assets/logo.png'
          ),
        ),
        title: Text("Unirse"),
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
                    image: AssetImage('assets/baraja_española.jpg'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
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
                      /************************************************************* */
                      //Además de insertar los datos del usuario en la base de datos 
                      /************************************************************* */
                      Navigator.pop(context)
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/baraja_española.jpg'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
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
                      /************************************************************* */
                      //Además de insertar los datos del usuario en la base de datos 
                      /************************************************************* */
                      Navigator.pop(context)
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
                  child: ElevatedButton(
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
                      /************************************************************* */
                      //Además de insertar los datos del usuario en la base de datos 
                      /************************************************************* */
                      Navigator.pop(context)
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
                  child: ElevatedButton(
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
                      /************************************************************* */
                      //Además de insertar los datos del usuario en la base de datos 
                      /************************************************************* */
                      Navigator.pop(context)
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
                  child: ElevatedButton(
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
                      /************************************************************* */
                      //Además de insertar los datos del usuario en la base de datos 
                      /************************************************************* */
                      Navigator.pop(context)
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