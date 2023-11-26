import 'dart:async';

import 'package:atende_sala/main.dart';
import 'package:atende_sala/reports/report_list.dart';
import 'package:atende_sala/students/select_seat.dart';
import 'package:atende_sala/students/join_room.dart';
import 'package:atende_sala/professors/create_room.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//todo Enviar um Token e Nome (que ficam salvo em caché) para a rota correta
//todo Receber o Token (caso enviado '') e salvar no caché no lugar da ''

final tokenProvider =
    StateProvider<String>((ref) => prefs.getString('token') ?? '');

final personNameProvider =
    StateProvider<String>((ref) => prefs.getString('personName') ?? '');

final isStudentProvider = StateProvider<bool>((ref) => true);

//Inicia o tratamento sobre as requisições

//Repositório
class PersonRepository {
  final Dio dio;
  final Ref ref;
  final String token;
  final String personName;
  final bool isStudent;

  PersonRepository(
      {required this.token,
      required this.personName,
      required this.isStudent,
      required this.dio,
      required this.ref});

  Future<String> createStudent() async {
    final response = await dio.post(
      'http://atende-sala-api-production.up.railway.app/api/user',
      data: {
        'name': personName,
        'is_student': isStudent,
        'token': token,
      },
    );

    return response.data['token'];
  }

  Future<String> createProfessor() async {
    final response = await dio.post(
      'http://atende-sala-api-production.up.railway.app/api/create-class',
      data: {
        'name': personName,
        'is_student': isStudent,
        'token': token,
      },
    );

    return response.data['token'];
  }
}

//Provider

final personRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final token = ref.watch(tokenProvider);
  final personName = ref.watch(personNameProvider);
  final isStudent = ref.watch(isStudentProvider);
  return PersonRepository(
      ref: ref,
      dio: dio,
      token: token,
      personName: personName,
      isStudent: isStudent);
});

//Service

class PersonService {
  final PersonRepository personRepository;
  final Ref ref;

  PersonService({required this.personRepository, required this.ref});

  Future<String> createStudent() async {
    final token = await personRepository.createStudent();
    ref.read(tokenProvider.notifier).state = token;
    return token;
  }

  Future<String> createProfessor() async {
    final token = await personRepository.createProfessor();
    ref.read(tokenProvider.notifier).state = token;
    return token;
  }
}

final personServiceProvider = Provider((ref) {
  final personRepository = ref.watch(personRepositoryProvider);
  return PersonService(personRepository: personRepository, ref: ref);
});

// Controller

class PersonController extends AsyncNotifier<String> {
  //Valor inicial
  @override
  FutureOr<String> build() {
    return ref.read(tokenProvider.notifier).state;
  }

  Future<void> createStudent() async {
    final personService = ref.read(personServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => personService.createStudent());
  }

  Future<void> createProfessor() async {
    final personService = ref.read(personServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => personService.createProfessor());
  }
}

final personControllerProvider =
    AsyncNotifierProvider<PersonController, String>(() => PersonController());

//Termina o tratamento sobre as requisições

//Aqui começa o MyApp
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String personName = ref.watch(personNameProvider);
    final person = ref.watch(personControllerProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('AtendeSala!')),
        body: Center(
            child: SizedBox(
          width: 350,

          // Coluna principal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Coluna das informações padrões
              Column(
                children: [
                  const Text('Digite seu nome e pressione a opção desejada',
                      style: TextStyle(fontSize: 20)),
                  TextFormField(
                    initialValue: prefs.getString('personName') ?? '',
                    onChanged: (text) async {
                      ref.read(personNameProvider.notifier).state = text;
                      await prefs.setString('personName', text);
                    },
                  ),

                  //Coluna dos Botões
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Botão para Alunos
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('Aluno', style: TextStyle(fontSize: 16)),
                          ),
                          onPressed: () => {
                            if (personName == '')
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Por favor, digite seu nome."),
                                      duration: Duration(seconds: 1)),
                                )
                              }
                            else
                              {
                                ref.read(isStudentProvider.notifier).state =
                                    true,
                                //Cria o estudante
                                ref
                                    .read(personControllerProvider.notifier)
                                    .createStudent(),
                                person.when(
                                  data: (token) async {
                                    await prefs.setString('token', token);
                                  },
                                  loading: () {
                                    const CircularProgressIndicator();
                                  },
                                  error: (error, stackTrace) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Erro ao criar o estudante."),
                                          duration: Duration(seconds: 1)),
                                    );
                                  },
                                ),
                                //Vai para a tela de escolher a sala
                                //Não está condicional de conseguir ou não criar
                                //o estudante para que o app ainda seja funcional
                                //mesmo que a integração não seja possível
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EntrarSala()),
                                )
                              }
                          },
                        ),

                        //Botão para Professores
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Professor',
                                style: TextStyle(fontSize: 16)),
                          ),
                          onPressed: () => {
                            if (personName == '')
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Por favor, digite seu nome."),
                                      duration: Duration(seconds: 1)),
                                )
                              }
                            else
                              {
                                ref.read(isStudentProvider.notifier).state =
                                    false,
                                ref.read(selectedSeatProvider.notifier).state =
                                    '',
                                //Cria o professor
                                ref
                                    .read(personControllerProvider.notifier)
                                    .createProfessor(),
                                person.when(
                                  data: (token) async {
                                    await prefs.setString('token', token);
                                  },
                                  loading: () {
                                    const CircularProgressIndicator();
                                  },
                                  error: (error, stackTrace) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Erro ao criar o professor."),
                                          duration: Duration(seconds: 1)),
                                    );
                                  },
                                ),
                                //Vai para a tela de criar a sala
                                //Não está condicional de conseguir ou não criar
                                //o professor para que o app ainda seja funcional
                                //mesmo que a integração não seja possível
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CriarSala()),
                                )
                              }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListaRelatorio()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Relatórios', style: TextStyle(fontSize: 16)),
                  )),
            ],
          ),
        )));
  }
}
