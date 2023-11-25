import 'package:atende_sala/room_layout/layout1.dart';
import 'package:atende_sala/room_layout/layout2.dart';
import 'package:atende_sala/students/student_room.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSeatProvider = StateProvider<String>((ref) => '');

class SelecionarAssento extends ConsumerWidget {
  const SelecionarAssento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codigoSala = ref.watch(codigoSalaProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Sala de Aula $codigoSala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Escolha sua cadeira',
              style: TextStyle(fontSize: 20),
            ),
            //Será necessário pegar as informações da sala e descobrir o layout sendo usado
            //Até lá, usarei mockups
            const Layout2(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () => {
                //Add aqui a transição para a tela de student_room
                if (ref.watch(selectedSeatProvider.notifier).state == '')
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Por favor, selecione um assento.",
                              style: TextStyle(fontSize: 16)),
                          duration: Duration(seconds: 1)),
                    )
                  }
                else
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalaEstudante()),
                    )
                  }
              },
              child: const Text('Confirmar Assento'),
            )
          ],
        ),
      )),
    );
  }
}
