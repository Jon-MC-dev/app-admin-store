import 'package:app4/src/controllers/producto_controller.dart';
import 'package:app4/src/widgets/list_view_fotos.dart';
import 'package:app4/src/widgets/tabla_detalles.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class FormProducto extends StatelessWidget {
  final ProductoController c = Get.put(ProductoController());
  final List<DropdownMenuItem> cats = [];
  final List<DropdownMenuItem> mars = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Obx(() {
                  if (c.listaCategorias.isNotEmpty && cats.isEmpty) {
                    c.listaCategorias.forEach((element) {
                      cats.add(DropdownMenuItem(
                        child: Text(element.nombre),
                        value: element.id,
                      ));
                    });
                  }
                  return c.listaCategorias.isEmpty
                      ? Text("Cargando")
                      : SearchableDropdown.single(
                          items: cats,
                          underline: Container(
                            height: 1.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF008065),
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              //borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          //value: c.valorCategoria.value,
                          onChanged: c.onChangeSelectCategoria,
                          hint: "Selecciona la categoria",
                          searchHint: "Selecciona una categoria",
                          isExpanded: true,
                        );
                }),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Obx(() {
                  if (c.listaMarcas.isNotEmpty && mars.isEmpty) {
                    c.listaMarcas.forEach((element) {
                      mars.add(DropdownMenuItem(
                        child: Text(element.nombre),
                        value: element.id,
                      ));
                    });
                  }
                  return c.listaMarcas.isEmpty
                      ? Text("Cargando")
                      : SearchableDropdown.single(
                          items: mars,
                          //value: c.valorMarca.value,
                          onChanged: c.onChangeSelectMarca,
                          underline: Container(
                            height: 1.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF008065),
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                            ),
                          ),
                          hint: "Selecciona la marca",
                          searchHint: "Selecciona una marca",
                          isExpanded: true,
                        );
                }),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CampoTexto(
            label: 'Modelo',
            controllerText: c.controllersInputs['modelo'],
            validador: c.reglaModelo,
          ),
          Row(
            children: [
              Expanded(
                child: CampoTexto(
                  label: 'Existencias',
                  maxLength: 4,
                  controllerText: c.controllersInputs['existencias'],
                  validador: c.existencias,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CampoTexto(
                  label: 'Precio',
                  maxLength: 5,
                  controllerText: c.controllersInputs['precio'],
                  validador: c.precio,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CampoTexto(
            label: 'Descripcion',
            maxLines: 3,
            maxLength: 250,
            controllerText: c.controllersInputs['descripcion'],
          ),
          CampoTexto(
            label: 'Codigo barras',
            controllerText: c.controllersInputs['codigo_barras'],
            suffixIcon: IconButton(
              onPressed: c.scanBarcodeNormal,
              icon: Icon(Icons.camera),
            ),
          ),
          Row(
            children: [
              Text("Detalles adicionales "),
              IconButton(
                  icon: Icon(Icons.loupe_rounded), onPressed: c.openDetalle)
            ],
          ),
          Obx(() => TablaDetalles(
                detalles: c.listaDetalles,
                detalleDataSource: c.detalleDataSource,
                openEdit: c.openDetalle,
              )),
          ListFotos(
            listaImajenes: c.listaImajenes,
          ),
          SizedBox(
            height: 25.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar Producto"),
            color: Colors.green,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
