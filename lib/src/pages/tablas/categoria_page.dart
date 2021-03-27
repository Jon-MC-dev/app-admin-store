import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/controllers/categoria_controller.dart';
import 'package:app4/src/forms/categoria_form.dart';
import 'package:app4/src/widgets/base_tabla.dart';

class CategoriaPage extends KFDrawerContent {
  @override
  _CategoriaPage createState() => _CategoriaPage();
}

class _CategoriaPage extends State<CategoriaPage> {
  final CategoriaController c = Get.put(CategoriaController());

  @override
  Widget build(BuildContext context) {
    return BaseTabla(
      nombreTabla: 'Categoria',
      form: FormCategoria(),
      widgetMenuKFDrawer: widget,
      controller: c,
      namesColumns: [
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'nombre', 'label': 'Nombre'}
      ],
    );
  }
}
