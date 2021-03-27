import 'package:app4/src/controllers/color_controller.dart';
import 'package:app4/src/forms/colores_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/base_tabla.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ColoresPage extends KFDrawerContent {
  @override
  _ColoresPage createState() => _ColoresPage();
}

class _ColoresPage extends State<ColoresPage> {
  final ColorController c = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return BaseTabla(
      celdasSyle: (QueryCellStyleArgs args) {
        if (args.column.mappingName == 'codigo') {
          return DataGridCellStyle(
              textStyle: TextStyle(
                fontStyle: FontStyle.italic,
                inherit: true,
                //fontSize: 48.0,
                color: Colors.white,
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.black),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black),
                ],
              ),
              backgroundColor: Color(int.parse("0xFF${args.cellValue}")));
        }
      },
      nombreTabla: 'Colores',
      form: FormColores(),
      widgetMenuKFDrawer: widget,
      controller: c,
      namesColumns: [
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'color', 'label': 'Color'},
        {'tipo': 'texto', 'mappingName': 'codigo', 'label': 'Codigo Color'}
      ],
    );
  }
}
