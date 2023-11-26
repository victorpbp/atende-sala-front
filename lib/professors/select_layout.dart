import 'package:atende_sala/professors/create_room.dart';
import 'package:atende_sala/professors/prof_room.dart';
import 'package:atende_sala/room_layout/layout1.dart';
import 'package:atende_sala/room_layout/layout2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo Enviar NomeSala, Layout, QntMaxAlunos
//todo Receber o Código da Sala, AtualAluno, Queue[]

class SelecionarLayout extends ConsumerWidget {
  const SelecionarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando a Sala')),
      body: SingleChildScrollView(
        child: Center(
            child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  'Escolha o layout do local de aula',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                    onPressed: () => {
                          //Add aqui o push para o prof_room
                          ref.read(layoutProvider.notifier).state = 0,
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SalaProfessor())),
                        },
                    child: const Layout1()),
              ),
              //Colocar um container e mudar de cor dependendo da abordagem
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () => {
                    ref.read(layoutProvider.notifier).state = 1,
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SalaProfessor())),
                  },
                  child: const Layout2(), //Chama o novo componente com o layout
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
