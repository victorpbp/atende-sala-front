import 'package:atende_sala/main_screen/home.dart';
import 'package:atende_sala/students/select_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final codigoSalaProvider = StateProvider<String>((ref) => '');

class EntrarSala extends ConsumerWidget {
  const EntrarSala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String personName = ref.watch(personNameProvider);

    final String codigoSala = ref.watch(codigoSalaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Entrando na Sala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              child: Text(
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  'Olá, $personName!'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Digite o código da sala',
                    style: TextStyle(fontSize: 16)),
                TextField(
                  onChanged: (text) {
                    ref.read(codigoSalaProvider.notifier).state = text;
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SelecionarAssento()),
                          )
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
