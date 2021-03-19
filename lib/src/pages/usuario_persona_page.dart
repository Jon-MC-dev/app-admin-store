import 'package:app4/src/controllers/usuario_persona_controller.dart';
import 'package:app4/src/forms/persona_usuario_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/base_tabla.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
      form: FormPersonaUsuario(),
      widgetMenuKFDrawer: widget,
      controller: c,
      modoColumna: ColumnWidthMode.none,
      namesColumns: [
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'nombre', 'label': 'Nombre'},
        {
          'tipo': 'texto',
          'mappingName': 'apellido_paterno',
          'label': 'Apellido Paterno'
        },
        {
          'tipo': 'texto',
          'mappingName': 'apellido_materno',
          'label': 'Apellido Materno'
        },
        {'tipo': 'texto', 'mappingName': 'sexo', 'label': 'Sexo'},
        {'tipo': 'texto', 'mappingName': 'usuario', 'label': 'Usuario'},
        {'tipo': 'texto', 'mappingName': 'pass', 'label': 'Contraseña'},
        {'tipo': 'texto', 'mappingName': 'permisos', 'label': 'Permisos'}
      ],
    );
  }
}
