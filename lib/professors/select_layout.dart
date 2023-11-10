import 'package:atende_sala/room_layout/layout1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../room_layout/layout2.dart';

final layoutProvider = StateProvider<int>((ref) => 0);

class SelecionarLayout extends ConsumerWidget {
  const SelecionarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando a Sala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Escolha o layout do local de aula',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () => {
                      //Add aqui o push para o prof_room
                      ref.read(layoutProvider.notifier).state = 0
                    },
                child: const Layout1()),
            //Colocar um container e mudar de cor dependendo da abordagem
            TextButton(
              onPressed: () => {
                //Add aqui o push para o prof_room
                ref.read(layoutProvider.notifier).state = 1
              },
              child: const Layout2(), //Chama o novo componente com o layout
            ),
          ],
        ),
      )),
    );
  }
}
