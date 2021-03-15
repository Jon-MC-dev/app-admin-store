//import 'package:flutter/material.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Persona implements ModelAbs {
  @override
  int id;
  int get getID => id;

  String nombre, apellidoPaterno, apellidoMaterno, fechaNaci, sexo;

  Persona(
      {this.id,
      this.nombre,
      this.apellidoPaterno,
      this.apellidoMaterno,
      this.fechaNaci,
      this.sexo});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "nombre": this.nombre,
      "apellido_paterno": this.apellidoPaterno,
      "apellido_materno": this.apellidoMaterno,
      "fechaNaci": this.fechaNaci,
      "sexo": this.sexo
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json) {
    print("${json['id_persona']} + ${json['nombre']}");
    Persona persona = Persona();
    persona.id = json['id_persona'];
    persona.nombre = json['nombre'];
    persona.apellidoPaterno = json['apellido_paterno'];
    persona.apellidoMaterno = json['apellido_materno'];
    persona.fechaNaci = json['fechaNaci'];
    persona.sexo = json['sexo'];
    return persona;
  }
}
/*

class MarcaDataSource extends DataGridSource<PersonaUsuario> {
  List<PersonaUsuario> lista;
  MarcaDataSource({this.lista});
  @override
  List<PersonaUsuario> get dataSource => lista;
  setlista(lista) {
    this.lista = lista;
  }

  @override
  Object getValue(PersonaUsuario marca, String nombreColumna) {
    switch (nombreColumna) {
      case 'id':
        return marca.getID;
        break;
      case 'nombre':
        return marca.nombre;
        break;
      case 'apellido_paterno':
        return marca.apellidoPaterno;
        break;
      case 'apellido_materno':
        return marca.apellidoMaterno;
        break;
      case 'fechaNaci':
        return marca.fechaNaci;
        break;
      case 'sexo':
        return marca.sexo;
        break;
    }
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

 */
