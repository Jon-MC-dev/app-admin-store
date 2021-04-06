import 'package:app4/src/controllers/producto_controller.dart';
import 'package:app4/src/forms/productos_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/base_tabla.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductosPage extends KFDrawerContent {
  @override
  _ProductosPage createState() => _ProductosPage();
}

class _ProductosPage extends State<ProductosPage> {
  final ProductoController c = Get.put(ProductoController());

  @override
  Widget build(BuildContext context) {
    return BaseTabla(
      nombreTabla: 'Productos',
      form: FormProducto(),
      widgetMenuKFDrawer: widget,
      modoColumna: ColumnWidthMode.none,
      controller: c,
      namesColumns: [
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'categoria', 'label': 'Categoria'},
        {'tipo': 'texto', 'mappingName': 'marca', 'label': 'Marca'},
        {'tipo': 'texto', 'mappingName': 'modelo', 'label': 'Modelo'},
        {'tipo': 'texto', 'mappingName': 'existencias', 'label': 'Existencias'},
        {'tipo': 'texto', 'mappingName': 'precio', 'label': 'Precio'},
        {'tipo': 'texto', 'mappingName': 'descripcion', 'label': 'Descripcion'},
        {'tipo': 'texto', 'mappingName': 'codigo_barras', 'label': 'Codigo'},
        {
          'tipo': 'texto',
          'mappingName': 'detalles_adicionales',
          'label': 'Detalles'
        }
      ],
    );
  }
}
