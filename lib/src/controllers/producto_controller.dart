import 'package:flutter/material.dart';
import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/categoria_providers.dart';
import 'package:get/get.dart';

class ProductoController extends AbstractController {
  @override
  ProviderAbs modelProvider = CategoriaProvider();
  @override
  RecursosDatos modelDataSource = CategoriaDataSource();
  @override
  ModelAbs objModel = new Categoria();

  RxString valorCategoria = 'Categoria 1'.obs;

  @override
  Future<bool> addData() async {
    return false;
  }

  @override
  deteleData() async {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    return <Categoria>[];
  }

  @override
  Future<bool> saveChanges() async {
    return false;
  }

  @override
  void cleanForm() {}

  void onChangeSelectCategoria(dynamic value) {
    print(value);
  }
}
