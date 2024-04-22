import 'package:flutter/material.dart';
import 'package:frontend_movil/home.dart';

class SwitchTorneo extends StatefulWidget {
  const SwitchTorneo({super.key});

  @override
  State<SwitchTorneo> createState() => _SwitchTorneoState();
}

class _SwitchTorneoState extends State<SwitchTorneo> {
  bool torneo = false;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: thumbIcon,
      value: torneo,
      activeColor: Colors.yellow,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          torneo = value;
        });
      },
    );
  }
}

class SwitchPrivada extends StatefulWidget {
  const SwitchPrivada({super.key});

  @override
  State<SwitchPrivada> createState() => _SwitchPrivadaState();
}

class _SwitchPrivadaState extends State<SwitchPrivada> {
  bool privada = false;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: thumbIcon,
      value: privada,
      activeColor: Colors.yellow,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          privada = value;
        });
      },
    );
  }
}


class MenuCreacion extends StatelessWidget {
  final String usuario;

  const MenuCreacion({required this.usuario});

  @override
  Widget build(BuildContext context){

    final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //shape: Border(bottom: BorderSide(color: Colors.black, width: 2)),
        shape: Border.all(color: Colors.black, width: 2.0),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Home(usuario: usuario))
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
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black
                    ),
                    cursorColor: Colors.yellow,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow
                        )
                      ),
                      labelText: 'Nombre',
                      labelStyle: TextStyle(
                        color: Colors.yellow
                      )
                    ),
                  ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Privada",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SwitchPrivada()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Torneo",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    )
                  ),
                  SwitchTorneo()
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: SizedBox(
                  width: 323.0,
                  child: ElevatedButton(
                    child: Text("Confirmar"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ))
                    ),
                    onPressed: () =>{
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