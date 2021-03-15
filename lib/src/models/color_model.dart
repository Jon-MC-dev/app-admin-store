import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Color implements ModelAbs {
  @override
  int id;
  int get getID => id;

  String color;
  String codigo;

  Color({this.id, this.color, this.codigo});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "color": this.color,
      "codigo": this.codigo,
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json) {
    print("${json['id_color']} + ${json['color']} + ${json['codigo']}");
    Color color = Color();
    color.id = json['id_color'];
    color.color = json['color'];
    color.codigo = json['codigo'];
    return color;
  }
}

class ColorDataSource extends RecursosDatos {
  @override
  Object getValue(ModelAbs model, String nombreColumna) {
    Color color = model; // bajar hasta el hijo
    switch (nombreColumna) {
      case 'id':
        return color.id;
        break;
      case 'color':
        return color.color;
        break;
      case 'codigo':
        return color.codigo;
        break;
    }
  }

  @override
  List<Color> get dataSource => lista;

  @override
  setlista(List<ModelAbs> lista) {
    this.lista = lista;
  }

  @override
  void updateDataGridSource() {
    notifyListeners();
  }
}
