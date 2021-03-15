import 'package:syncfusion_flutter_datagrid/datagrid.dart';

abstract class ModelAbs {
  int _id = 0;

  Map<String, dynamic> getDataJson();

  int get id => _id;

  set id(int id) {
    this._id = id;
  }

  deJsonAObj(Map<String, dynamic> json);
}

abstract class RecursosDatos extends DataGridSource<ModelAbs> {
  List<ModelAbs> lista;
  setlista(List<ModelAbs> lista);
  void updateDataGridSource();
  @override
  Object getValue(ModelAbs model, String nombreColumna);
}
