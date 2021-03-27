import 'package:app4/src/controllers/producto_controller.dart';
import 'package:app4/src/forms/productos_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/base_tabla.dart';

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
      controller: c,
      namesColumns: [
        /*
        {'tipo': 'numerico', 'mappingName': 'id', 'label': 'ID'},
        {'tipo': 'texto', 'mappingName': 'nombre', 'label': 'Nombre'}
        */
      ],
    );
  }
}
