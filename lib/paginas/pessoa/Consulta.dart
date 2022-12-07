import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto06/api/Acesso_api.dart';
import 'package:projeto06/model/Pessoa.dart';
import 'package:projeto06/util/Componentes.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).popAndPushNamed('/home');
    }

    listaTodos() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoa();
      setState(() {
        lista = pessoas;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização De API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao(formController, listaTodos, "Listar pessoas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Column(
                      children: [
                        Card(
                          color: (indice % 2 == 0)
                              ? const Color.fromARGB(221, 27, 27, 27)
                              : const Color.fromARGB(221, 14, 14, 14),
                          elevation: 6,
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Componentes().criaItemPessoa(lista[indice]),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(221, 36, 36, 36),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    poupupDelete(context, lista[indice]);
                                  },
                                  icon: const Icon(Icons.delete)),
                              const SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/cadastro/pessoa',
                                      arguments: lista[indice],
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  poupupDelete(BuildContext context, Pessoa pessoa) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('DESEJA DELETAR?'),
              content: Text(
                  "Você realmente deseja delete o cliente ${pessoa.nome}?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("CANCELAR"),
                ),
                TextButton(
                  onPressed: () {
                    AcessoApi().deletaPessoa(pessoa.id);
                    Navigator.of(context).popAndPushNamed('/consulta/pessoa');
                  },
                  child: const Text("DELETAR"),
                ),
              ],
            ));
  }
}
