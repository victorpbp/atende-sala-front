import 'package:flutter/material.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:atende_sala/professors/create_room.dart';

import '../reports/report_list.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String personName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AtendeSala!')),
        body: Center(
            child: SizedBox(
          width: 300,

          // Coluna principal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Coluna das informações padrões
              Column(
                children: [
                  const Text('Digite seu nome e pressione a opção desejada',
                      style: TextStyle(fontSize: 20)),
                  TextField(
                    onChanged: (text) {
                      personName = text;
                    },
                  ),

                  //Coluna dos Botões
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Botão para Alunos
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('Aluno', style: TextStyle(fontSize: 16)),
                          ),
                          onPressed: () => {
                            if (personName == '')
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Por favor, digite seu nome."),
                                      duration: Duration(seconds: 1)),
                                )
                              }
                            else
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EntrarSala(personName: personName)),
                                )
                              }
                          },
                        ),

                        //Botão para Professores
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Professor',
                                style: TextStyle(fontSize: 16)),
                          ),
                          onPressed: () => {
                            if (personName == '')
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Por favor, digite seu nome."),
                                      duration: Duration(seconds: 1)),
                                )
                              }
                            else
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CriarSala(personName: personName)),
                                )
                              }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListaRelatorio(
                                personName: personName,
                              )),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Relatórios', style: TextStyle(fontSize: 16)),
                  )),
            ],
          ),
        )));
  }
}
