import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    //int columnIndex = -1;

    return Container(
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue)), //Livrar dessa borda, tá pintando tudo
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
              height: 200,
              width: 350,
              child: GridView.count(
                  crossAxisCount: layout2[0].length,
                  children: List.generate((layout2.length * layout2[0].length),
                      (index) {
                    //if (index % 11 == 0) columnIndex++;
                    return const Center(
                        //[Varia entre 0 e 6][Varia entre 0 e 10]
                        child:
                            //Text(layout2[columnIndex][index % layout2[0].length]),
                            Icon(
                      Icons.chair,
                      color: Colors.grey,
                    ));
                  })),
            )
          ],
        ),
      ),
    );
  }
}
