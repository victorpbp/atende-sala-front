import 'package:atende_sala/reports/report_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RelatorioIndividual extends ConsumerWidget {
  const RelatorioIndividual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatorioIndividual = ref
        .watch(listaRelatorioProvider)[ref.watch(relatorioSelecionadoProvider)];

    return Scaffold(
        appBar: AppBar(title: const Text('Relatório de Aula')),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        relatorioIndividual.nomeSala,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(relatorioIndividual.data),
                        Text(
                            'Alunos: ${relatorioIndividual.info.quantidadeAlunosPresentes}/${relatorioIndividual.info.quantidadeAlunosMaximo}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Duração: ${relatorioIndividual.info.duracaoMinutos} minutos',
                        ),
                        Text(
                          'Tempo Médio de Atendimento: ${relatorioIndividual.info.tempoMedioAtendimento} minutos',
                        ),
                        Text(
                          'Tamanho Máximo da Fila de Espera: ${relatorioIndividual.info.tamanhoMaximoFilaEspera} pessoas',
                        ),
                      ],
                    ),
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Nome',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Freq',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'T.Médio',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Alexandre Coelho')),
                            DataCell(Text('6')),
                            DataCell(Text('6.4 minutos')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Glauber Gouveira')),
                            DataCell(Text('2')),
                            DataCell(Text('2.8 minutos')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Lorena Roberta')),
                            DataCell(Text('3')),
                            DataCell(Text('4.2 minutos')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Victor Peixoto')),
                            DataCell(Text('5')),
                            DataCell(Text('3.9 minutos')),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ));
  }
}
