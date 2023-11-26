import 'package:atende_sala/main_screen/home.dart';
import 'package:atende_sala/professors/select_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomTitleProvider = StateProvider<String>((ref) => '');

final currentCapacityProvider = StateProvider<int>((ref) => 15);

final maxCapacityProvider = StateProvider<int>((ref) => 0);

final layoutProvider = StateProvider<int>((ref) => 0);

class CriarSala extends ConsumerWidget {
  const CriarSala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String personName = ref.watch(personNameProvider);

    final String roomTitle = ref.watch(roomTitleProvider);

    final int maxCapacity = ref.watch(maxCapacityProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Criando a Sala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Olá para o Usuário
            Text(
                style: const TextStyle(
                  fontSize: 30,
                ),
                'Bem vindo, $personName!'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Digitar Título da Sala
                const Text('Digite o nome da sala',
                    style: TextStyle(fontSize: 16)),
                TextField(
                  onChanged: (text) {
                    ref.read(roomTitleProvider.notifier).state = text;
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
                    if (text == '') text = '0';
                    ref.read(maxCapacityProvider.notifier).state =
                        int.parse(text);
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
                  else if (maxCapacity < 1)
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelecionarLayout()),
                      )
                    }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
