import 'dart:convert';

import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/models/marca_model.dart';
import 'package:app4/src/providers/categoria_providers.dart';
import 'package:app4/src/providers/marcas_providers.dart';

class Producto extends ModelAbs {
  @override
  int id;
  int get getID => id;
  Categoria categoria;
  Marca marca;
  String modelo;
  int existencias;
  double precio;
  String descripcion;
  String codigoBarras;
  String detallesAdicionales;

  Producto({this.id, this.categoria});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "id_categoria": this.categoria,
      "id_marca": this.marca,
      "modelo": this.modelo,
      "existencias": this.existencias,
      "precio": this.precio,
      "descripcion": this.descripcion,
      "codigo_barras": this.codigoBarras,
      "detalles_adicionales": this.detallesAdicionales,
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json, {conIds = true}) {
    print("ID: ${json['id_categoria']} , ${json['modelo']}");
    Producto producto = Producto();
    producto.id = json["id_producto"];
    if (conIds) {
      getObjCategoria(json).then((value) {
        producto.categoria = value;
      });
      getObjMarca(json).then((value) {
        producto.marca = value;
      });
    } else {
      producto.categoria = new Categoria();
      producto.marca = new Marca();
    }

    producto.modelo = json["modelo"];
    producto.existencias = json["existencias"].runtimeType == int
        ? json["existencias"]
        : int.parse(json["existencias"]);
    producto.precio = json["precio"].runtimeType == double ||
            json["precio"].runtimeType == int
        ? json["precio"]
        : double.parse(json["precio"]);
    producto.descripcion = json["descripcion"];
    producto.codigoBarras = json["codigo_barras"];
    producto.detallesAdicionales = json["detalles_adicionales"];
    return producto;
  }

  Future<Categoria> getObjCategoria(Map<String, dynamic> json) async {
    List<ModelAbs> cat = await CategoriaProvider()
        .getData(model: Categoria(id: json["id_categoria"]));
    return cat[0];
  }

  Future<Marca> getObjMarca(Map<String, dynamic> json) async {
    List<ModelAbs> mar =
        await MarcasProvider().getData(model: Marca(id: json["id_marca"]));
    return mar[0];
  }
}

class ProductoDataSource extends RecursosDatos {
  @override
  Object getValue(ModelAbs model, String nombreColumna) {
    Producto producto = model; // bajar hasta el hijo
    switch (nombreColumna) {
      case 'id':
        return producto.id;
        break;
      case 'categoria':
        return producto.categoria.nombre;
        break;
      case 'marca':
        return producto.marca.nombre;
        break;
      case 'modelo':
        return producto.modelo;
        break;
      case 'existencias':
        return producto.existencias;
        break;
      case 'precio':
        return producto.precio;
        break;
      case 'descripcion':
        return producto.descripcion;
        break;
      case 'codigo_barras':
        return producto.codigoBarras;
        break;
      case 'detalles_adicionales':
        return producto.detallesAdicionales;
        break;
    }
  }

  @override
  List<Producto> get dataSource => lista;

  @override
  setlista(List<ModelAbs> lista) {
    this.lista = lista;
  }

  @override
  void updateDataGridSource() {
    notifyListeners();
  }
}
