//import 'package:flutter/material.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PersonaUsuario implements ModelAbs {
  @override
  int id;
  int get getID => id;

  @override
  deJsonAObj(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> getDataJson() {
    return {};
  }
}
