import 'package:flutter/material.dart';

class EntrarSala extends StatefulWidget {
  final String personName;
  const EntrarSala({Key? key, required this.personName}) : super(key: key);

  @override
  State<EntrarSala> createState() => _EntrarSalaState();
}

class _EntrarSalaState extends State<EntrarSala> {
  String codigoSala = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrando na Sala')),
      body: Center(
          child: SizedBox(
        width: 275,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              child: Text(
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  'Olá, ${widget.personName}!'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Digite o código da sala',
                    style: TextStyle(fontSize: 16)),
                TextField(
                  onChanged: (text) {
                    codigoSala = text;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Entrar', style: TextStyle(fontSize: 16)),
                    ),
                    onPressed: () => {
                      if (codigoSala == '')
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Por favor, digite o código da sala."),
                                duration: Duration(seconds: 1)),
                          )
                        }
                      else
                        {
                          //Navigator.push(
                          //  context,
                          //  MaterialPageRoute(builder: (context) => SalaAluno()),
                          //)
                        }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
