import 'package:flutter/material.dart';
import 'package:projeto06/util/Componentes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).popAndPushNamed('/home');
    }

    cadastroPessoa() {
      Navigator.of(context).popAndPushNamed('/cadastro/pessoa');
    }

    cadastroCidade() {
      Navigator.of(context).popAndPushNamed('/cadastro/cidade');
    }

    consultaPessoa() {
      Navigator.of(context).popAndPushNamed('/consulta/pessoa');
    }

    consultaCidade() {
      Navigator.of(context).popAndPushNamed('/consulta/cidade');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização De API", home),
      body: Form(
        key: formController,
        child: Column(children: [
          Componentes()
              .criaBotao(formController, cadastroPessoa, 'Cadastrar Pessoa'),
          Componentes()
              .criaBotao(formController, consultaPessoa, 'Consultar Pessoas'),
          const SizedBox(height: 50),
          Componentes()
              .criaBotao(formController, cadastroCidade, 'Cadastrar Cidade'),
          Componentes()
              .criaBotao(formController, consultaCidade, 'Consultar Cidades')
        ]),
      ),
    );
  }
}
