import 'package:flutter/material.dart';
import 'package:atende_sala/main_screen/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
      child: MaterialApp(title: "AtendeSala!", home: MyApp())));
}
