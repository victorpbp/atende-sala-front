import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CriarSala extends StatefulWidget {
  final String personName;
  const CriarSala({Key? key, required this.personName}) : super(key: key);

  @override
  State<CriarSala> createState() => _CriarSalaState();
}

class _CriarSalaState extends State<CriarSala> {
  String roomTitle = '';
  int maxCapacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando a Sala')),
      body: Center(
          child: SizedBox(
        width: 275,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Olá para o Usuário
            Text(
                style: const TextStyle(
                  fontSize: 30,
                ),
                'Bem vindo, ${widget.personName}!'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Digitar Título da Sala
                const Text('Digite o nome da sala',
                    style: TextStyle(fontSize: 16)),
                TextField(
                  onChanged: (text) {
                    roomTitle = text;
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Digitar Número Máximo de Alunos na Sala

                const Text('Digite a quantidade máxima de alunos para a sala',
                    style: TextStyle(fontSize: 16)),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (text) {
                    maxCapacity = int.parse(text);
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Continuar', style: TextStyle(fontSize: 16)),
                ),
                onPressed: () => {
                  if (roomTitle == '')
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Por favor, digite o nome da sala."),
                            duration: Duration(seconds: 1)),
                      )
                    }
                  else if (maxCapacity == 0)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "Por favor, digite o número máximo de alunos na sala."),
                            duration: Duration(seconds: 1)),
                      )
                    }
                  else
                    {
                      //Navigator.push(
                      //  context,
                      //  MaterialPageRoute(
                      //      builder: (context) => SalaProfessor()),
                      //)
                    }

                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context) => SalaProfessor()),
                  //)
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
