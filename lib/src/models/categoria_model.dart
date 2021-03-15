import 'package:app4/src/models/abstracts/abstrac_model.dart';

class Categoria extends ModelAbs {
  @override
  int id;
  int get getID => id;

  String nombre;

  Categoria({this.id, this.nombre});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "nombre": this.nombre,
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json) {
    print("${json['id_categoria']} + ${json['categoria']}");
    Categoria marca = Categoria();
    marca.id = json['id_categoria'];
    marca.nombre = json['categoria'];
    return marca;
  }
}

class CategoriaDataSource extends RecursosDatos {
  @override
  Object getValue(ModelAbs model, String nombreColumna) {
    Categoria categoria = model; // bajar hasta el hijo
    switch (nombreColumna) {
      case 'id':
        return categoria.id;
        break;
      case 'nombre':
        return categoria.nombre;
        break;
    }
  }

  @override
  List<Categoria> get dataSource => lista;

  @override
  setlista(List<ModelAbs> lista) {
    this.lista = lista;
  }

  @override
  void updateDataGridSource() {
    notifyListeners();
  }
}
