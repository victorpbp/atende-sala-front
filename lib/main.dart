import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:atende_sala/main_screen/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

//Eu entendo que isso não deve ser feito, porém, o Flutter, em todos os outros
//arquivos onde preciso utilizar o prefs, fica dando a possibilidade dele ser
//nulo sendo que, antes do myApp() sequer carregar, já é garantido que o prefs
//foi carregado, portanto, não há risco algum da aplicação carregar e o prefs
//estar com esse valor com o qual foi primariamente inicializado e, sim, com o
//getInstance
SharedPreferences prefs = '' as SharedPreferences;

Provider dioProvider = '' as Provider;

void main() async {
  //Isso garante que será inicializada a instância do SharedPreferences antes de qualquer coisa
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  //Garante a inicialização do Dio
  dioProvider = Provider((ref) => Dio());

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MaterialApp(
        title: "AtendeSala!",
        home: MyApp(),
      ),
    ),
  );
}
