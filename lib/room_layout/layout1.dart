import 'package:atende_sala/main_screen/home.dart';
import 'package:atende_sala/professors/prof_room.dart';
import 'package:atende_sala/students/select_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final layoutProvider1 = StateProvider<List<List>>((ref) => [
      ['1A', '1B', '1C', '1D', '1E', '1F', '1G'],
      ['2A', '2B', '2C', '2D', '2E', '2F', '2G'],
      ['3A', '3B', '3C', '3D', '3E', '3F', '3G'],
      ['4A', '4B', '4C', '4D', '4E', '4F', '4G'],
      ['5A', '5B', '5C', '5D', '5E', '5F', '5G'],
      ['6A', '6B', '6C', '6D', '6E', '6F', '6G'],
      ['7A', '7B', '7C', '7D', '7E', '7F', '7G'],
      ['8A', '8B', '8C', '8D', '8E', '8F', '8G'],
      ['9A', '9B', '9C', '9D', '9E', '9F', '9G'],
      ['10A', '10B', '10C', '10D', '10E', '10F', '10G'],
    ]);

class Layout1 extends ConsumerWidget {
  const Layout1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout1 = ref.watch(layoutProvider1.notifier).state;

    final bool isStudent = ref.watch(isStudentProvider);

    final String selectedSeat = ref.watch(selectedSeatProvider);

    int columnIndex = -1;

    //Vão ser substituídos depois, mas preciso sinalizar quando é o primeiro e próximo aluno
    final String firstStudentPosition = ref.watch(firstStudentPositionProvider);
    final String secondStudentPosition =
        ref.watch(secondStudentPositionProvider);

    return Container(
      width: 350,
      height: isStudent ? 700 : 400,
      decoration: isStudent
          ? const BoxDecoration()
          : BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Título do IC
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Sala de Aula 1',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),

            //Layout em si

            SizedBox(
              //color: Colors.white,
              width: 350,
              height: isStudent ? 600 : 300,

              child: GridView.count(
                  crossAxisCount: layout1[0].length,
                  children: List.generate((layout1.length * layout1[0].length),
                      (index) {
                    //Auxilia na identificação da coluna
                    if (index % layout1[0].length == 0) columnIndex++;
                    //Identifica a cadeira do loop atual
                    String seat =
                        layout1[columnIndex][index % layout1[0].length];
                    return Center(
                      //[Varia entre 0 e 6][Varia entre 0 e 10]
                      child:
                          //Text(layout1[columnIndex][index % layout1[0].length]),
                          TextButton(
                        child: Icon(
                          Icons.chair,
                          color: (selectedSeat == seat ||
                                  (firstStudentPosition == seat) && !isStudent)
                              ? Colors.green
                              : ((secondStudentPosition == seat) && !isStudent)
                                  ? Colors.orange
                                  : Colors.grey,
                        ),
                        onPressed: () => {
                          if (isStudent)
                            {
                              ref.read(selectedSeatProvider.notifier).state =
                                  seat
                            }
                        },
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
