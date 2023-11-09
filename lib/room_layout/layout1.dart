import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final layoutProvider1 = StateProvider<List<List>>((ref) => [
      ['1A', '1B', '1C', '1D', '1E', '1F', '1G', '1H', '1I'],
      ['2A', '2B', '2C', '2D', '2E', '2F', '2G', '2H', '2I'],
      ['3A', '3B', '3C', '3D', '3E', '3F', '3G', '3H', '3I'],
      ['4A', '4B', '4C', '4D', '4E', '4F', '4G', '4H', '4I'],
      ['5A', '5B', '5C', '5D', '5E', '5F', '5G', '5H', '5I'],
      ['6A', '6B', '6C', '6D', '6E', '6F', '6G', '6H', '6I'],
      ['7A', '7B', '7C', '7D', '7E', '7F', '7G', '7H', '7I'],
    ]);

class Layout1 extends ConsumerWidget {
  const Layout1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout1 = ref.watch(layoutProvider1.notifier).state;

    //int columnIndex = -1;

    return Container(
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue)),
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
              height: 200,
              width: 350,
              child: GridView.count(
                  crossAxisCount: layout1[0].length,
                  children: List.generate((layout1.length * layout1[0].length),
                      (index) {
                    //if (index % 11 == 0) columnIndex++;
                    return const Center(
                        //[Varia entre 0 e 6][Varia entre 0 e 10]
                        child:
                            //Text(layout1[columnIndex][index % layout1[0].length]),
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
