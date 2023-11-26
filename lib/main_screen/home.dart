import 'package:atende_sala/reports/report_list.dart';
import 'package:atende_sala/students/select_seat.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:atende_sala/professors/create_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo Enviar um Token e Nome (que ficam salvo em caché) para a rota correta
//todo Receber o Token (caso enviado '') e salvar no caché no lugar da ''

final personNameProvider = StateProvider<String>((ref) => '');

final isStudentProvider = StateProvider<bool>((ref) => true);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String personName = ref.watch(personNameProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('AtendeSala!')),
        body: Center(
            child: SizedBox(
          width: 350,

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
                      ref.read(personNameProvider.notifier).state = text;
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
                                ref.read(isStudentProvider.notifier).state =
                                    true,
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EntrarSala()),
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
                                ref.read(isStudentProvider.notifier).state =
                                    false,
                                ref.read(selectedSeatProvider.notifier).state =
                                    '',
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CriarSala()),
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
                          builder: (context) => const ListaRelatorio()),
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
