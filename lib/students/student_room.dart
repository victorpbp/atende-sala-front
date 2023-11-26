import 'package:atende_sala/main_screen/home.dart';
import 'package:atende_sala/professors/create_room.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo Requisição Períodica de Atualização da Fila - 10s
// Retorna a posição do aluno na fila
// Só é chamada caso o Aluno esteja na fila
// Aluno será kickado caso a rota seja chamada e a sala não exista mais

//todo Requisação Pedir Atendimento
// Retorna a posição do aluno na fila
// Aluno será kickado caso peça atendimento e a sala não exista mais

//todo Requisição Cancelar Atendimento
// Retorna a posição do aluno na fila (null)
// Desabilitar o botão caso seja sua vez

//todo Requisição de Encerrar Sala é para Sair da Sala

final queuePositionProvider = StateProvider<int>((ref) => -1);

class SalaEstudante extends ConsumerWidget {
  const SalaEstudante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String personName = ref.watch(personNameProvider);
    final String codigoSala = ref.watch(codigoSalaProvider);
    final int queuePosition = ref.watch(queuePositionProvider);
    final String roomTitle = ref.watch(roomTitleProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Sala de Aula $codigoSala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(roomTitle, style: const TextStyle(fontSize: 20)),
            Text('Olá, $personName', style: const TextStyle(fontSize: 30)),
            Column(
              children: [
                const Text('Sua posição na fila:',
                    style: TextStyle(fontSize: 20)),
                Text(
                    queuePosition == -1
                        ? 'Você não está na fila.'
                        : queuePosition == 0
                            ? 'Sua vez chegou'
                            : '#$queuePosition',
                    style: const TextStyle(fontSize: 22)),
              ],
            ),

            //Botão para entrar/sair da fila
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: queuePosition == -1 ? Colors.blue : Colors.orange,
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () => {
                      if (queuePosition == -1)
                        {
                          //Se não estiver na fila, entra
                          ref.read(queuePositionProvider.notifier).state = 0,
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Você entrou na fila."),
                                duration: Duration(seconds: 1)),
                          )
                        }
                      else
                        {
                          // Se estiver na fila, sai
                          ref.read(queuePositionProvider.notifier).state = -1,
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Você saiu da fila."),
                                duration: Duration(seconds: 1)),
                          )
                        }
                    },
                child: Text(
                    style: const TextStyle(fontSize: 16),
                    queuePosition == -1
                        ? 'Pedir Atendimento'
                        : 'Cancelar Atendimento')),

            //Botão para sair da sala
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                primary: Colors.red,
              ),
              onPressed: () => {
                //Vai ser mandado coisas pro back daqui, claro
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Você saiu da sala."),
                      duration: Duration(seconds: 1)),
                ),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                  (Route<dynamic> route) => false,
                )
              },
              child: const Text('Sair da Sala', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      )),
    );
  }
}
