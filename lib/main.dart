import 'package:flutter/material.dart';
import 'package:projeto06/paginas/Home.dart';
import 'package:projeto06/paginas/cidade/CadastraCidade.dart';
import 'package:projeto06/paginas/cidade/ConsultaCidade.dart';
import 'package:projeto06/paginas/pessoa/Cadastro.dart';
import 'package:projeto06/paginas/pessoa/Consulta.dart';
import 'package:projeto06/util/Tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/consulta/pessoa': (context) => const Consulta(),
        '/cadastro/pessoa': (context) => const Cadastro(),
        '/consulta/cidade': (context) => const ConsultaCidade(),
        '/cadastro/cidade': (context) => const CadastraCidade(),
      },
    );
  }
}
