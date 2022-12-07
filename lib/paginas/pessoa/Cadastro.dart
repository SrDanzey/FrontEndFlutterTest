import 'package:flutter/material.dart';
import 'package:projeto06/api/Acesso_api.dart';
import 'package:projeto06/model/Cidade.dart';
import 'package:projeto06/model/Pessoa.dart';
import 'package:projeto06/util/Combo_cidade.dart';
import 'package:projeto06/util/Componentes.dart';
import 'package:projeto06/util/Radio_sexo.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  int id = 0;

  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController textoNome = TextEditingController();
  TextEditingController textoIdade = TextEditingController();
  TextEditingController textoSexo = TextEditingController(text: 'M');
  TextEditingController textoCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final args = ModalRoute.of(context)?.settings.arguments as Pessoa;
      id = args.id;
      textoNome.text = args.nome;
      textoIdade.text = args.idade.toString();
      textoSexo.text = args.sexo;
      textoCidade.text = args.cidade.id.toString();
    }

    cadastro() {
      Pessoa p = Pessoa(
          id,
          textoNome.text,
          textoSexo.text,
          int.parse(textoIdade.text),
          Cidade(int.parse(textoCidade.text), "", ""));

      if (id == 0) {
        AcessoApi().inserePessoa(p.toJson());
      } else {
        AcessoApi().alteraPessoa(p.toJson(), id);
      }
      Navigator.of(context).popAndPushNamed('/consulta/pessoa');
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
                TextInputType.text, "Idade", textoIdade, "Informe a idade"),
            Center(child: RadioSexo(controller: textoSexo)),
            Center(child: ComboCidade(controller: textoCidade)),
            Componentes().criaBotao(
                formController, cadastro, id != 0 ? "Atualizar" : "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
