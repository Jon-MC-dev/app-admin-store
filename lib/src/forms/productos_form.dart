import 'package:app4/src/controllers/producto_controller.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class FormProducto extends StatelessWidget {
  final ProductoController c = Get.put(ProductoController());
  final List<DropdownMenuItem> items = [];
  FormProducto() {
    items.add(DropdownMenuItem(
      child: Text('Categoria 1'),
      value: 'Categoria 1',
    ));
    items.add(DropdownMenuItem(
      child: Text('Categoria 2'),
      value: 'Categoria 2',
    ));
    items.add(DropdownMenuItem(
      child: Text('Categoria 3'),
      value: 'Categoria 3',
    ));
    items.add(DropdownMenuItem(
      child: Text('Categoria 4'),
      value: 'Categoria 4',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampoTexto(
            label: 'Producto',
          ),
          Obx(() => SearchableDropdown.single(
                items: items,
                value: c.valorCategoria.value,
                onChanged: c.onChangeSelectCategoria,
                hint: "Selecciona la marca",
                searchHint: "Selecciona una marca",
                isExpanded: true,
              )),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar Producto"),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
