//import 'package:flutter/material.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_model.dart';
import 'package:app4/src/models/usuario_model.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PersonaUsuario implements ModelAbs {
  @override
  int id;
  int get getID => id;
  Persona persona;
  Usuario usuario;

  PersonaUsuario({this.id, this.persona, this.usuario});

  @override
  deJsonAObj(Map<String, dynamic> json) {
    PersonaUsuario perUser = new PersonaUsuario();
    perUser.persona = this.persona.deJsonAObj(json);
    perUser.usuario = this.usuario.deJsonAObj(json);
    return perUser;
  }

  @override
  Map<String, dynamic> getDataJson() {
    return {};
  }
}

class PersonaUsuarioDataSource extends RecursosDatos {
  @override
  Object getValue(ModelAbs model, String nombreColumna) {
    PersonaUsuario perUser = model; // bajar hasta el hijo
    switch (nombreColumna) {
      case 'id':
        return perUser.id;
        break;
      case 'nombre':
        return perUser.persona.nombre;
        break;
      case 'apellido_paterno':
        return perUser.persona.apellidoPaterno;
        break;
      case 'apellido_materno':
        return perUser.persona.apellidoMaterno;
        break;
      case 'sexo':
        return perUser.persona.sexo;
        break;
      case 'usuario':
        return perUser.usuario.usuario;
        break;
      case 'pass':
        return perUser.usuario.contrasena;
        break;
      case 'permisos':
        return perUser.usuario.permisos;
        break;
    }
  }

  @override
  List<PersonaUsuario> get dataSource => lista;

  @override
  setlista(List<ModelAbs> lista) {
    this.lista = lista;
  }

  @override
  void updateDataGridSource() {
    notifyListeners();
  }
}
