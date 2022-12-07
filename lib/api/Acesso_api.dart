import 'dart:convert';

import 'package:http/http.dart';
import 'package:projeto06/model/Cidade.dart';
import 'package:projeto06/model/Pessoa.dart';

class AcessoApi {
  final urlCliente = 'http://localhost:8080/cliente';
  final urlCidade = 'http://localhost:8080/cidade';

  Future<List<Pessoa>> listaPessoa() async {
    Response response = await get(Uri.parse(urlCliente));
    String jsonFormatadoUtf8 = (utf8.decode(response.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Pessoa> pessoas = List<Pessoa>.from(l.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(urlCliente),
        headers: headers, body: json.encode(pessoa));
  }

  Future<void> deletaPessoa(int id) async {
    await delete(Uri.parse("$urlCliente/$id"));
  }

  Future<void> alteraPessoa(Map<String, dynamic> pessoa, int id) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse("$urlCliente?id=$id"),
        headers: headers, body: jsonEncode(pessoa));
  }

  Future<List<Cidade>> listaCidade() async {
    Response response = await get(Uri.parse(urlCidade));
    String jsonFormatadoUtf8 = (utf8.decode(response.bodyBytes));
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await post(Uri.parse(urlCidade),
        headers: headers, body: json.encode(cidade));
  }

  Future<void> deletaCidade(int id) async {
    await delete(Uri.parse("$urlCidade/$id"));
  }

  Future<void> alteraCidade(Map<String, dynamic> cidade, int id) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    await put(Uri.parse("$urlCidade?id=$id"),
        headers: headers, body: jsonEncode(cidade));
  }
}
