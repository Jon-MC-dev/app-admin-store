//import 'package:flutter/material.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Usuario implements ModelAbs {
  @override
  int id;
  int get getID => id;

  String usuario, contrasena;
  Map<String, dynamic> permisos;

  Usuario({this.id, this.usuario, this.contrasena, this.permisos});

  @override
  Map<String, dynamic> getDataJson() {
    return {
      "id": this.id,
      "usuario": this.usuario,
      "contrasena": this.contrasena,
      "permisos": this.permisos,
    };
  }

  @override
  deJsonAObj(Map<String, dynamic> json) {
    print("${json['usuario']} + ${json['contrasena']}");
    Usuario persona = Usuario();
    persona.id = json['id_persona'];
    persona.usuario = json['usuario'];
    persona.contrasena = json['contrasena'];
    persona.permisos = json['permisos'];
    return persona;
  }
}
