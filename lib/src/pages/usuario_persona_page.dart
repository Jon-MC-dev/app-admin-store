import 'package:app4/src/controllers/usuario_persona_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/base_tabla.dart';

class UsuarioPersonaPage extends KFDrawerContent {
  @override
  _UsuarioPersonaPagePage createState() => _UsuarioPersonaPagePage();
}

class _UsuarioPersonaPagePage extends State<UsuarioPersonaPage> {
  final UsuarioPersonaController c = Get.put(UsuarioPersonaController());

  @override
  Widget build(BuildContext context) {
    return BaseTabla(
      nombreTabla: 'Personas',
      form: Text("Usuario persona form"),
      widgetMenuKFDrawer: widget,
      controller: c,
      namesColumns: [
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'nombre', 'label': 'Nombre'}
      ],
    );
  }
}
