import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/models/color_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/color_providers.dart';
import 'package:flutter/material.dart';

class ColorController extends AbstractController {
  @override
  ProviderAbs modelProvider = ColorProvider();
  @override
  RecursosDatos modelDataSource = new ColorDataSource();
  @override
  ModelAbs objModel = new Categoria();

  @override
  Future<bool> addData() async {
    return false;
  }

  @override
  deteleData() async {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list = await modelProvider.getData(model: Color()..id = id);
    return list.cast<Color>();
  }

  @override
  Future<bool> saveChanges() async {
    return false;
  }

  @override
  void onInit() {
    this.controllersInputs['categoriaNombre'] = new TextEditingController();
    super.onInit();
  }

  @override
  void cleanForm() {
    // TODO: implement cleanForm
  }
}
