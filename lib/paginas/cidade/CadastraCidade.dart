import 'package:flutter/material.dart';
import 'package:projeto06/api/Acesso_api.dart';
import 'package:projeto06/model/Cidade.dart';
import 'package:projeto06/util/Componentes.dart';

class CadastraCidade extends StatefulWidget {
  const CadastraCidade({super.key});

  @override
  State<CadastraCidade> createState() => _CadastraCidadeState();
}

class _CadastraCidadeState extends State<CadastraCidade> {
  int id = 0;

  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController textoNome = TextEditingController();
  TextEditingController textoUf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final args = ModalRoute.of(context)?.settings.arguments as Cidade;
      id = args.id;
      textoNome.text = args.nome;
      textoUf.text = args.uf;
    }

    cadastro() {
      Cidade c = Cidade(id, textoNome.text, textoUf.text);

      if (id == 0) {
        AcessoApi().insereCidade(c.toJson());
      } else {
        AcessoApi().alteraCidade(c.toJson(), id);
      }
      Navigator.of(context).popAndPushNamed('/consulta/cidade');
    }

    home() {
      Navigator.of(context).popAndPushNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização de API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(
                TextInputType.text, "Nome", textoNome, "Informe o nome"),
            Componentes().criaInputTexto(
                TextInputType.text, "UF", textoUf, "Informe a uf"),
            Componentes().criaBotao(
                formController, cadastro, id != 0 ? "Atualizar" : "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
