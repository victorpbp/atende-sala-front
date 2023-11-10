import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main_screen/home.dart';
import '../students/select_seat.dart';

final layoutProvider1 = StateProvider<List<List>>((ref) => [
      ['1A', '1B', '1C', '1D', '1E', '1F'],
      ['2A', '2B', '2C', '2D', '2E', '2F'],
      ['3A', '3B', '3C', '3D', '3E', '3F'],
      ['4A', '4B', '4C', '4D', '4E', '4F'],
    ]);

class Layout2 extends ConsumerWidget {
  const Layout2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout2 = ref.watch(layoutProvider1.notifier).state;

    final bool isStudent = ref.watch(isStudentProvider);

    final String selectedSeat = ref.watch(selectedSeatProvider);

    int columnIndex = -1;

    return Container(
      width: 350,
      height: isStudent ? 600 : 300,
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
                'Sala de Aula 2',
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
              height: isStudent ? 500 : 200,
              child: GridView.count(
                  crossAxisCount: layout2[0].length,
                  children: List.generate((layout2.length * layout2[0].length),
                      (index) {
                    //Auxilia na identificação da coluna
                    if (index % layout2[0].length == 0) columnIndex++;
                    //Identifica a cadeira do loop atual
                    String seat =
                        layout2[columnIndex][index % layout2[0].length];
                    return Center(
                        //[Varia entre 0 e 6][Varia entre 0 e 10]
                        child: TextButton(
                      child: Icon(
                        Icons.chair,
                        color:
                            selectedSeat == seat ? Colors.green : Colors.grey,
                      ),
                      onPressed: () => {
                        if (isStudent)
                          if (ref.read(selectedSeatProvider.notifier).state ==
                              seat)
                            {ref.read(selectedSeatProvider.notifier).state = ''}
                          else
                            {
                              ref.read(selectedSeatProvider.notifier).state =
                                  seat
                            }
                      },
                    ));
                  })),
            )
          ],
        ),
      ),
    );
  }
}
