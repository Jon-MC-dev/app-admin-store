import 'dart:convert';

import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/abstracts/abstrac_models_json_list.dart';
import 'package:http/http.dart' as http;

import 'abstract_providers.dart';

class ProviderConcret implements ProviderAbs {
  @override
  String host;

  @override
  Future<bool> addData(ModelAbs model) async {
    final resultado = await http.post('$host',
        body: json.encode(model.getDataJson()),
        headers: {"Content-Type": "application/json"});
    if (resultado.statusCode == 200) {
      final resJson = json.decode(resultado.body);
      if (resJson['filas_afectadas'] >= 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> deleteData(ModelAbs model) async {
    final resultado = await http.delete('$host',
        //body: json.encode(marca.getMarcaJson()),
        headers: {"id": model.id.toString()});
    if (resultado.statusCode == 200) {
      final resJson = json.decode(resultado.body);
      if (resJson['filas_afectadas'] >= 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<List<ModelAbs>> getData({ModelAbs model}) async {
    ModelsAbs modeloG = new ModelsAbs();
    modeloG.model = model;
    final resultado = await http.get('$host?id=${model.id}');
    final resultadoJson = json.decode(resultado.body);
    modeloG.deJsonALista(resultadoJson['datos']);
    return modeloG.listaModels;
  }

  @override
  Future<bool> updateData(ModelAbs model) async {
    final resultado = await http.put('$host',
        body: json.encode(model.getDataJson()),
        headers: {"Content-Type": "application/json"});
    if (resultado.statusCode == 200) {
      final resJson = json.decode(resultado.body);
      if (resJson['filas_afectadas'] >= 1) {
        return true;
      }
    }
    return false;
  }

  @override
  String campo;

  @override
  String tbl;

  @override
  Future<int> getMaxID() async {
    return 0;
  }
}
