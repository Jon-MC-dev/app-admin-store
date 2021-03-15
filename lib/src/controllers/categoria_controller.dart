import 'package:flutter/material.dart';
import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/categoria_providers.dart';

class CategoriaController extends AbstractController {
  @override
  ProviderAbs modelProvider = CategoriaProvider();
  @override
  RecursosDatos modelDataSource = CategoriaDataSource();
  @override
  ModelAbs objModel = new Categoria();

  @override
  Future<bool> addData() async {
    print(
        "Marca para GUARDAR ${this.controllersInputs['categoriaNombre'].text}");
    var objCategoria = objModel.deJsonAObj(
        {'categoria': this.controllersInputs['categoriaNombre'].text});
    return await modelProvider.addData(objCategoria);
  }

  @override
  deteleData() async {
    print("ID para ELIMINAR ${this.objModel.id}");
    var objCategoria = objModel.deJsonAObj({'id_categoria': this.objModel.id});
    if (await modelProvider.deleteData(objCategoria)) {
      modelDataSource.lista = await getData();
      messageError('Se elimino la categoria con exito');
      print("marcaDataSource.updateDataGridSource(); ");
      modelDataSource.updateDataGridSource();
      Navigator.pop(context);
    } else {
      messageOk('No se elimino');
    }
  }

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list =
        await modelProvider.getData(model: Categoria()..id = id);
    return list.cast<Categoria>();
  }

  @override
  Future<bool> saveChanges() async {
    return false;
  }

  String validarInput(String val) {
    v.listaReglas.clear();
    v.listaReglas.add(v.esVacio(val, "El campo esta vacio"));
    v.listaReglas.add(v.valorMinimo(val, "El nombre es muy corto", 2));
    v.listaReglas.add(v.soloLetrasSinEspacios(val, "Solo letras"));

    return v.evaluarReglas();
  }

  @override
  void onInit() {
    this.controllersInputs['categoriaNombre'] = new TextEditingController();
    super.onInit();
  }
}
