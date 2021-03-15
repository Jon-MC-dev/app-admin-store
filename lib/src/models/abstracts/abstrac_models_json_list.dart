import 'package:app4/src/models/abstracts/abstrac_model.dart';

class ModelsAbs {
  List<ModelAbs> listaModels = <ModelAbs>[];
  ModelAbs model;
  ModelsAbs();

  deJsonALista(List<dynamic> lista) {
    if (lista == null) return;
    for (var item in lista) {
      final obj = model.deJsonAObj(item);
      listaModels.add(obj);
    }
  }
}
