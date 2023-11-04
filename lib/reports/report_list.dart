import 'package:atende_sala/main_screen/home.dart';
import 'package:flutter/material.dart';

class ListaRelatorio extends StatefulWidget {
  final String personName;
  const ListaRelatorio({Key? key, required this.personName}) : super(key: key);

  @override
  State<ListaRelatorio> createState() => _ListaRelatorioState();
}

class _ListaRelatorioState extends State<ListaRelatorio> {
  List<Relatorios> listaRelatorios = [
    Relatorios(
        data: '01/01/2021',
        nomeSala: 'Sala 1',
        nomeProfessor: 'Professor 1',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '02/01/2021',
        nomeSala: 'Sala 2',
        nomeProfessor: 'Professor 2',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '03/01/2021',
        nomeSala: 'Sala 3',
        nomeProfessor: 'Professor 3',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '04/01/2021',
        nomeSala: 'Sala 4',
        nomeProfessor: 'Professor 4',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '05/01/2021',
        nomeSala: 'Sala 5',
        nomeProfessor: 'Professor 5',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '06/01/2021',
        nomeSala: 'Sala 6',
        nomeProfessor: 'Professor 6',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '07/01/2021',
        nomeSala: 'Sala 7',
        nomeProfessor: 'Professor 7',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '08/01/2021',
        nomeSala: 'Sala 8',
        nomeProfessor: 'Professor 8',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '09/01/2021',
        nomeSala: 'Sala 9',
        nomeProfessor: 'Professor 9',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
    Relatorios(
        data: '10/01/2021',
        nomeSala: 'Sala 10',
        nomeProfessor: 'Professor 10',
        quantidadeAlunosMaximo: 10,
        quantidadeAlunosPresentes: 5),
  ];

  @override
  Widget build(BuildContext context) {
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const MyApp())),
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
                              'Alunos: ${relatorio.quantidadeAlunosPresentes}/${relatorio.quantidadeAlunosMaximo}'),
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
  int quantidadeAlunosMaximo;
  int quantidadeAlunosPresentes;

  Relatorios({
    required this.data,
    required this.nomeSala,
    required this.nomeProfessor,
    required this.quantidadeAlunosMaximo,
    required this.quantidadeAlunosPresentes,
  });
}
