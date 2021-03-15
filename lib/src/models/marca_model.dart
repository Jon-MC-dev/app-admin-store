//import 'package:flutter/material.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Marca implements ModelAbs {
  @override
  int id;
  int get getID => id;

  String nombre;

  Marca({this.id, this.nombre});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "nombre": this.nombre,
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json) {
    print("${json['id_marca']} + ${json['marca']}");
    Marca marca = Marca();
    marca.id = json['id_marca'];
    marca.nombre = json['marca'];
    return marca;
  }
}

class MarcaDataSource extends DataGridSource<Marca> {
  List<Marca> lista;
  MarcaDataSource({this.lista});
  @override
  List<Marca> get dataSource => lista;
  setlista(lista) {
    this.lista = lista;
  }

  @override
  Object getValue(Marca marca, String nombreColumna) {
    switch (nombreColumna) {
      case 'id':
        return marca.getID;
        break;
      case 'nombre':
        return marca.nombre;
        break;
    }
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
