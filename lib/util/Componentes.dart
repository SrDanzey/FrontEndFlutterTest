import 'package:flutter/material.dart';
import 'package:projeto06/model/Cidade.dart';
import 'package:projeto06/model/Pessoa.dart';

class Componentes {
  criaAppBar(texto, acao) {
    return AppBar(
      title: criaTexto(texto),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: acao,
          icon: const Icon(Icons.home),
        ),
      ],
    );
  }

  criaTexto(texto, [cor]) {
    if (cor != null) {
      return Text(
        texto,
        style: TextStyle(color: cor),
      );
    }
    return Text(texto);
  }

  criaInputTexto(tipoTeclado, texto, controlador, msgValidacao) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: texto,
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 30,
        ),
        controller: controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return msgValidacao;
          }
        },
      ),
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                if (controladorFormulario.currentState!.validate()) {
                  funcao();
                }
              },
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  criaItemPessoa(Pessoa p) {
    String sexo = p.sexo == 'M' ? "Masculino" : "Feminino";
    return ListTile(
      title: criaTexto("${p.id} - ${p.nome}"),
      subtitle: criaTexto("${p.idade} - ($sexo)"),
      trailing: criaTexto("${p.cidade.nome}/${p.cidade.uf}"),
    );
  }

  criaItemCidade(Cidade c) {
    return ListTile(
      title: criaTexto("${c.id} - ${c.nome} - ${c.uf}"),
    );
  }
}
