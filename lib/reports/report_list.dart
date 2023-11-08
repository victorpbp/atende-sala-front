import 'package:atende_sala/reports/individual_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listaRelatorioProvider = StateProvider<List<Relatorios>>((ref) => [
      Relatorios(
        data: '01/01/2021',
        nomeSala: 'Sala 1',
        nomeProfessor: 'Professor 1',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 1',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '02/01/2021',
        nomeSala: 'Sala 2',
        nomeProfessor: 'Professor 2',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 2',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '03/01/2021',
        nomeSala: 'Sala 3',
        nomeProfessor: 'Professor 3',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 3',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '04/01/2021',
        nomeSala: 'Sala 4',
        nomeProfessor: 'Professor 4',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 4',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '05/01/2021',
        nomeSala: 'Sala 5',
        nomeProfessor: 'Professor 5',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 5',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '06/01/2021',
        nomeSala: 'Sala 6',
        nomeProfessor: 'Professor 6',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 6',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '07/01/2021',
        nomeSala: 'Sala 7',
        nomeProfessor: 'Professor 7',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 7',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '08/01/2021',
        nomeSala: 'Sala 8',
        nomeProfessor: 'Professor 8',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 60,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 8',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '09/01/2021',
        nomeSala: 'Sala 9',
        nomeProfessor: 'Professor 9',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 90,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: 'Aluno 9',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
      Relatorios(
        data: '10/01/2021',
        nomeSala: 'Sala 10',
        nomeProfessor: 'Professor 10',
        info: RelatorioInfo(
          quantidadeAlunosMaximo: 10,
          quantidadeAlunosPresentes: 5,
          duracaoMinutos: 90,
          tempoMedioAtendimento: 10,
          tamanhoMaximoFilaEspera: 5,
          alunos: Alunos(
            nome: '',
            quantidadeAtendimentos: 1,
            tempoMedioAtendimento: 10,
          ),
        ),
      ),
    ]);

final relatorioSelecionadoProvider = StateProvider<int>((ref) => 0);

class ListaRelatorio extends ConsumerWidget {
  const ListaRelatorio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listaRelatorios = ref.watch(listaRelatorioProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Relatórios')),
      body: Center(
          child: SizedBox(
        width: 275,
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Aulas Ministradas',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: listaRelatorios.length,
                  itemBuilder: (context, index) {
                    final relatorio = listaRelatorios[index];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                        onPressed: () {
                          ref
                              .read(relatorioSelecionadoProvider.notifier)
                              .state = index;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    (const RelatorioIndividual())),
                          );
                        },
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(relatorio.data),
                          subtitle: Text(relatorio.nomeSala),
                          trailing: Text(
                              'Alunos: ${relatorio.info.quantidadeAlunosPresentes}/${relatorio.info.quantidadeAlunosMaximo}'),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class Relatorios {
  String data;
  String nomeSala;
  String nomeProfessor;
  RelatorioInfo info;

  Relatorios({
    required this.data,
    required this.nomeSala,
    required this.nomeProfessor,
    required this.info,
  });
}

class RelatorioInfo {
  int quantidadeAlunosMaximo;
  int quantidadeAlunosPresentes;
  int duracaoMinutos;
  int tempoMedioAtendimento;
  int tamanhoMaximoFilaEspera;
  Alunos alunos;

  RelatorioInfo({
    required this.quantidadeAlunosMaximo,
    required this.quantidadeAlunosPresentes,
    required this.duracaoMinutos,
    required this.tempoMedioAtendimento,
    required this.tamanhoMaximoFilaEspera,
    required this.alunos,
  });
}

class Alunos {
  String nome;
  int quantidadeAtendimentos;
  int tempoMedioAtendimento;

  Alunos({
    required this.nome,
    required this.quantidadeAtendimentos,
    required this.tempoMedioAtendimento,
  });
}
