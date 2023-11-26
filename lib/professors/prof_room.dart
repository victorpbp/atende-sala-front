import 'package:atende_sala/main_screen/home.dart';
import 'package:atende_sala/professors/create_room.dart';
import 'package:atende_sala/room_layout/layout1.dart';
import 'package:atende_sala/room_layout/layout2.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo Requisição Períodica de Atualização da Fila - 10s
// Retorna um objeto idêntico ao de criar a sala, para atualizar tudo

//todo Requisição Next é para Iniciar Atendimento ou ir para o Próximo

//todo Requisição Stop é para Parar Atendimento

//todo Requisição de Encerrar Sala é para Encerrar a Sala
// Retorna um objeto de relatório da aula

final queueLengthProvider = StateProvider<int>((ref) => 0);
final attendingProvider = StateProvider<bool>((ref) => false);
final firstStudentNameProvider =
    StateProvider<String>((ref) => 'Victor Peixoto');
final firstStudentPositionProvider = StateProvider<String>((ref) => '3A');
final secondStudentNameProvider =
    StateProvider<String>((ref) => 'Alexandre Coelho');
final secondStudentPositionProvider = StateProvider<String>((ref) => '3B');
final thirdStudentNameProvider =
    StateProvider<String>((ref) => 'Lorena Roberta');
final thirdStudentPositionProvider = StateProvider<String>((ref) => '3C');

class SalaProfessor extends ConsumerWidget {
  const SalaProfessor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String codigoSala = ref.watch(codigoSalaProvider);
    final String roomTitle = ref.watch(roomTitleProvider);
    final bool attending = ref.watch(attendingProvider);
    final String firstStudentName = ref.watch(firstStudentNameProvider);
    final String firstStudentPosition = ref.watch(firstStudentPositionProvider);
    final String secondStudentName = ref.watch(secondStudentNameProvider);
    final String secondStudentPosition =
        ref.watch(secondStudentPositionProvider);
    final String thirdStudentName = ref.watch(thirdStudentNameProvider);
    final String thirdStudentPosition = ref.watch(thirdStudentPositionProvider);
    final int layout = ref.watch(layoutProvider);
    final int currentCapacity = ref.watch(currentCapacityProvider);
    final int maxCapacity = ref.watch(maxCapacityProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Sala de Aula $codigoSala')),
      body: Center(
          child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(roomTitle, style: const TextStyle(fontSize: 20)),
                Text('$currentCapacity / $maxCapacity')
              ],
            ),
            Column(
              children: [
                Text(attending ? 'Em atendimento' : 'Atendimento pausado',
                    style: const TextStyle(fontSize: 20)),
                Text(
                    attending
                        ? 'Atual: $firstStudentName'
                        : 'Próximo: $firstStudentName',
                    style: const TextStyle(fontSize: 24)),
                Text(attending ? 'Próximo: $secondStudentName' : '',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),

            //Mapa do layout2 da sala sinalizando os lugares e o aluno atual e próximo no atendimento
            layout == 0 ? const Layout1() : const Layout2(),

            //Legenda para os assentos do layout das cores verde e laranja
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    Icon(Icons.chair, color: Colors.green),
                    Text(' - Atual'),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.chair, color: Colors.orange),
                    Text(' - Próximo'),
                  ],
                ),
              ],
            ),

            //Botão para passar para o próximo aluno
            attending
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.all(20.0),
                    ),
                    onPressed: () => {
                          //Aluno em questão ainda precisa ser removido da fila
                          ref.read(firstStudentNameProvider.notifier).state =
                              secondStudentName,
                          ref
                              .read(firstStudentPositionProvider.notifier)
                              .state = secondStudentPosition,
                          ref.read(secondStudentNameProvider.notifier).state =
                              thirdStudentName,
                          ref
                              .read(secondStudentPositionProvider.notifier)
                              .state = thirdStudentPosition,
                          ref.read(thirdStudentNameProvider.notifier).state =
                              '',
                          ref
                              .read(thirdStudentPositionProvider.notifier)
                              .state = '',

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Fila atualizada."),
                                duration: Duration(seconds: 1)),
                          )
                        },
                    child: const Text('Próximo aluno',
                        style: TextStyle(fontSize: 16)))
                : const Text(''),

            //Botão para realizar/parar atendimento
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: attending ? Colors.orange : Colors.green,
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () => {
                      ref.read(attendingProvider.notifier).state = !attending,
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Status de atendimento alterado."),
                            duration: Duration(seconds: 1)),
                      )
                    },
                child: Text(
                    style: const TextStyle(fontSize: 16),
                    attending ? 'Parar Atendimento' : 'Iniciar Atendimento')),

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
                      content: Text("Você desfez da sala."),
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
              child:
                  const Text('Encerrar a sala', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      )),
    );
  }
}
